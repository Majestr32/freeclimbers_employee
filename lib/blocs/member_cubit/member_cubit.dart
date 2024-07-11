import 'dart:convert';
import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:climbers/custom_error.dart';
import 'package:climbers/models/access_token/access_token.dart';
import 'package:climbers/models/member_data/member_data.dart';
import 'package:climbers/models/member_registration_code/member_registration_code.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/member/member_repository.dart';
import '../../repositories/membercard/membercard_repository.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  final MemberRepository _memberRepository;
  final MemberCardRepository? _memberCardRepository;

  ///Sets state of authentication between [MemberStateStatus.unauthenticated] and [MemberStateStatus.authenticated]
  Future<void> fetchAuthenticationSession() async{
    final jwtToken = _memberRepository.getJwtAuthToken();
    if(jwtToken == null){
      emit(MemberState.unauthenticated());
    }else{
      try{
        await _fetchMemberData(jwtToken);
        final newToken = await _memberRepository.refreshToken(oldToken: jwtToken);
        emit(state.copyWith(accessToken: newToken));
      }on CustomError catch(e){
        _memberRepository.clearAccessToken();
        emit(MemberState.unauthenticated());
      }
    }
  }

  Future<void> changeLogoUrl({required Uint8List imgBytes}) async{
    final previousStatus = state.status;
    try{
      await _memberRepository.changeLogoUrl(imgBytes: imgBytes, token: state.accessToken!);
      emit(state.copyWith(status: MemberStateStatus.updateOperationSuccess));
      emit(state.copyWith(profileImage: imgBytes, status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> removeLogo() async{
    final previousStatus = state.status;
    try{
      await _memberRepository.removeLogo(token: state.accessToken!);
      emit(state.copyWith(status: MemberStateStatus.updateOperationSuccess));
      emit(state.removeImage().copyWith(status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> updateMember({String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username, bool showSuccess = true}) async{
    final previousStatus = state.status;
    try{
      await _memberRepository.updateMember(company: company, salutationId: salutationId, title: title, firstname: firstname, lastname: lastname, street: street, postcode: postcode, city: city, countryId: countryId, email: email, phone: phone, birthday: birthday, memberNo: memberNo, username: username, token: state.accessToken!);
      if(showSuccess){
        emit(state.copyWith(status: MemberStateStatus.updateOperationSuccess));
      }
      emit(state.copyWith(memberData: state.memberData!.copyWith.call(company: company, salutationId: salutationId?.toString(), title: title, firstname: firstname, lastname: lastname, street: street, postcode: postcode?.toString() ?? '', city: city, countryId: countryId?.toString(), email: email, phone: phone, birthday: birthday, memberNo: memberNo, username: username), status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> logout({bool saveAuthStatus = false}) async{
    if(state.accessToken == null){
      return;
    }
    if(!saveAuthStatus){
      await _memberRepository.logout(token: state.accessToken!);
    }
    emit(state.copyWith(status: MemberStateStatus.unauthenticated));
  }

  Future<void> registerMember({String? branchId, String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username, String? password,String? passwordRepeat, int? categoryId, String? languageCode, bool? newsLetter, bool? acceptApsTerms, bool? acceptBranchTerms}) async{
    final previousStatus = state.status;
    try{
      emit(state.copyWith(status: MemberStateStatus.loading));
      final qr = await _memberRepository.registerMember(branchId: branchId, company: company, salutationId: salutationId, title: title, firstname: firstname, lastname: lastname, street: street, postcode: postcode, city: city, countryId: countryId, email: email, phone: phone, birthday: birthday, memberNo: memberNo, username: username, password: password, passwordRepeat: passwordRepeat, categoryId: categoryId, languageCode: languageCode, newsLetter: newsLetter, acceptApsTerms: acceptApsTerms, acceptBranchTerms: acceptBranchTerms, );
      final memberRegCode = qr == null ? null : MemberRegistrationCode(code: qr, qrcode: qr);
      //Use this token only to access registration qr code
      emit(state.copyWith(memberRegistrationCode: memberRegCode,status: MemberStateStatus.registrationSuccess));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> getNewWalletPass(String branchId) async{
    final previousStatus = state.status;
    try{
      final pass = await _memberRepository.getWalletPass(token: state.accessToken!, branchId: branchId);
      emit(state.copyWith(status: MemberStateStatus.memberCardDownloaded,  passFile: pass));
      emit(state.copyWith(status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> signIn({required String email, required String password}) async{
    final previousStatus = state.status;
    try{
      emit(state.copyWith(status: MemberStateStatus.loading));
      final token = await _memberRepository.signIn(email: email, password: password, );
      await _fetchMemberData(token);
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> _fetchMemberData(AccessToken token) async{
    try{
      final memberData = await _memberRepository.getMemberData(token: token, );
      final profileImageBase64 = await _memberRepository.getMemberImage(token: token, );

      final regCode = await _memberRepository.getRegistrationCode(token: token, );
      emit(state.copyWith(accessToken: token, memberRegistrationCode: regCode, memberData: memberData,status: MemberStateStatus.authenticated, profileImage: profileImageBase64 == null ? null : base64Decode(profileImageBase64)));
    }on CustomError catch(e){
      return;
    }
  }

  Future<void> openMemberCard() async{
    await _memberCardRepository!.openPkPass(state.passFile!.readAsBytesSync());
  }

  Future<void> updateMemberPassword({required String oldPassword, required String newPassword, required String newPasswordRepeat}) async{
    final previousStatus = state.status;
    try{
      await _memberRepository.updateMemberPassword(oldPassword: oldPassword, newPassword: newPassword, newPasswordRepeat: newPasswordRepeat, token: state.accessToken!, );
      emit(state.copyWith(status: MemberStateStatus.updateOperationSuccess));
      emit(state.copyWith(status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  Future<void> resetPassword({required String email}) async{
    final previousStatus = state.status;
    try{
      await _memberRepository.resetPassword(email: email, );
      emit(state.copyWith(status: MemberStateStatus.sentEmail));
      emit(state.copyWith(status: previousStatus));
    }on CustomError catch(e){
      emitError(previousStatus, e);
    }
  }

  void goBackToSignIn(){
    emit(MemberState.unauthenticated());
  }

  void emitError(MemberStateStatus previousStatus,CustomError e){
    emit(state.copyWith(error: e, status: MemberStateStatus.error));
    emit(state.copyWith(status: previousStatus));
  }

  MemberCubit({
    required MemberRepository memberRepository,
    MemberCardRepository? memberCardRepository
  }) : _memberRepository = memberRepository, _memberCardRepository = memberCardRepository, super(MemberState.initial()){

  }
}
