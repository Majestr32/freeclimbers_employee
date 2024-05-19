import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:freeclimbers_employee/data/shared_prefs/app_shared_prefs_contract.dart';
import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/services/member/member_service_contract.dart';
import 'package:flutter/cupertino.dart';

import '../../models/member_data/member_data.dart';
import '../../models/member_registration_code/member_registration_code.dart';

class MemberRepository{
  final IMemberService _memberService;
  final IAppSharedPrefs? _appSharedPrefs;

  Future<String?> registerMember({String? branchId, String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username, String? password, String? passwordRepeat, int? categoryId, String? languageCode, bool? newsLetter, bool? acceptApsTerms, bool? acceptBranchTerms})
        => _memberService.registerMember(
            branchId: branchId,
            company: company, salutationId: salutationId, title: title, firstname: firstname, lastname: lastname, street: street, postcode: postcode, city: city, countryId: countryId, email: email, phone: phone, birthday: birthday, memberNo: memberNo, username: username, password: password, passwordRepeat: passwordRepeat, categoryId: categoryId, languageCode: languageCode, newsLetter: newsLetter, acceptApsTerms: acceptApsTerms, acceptBranchTerms: acceptBranchTerms);

  Future<void> resetPassword({required String email}) => _memberService.resetPassword(email: email);

  Future<AccessToken> signIn({required String email, required String password, bool saveSession = true}) async{
    final accessToken = await _memberService.signIn(email: email, password: password);
    if(saveSession){
      _appSharedPrefs!.putAccessToken(accessToken);
    }
    return accessToken;
  }
  Future<MemberRegistrationCode> getRegistrationCode({required AccessToken token})
      => _memberService.getRegistrationCode(token: token);
  Future<void> updateMemberPassword({required String oldPassword, required String newPassword, required String newPasswordRepeat, required AccessToken token})
      => _memberService.updateMemberPassword(oldPassword: oldPassword, newPassword: newPassword, newPasswordRepeat: newPasswordRepeat, token: token);

  Future<File> getWalletPass({required AccessToken token, required String branchId}) => _memberService.getWalletPass(token: token, branchId: branchId);
  /// If token is null - not set
  AccessToken? getJwtAuthToken() => _appSharedPrefs?.getAccessToken();

  Future<void> logout({required AccessToken token}) async{
    await _memberService.logout(token: token);
    await _appSharedPrefs!.clearAccessToken();
  }

  Future<void> changeLogoUrl({required Uint8List imgBytes, required AccessToken token}) => _memberService.changeLogoUrl(imgBytes: imgBytes, token: token);

  Future<void> updateMember({String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username,required AccessToken token})
      => _memberService.updateMember(company: company, salutationId: salutationId, title: title, firstname: firstname, lastname: lastname, street: street, postcode: postcode, city: city, countryId: countryId, email: email, phone: phone, birthday: birthday, memberNo: memberNo, username: username, token: token);
  Future<String?> getMemberImage({required AccessToken token}) => _memberService.getMemberImage(token: token);
  Future<void> removeLogo({required AccessToken token}) => _memberService.removeLogo(token: token);
  ///Throws CustomError(code: 401, message: 'Session expired', localizationCode: 'session-expired') if session expired or returns member data
  Future<MemberData> getMemberData({required AccessToken token}) => _memberService.getMemberData(token: token);

  void saveAccessToken(AccessToken token) => _appSharedPrefs?.putAccessToken(token);
  void clearAccessToken() => _appSharedPrefs?.clearAccessToken();

  ///Takes [oldToken], returns refreshed token as well as updates it in shared preferences
  Future<AccessToken> refreshToken({required AccessToken oldToken}) async{
    final newToken = await _memberService.refreshToken(token: oldToken);
    _appSharedPrefs?.putAccessToken(newToken);
    return newToken;
  }

  const MemberRepository({
    required IMemberService memberService,
    IAppSharedPrefs? appSharedPrefs,
  })
      : _memberService = memberService,
        _appSharedPrefs = appSharedPrefs;

}