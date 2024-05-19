part of 'extend_profile_bloc.dart';

@freezed
class ExtendProfileState with _$ExtendProfileState {
  const ExtendProfileState._();

  RequiredFields? get requiredBranchFields => maybeMap(
      identifiedProblem: (state) => state.requiredBranchFields,
      loading: (state) => state.requiredBranchFields,
      initial: (state) => state.requiredBranchFields,
      error: (state) => state.requiredBranchFields,
      orElse: () => null);

  MemberData? get memberFields => maybeMap(
      identifiedProblem: (state) => state.memberFields,
      loading: (state) => state.memberFields,
      initial: (state) => state.memberFields,
      error: (state) => state.memberFields,
      orElse: () => null);

  String? get branchId => maybeMap(
      identifiedProblem: (state) => state.branchId,
      loading: (state) => state.branchId,
      initial: (state) => state.branchId,
      error: (state) => state.branchId,
      orElse: () => null);

  String? get branchNo => maybeMap(
      identifiedProblem: (state) => state.branchNo,
      loading: (state) => state.branchNo,
      initial: (state) => state.branchNo,
      error: (state) => state.branchNo,
      orElse: () => null);

  String? get company => maybeMap(
      identifiedProblem: (state) => state.company,
      loading: (state) => state.company,
      initial: (state) => state.company,
      error: (state) => state.company,
      orElse: () => null);

  const factory ExtendProfileState.initial({required RequiredFields requiredBranchFields, required MemberData memberFields, required String branchNo, required String branchId, required String company}) = _InitialState;
  const factory ExtendProfileState.identifiedProblem({required RequiredFields requiredBranchFields, required MemberData memberFields, required String branchNo, required String branchId, required String company}) = _IdentifiedProblemState;
  const factory ExtendProfileState.loading({required RequiredFields requiredBranchFields, required MemberData memberFields, required String branchNo, required String branchId, required String company}) = _LoadingState;
  const factory ExtendProfileState.conflictResolved() = _ConflictResolvedState;
  const factory ExtendProfileState.error({required CustomError error, required RequiredFields requiredBranchFields, required MemberData memberFields, required String branchNo, required String branchId, required String company}) = _ErrorState;
}
