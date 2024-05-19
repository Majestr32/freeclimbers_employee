part of 'app_cubit.dart';

enum AppStateStatus {
  initial,
  loaded,
  changingBranch,
  changedBranch,
  error
}

class AppState extends Equatable {
  final AppStateStatus status;
  final AppSettings? settings;
  final int? selectedBranchId;
  final AppDocuments? documents;

  final Uint8List? branchIcon;
  final CustomError? error;

  Uint8List? get branchIconOrDefault => branchIsSelected ? branchIcon : null;

  bool get branchIsSelected => selectedBranchId != null && selectedBranchId != 0;

  factory AppState.initial(){
    return const AppState(status: AppStateStatus.initial,);
  }

  const AppState({
    required this.status,
    this.settings,
    this.selectedBranchId,
    this.documents,
    this.branchIcon,
    this.error,
  });

  AppState copyWith({
    AppStateStatus? status,
    AppSettings? settings,
    int? selectedBranchId,
    AppDocuments? documents,
    Uint8List? branchIcon,
    CustomError? error,
  }) {
    return AppState(
      status: status ?? this.status,
      settings: settings ?? this.settings,
      selectedBranchId: selectedBranchId ?? this.selectedBranchId,
      documents: documents ?? this.documents,
      branchIcon: branchIcon ?? this.branchIcon,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [status, settings, selectedBranchId, documents, branchIcon, error,];
}
