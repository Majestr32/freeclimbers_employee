part of 'branch_registration_bloc.dart';

@freezed
class BranchRegistrationState with _$BranchRegistrationState {
  const factory BranchRegistrationState.initial() = _InitialState;
  const factory BranchRegistrationState.error({required CustomError error, required BranchQrData? branchData}) = _ErrorState;
  const factory BranchRegistrationState.foundBranch({required BranchQrData? branchData, required AppDocuments? documents}) = _FoundBranchState;
  const factory BranchRegistrationState.added({required BranchQrData branchData, required RequiredFields requiredFields}) = _AddedState;
  const factory BranchRegistrationState.rejected() = _RejectedState;
}
