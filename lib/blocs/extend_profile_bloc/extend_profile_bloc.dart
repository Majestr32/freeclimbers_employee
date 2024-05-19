import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freeclimbers_employee/custom_error.dart';
import 'package:freeclimbers_employee/models/branch_qr_data/branch_qr_data.dart';
import 'package:freeclimbers_employee/models/member_data/member_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/required_fields/required_fields.dart';
import '../../repositories/app/app_repository.dart';
import '../../repositories/member/member_repository.dart';
import '../branches_cubit/branches_cubit.dart';
import '../member_cubit/member_cubit.dart';

part 'extend_profile_event.dart';
part 'extend_profile_state.dart';
part 'extend_profile_bloc.freezed.dart';

class ExtendProfileBloc extends Bloc<ExtendProfileEvent, ExtendProfileState> {
  final MemberCubit _memberCubit;
  final AppRepository _appRepository;
  final BranchesCubit _branchesCubit;

  ExtendProfileBloc({
    required BranchesCubit branchesCubit,
    required AppRepository appRepository,
    required RequiredFields requiredFields,
    required BranchQrData qrData,
    required MemberCubit memberCubit}) :
        _appRepository = appRepository,
        _branchesCubit = branchesCubit,
        _memberCubit = memberCubit,
        super(ExtendProfileState.initial(memberFields: memberCubit.state.memberData!, company: qrData.company, requiredBranchFields: requiredFields, branchNo: qrData.no, branchId: qrData.id)) {
    on<ExtendProfileEvent>(_mapExtendProfileToState);
    add(ExtendProfileEvent.checkIfProblemExist(memberData: memberCubit.state.memberData!));
  }

  Future<void> _mapExtendProfileToState(ExtendProfileEvent event, Emitter<ExtendProfileState> emit) => event.map(
      checkIfProblemExist: (e) => _checkIfProblemExist(e,emit),
      extendProfile: (e) => _extendProfile(e,emit));

  Future<void> _checkIfProblemExist(_CheckIfProblemExistEvent event, Emitter<ExtendProfileState> emit) async{
    try{
      await _branchesCubit.addBranch(state.branchId!, state.branchNo!);
      await _appRepository.setSelectedBranchId(state.branchNo!);
      emit(const ExtendProfileState.conflictResolved());
    }on CustomError catch(e){
      emit(ExtendProfileState.identifiedProblem(memberFields: event.memberData, company: state.company!, requiredBranchFields: RequiredFields.fromError(e.targets), branchId: state.branchId!, branchNo: state.branchNo!));
    }
  }

  Future<void> _extendProfile(_ExtendProfileEvent event, Emitter<ExtendProfileState> emit) async{
    final prevState = state;
    try{
      ExtendProfileState.loading(memberFields: state.memberFields!, company: state.company!, branchNo: state.branchNo!, branchId: state.branchId!, requiredBranchFields: state.requiredBranchFields!);
      await _memberCubit.updateMember(
          company: event.updateFields.company,
          salutationId: event.updateFields.salutationId == null ? null : int.parse(event.updateFields.salutationId!),
          title: event.updateFields.title,
          firstname: event.updateFields.firstname,
          lastname: event.updateFields.lastname,
          street: event.updateFields.street,
          postcode: event.updateFields.postcode == null ? null : int.parse(event.updateFields.postcode!),
          city: event.updateFields.city,
          countryId: event.updateFields.countryId == null ? null : int.parse(event.updateFields.countryId!),
          email: event.updateFields.email,
          phone: event.updateFields.phone,
          birthday: event.updateFields.birthday,
          memberNo: event.updateFields.memberNo,
          username: event.updateFields.username,
          showSuccess: false);
      await _branchesCubit.addBranch(state.branchId!, state.branchNo!);
      await _appRepository.setSelectedBranchId(state.branchNo!);
      emit(const ExtendProfileState.conflictResolved());
    }on CustomError catch(e){
      emit(ExtendProfileState.error(error: e, requiredBranchFields: state.requiredBranchFields!, company: state.company!, memberFields: state.memberFields!, branchId: state.branchId!, branchNo: state.branchNo!));
      emit(prevState);
    }
  }
}
