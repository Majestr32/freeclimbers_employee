part of 'branches_cubit.dart';

enum BranchesStateStatus {
  initial,
  added,
  loaded
}

class BranchesState extends Equatable {
  final BranchesStateStatus status;
  final List<Branch> branches;
  final String? lastAddedBranchNo;

  String getBranchByNo(String no) {
    return branches
        .firstWhere((b) => b.details.no == no)
        .branchId;
  }

  factory BranchesState.initial(){
    return BranchesState(status: BranchesStateStatus.initial, branches: []);
  }

  const BranchesState({
    required this.status,
    required this.branches,
    this.lastAddedBranchNo,
  });

  BranchesState copyWith({
    BranchesStateStatus? status,
    List<Branch>? branches,
    String? lastAddedBranchNo,
  }) {
    return BranchesState(
      status: status ?? this.status,
      branches: branches ?? this.branches,
      lastAddedBranchNo: lastAddedBranchNo ?? this.lastAddedBranchNo,
    );
  }

  @override
  List<Object?> get props => [status, branches, lastAddedBranchNo];
}
