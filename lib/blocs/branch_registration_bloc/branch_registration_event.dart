part of 'branch_registration_bloc.dart';

@freezed
class BranchRegistrationEvent with _$BranchRegistrationEvent {
  const factory BranchRegistrationEvent.receivedDataFromScanner({required String data}) = _ReceivedDataFromScannerEvent;
  const factory BranchRegistrationEvent.confirmBranchTerms() = _ConfirmBranchTermsEvent;
  const factory BranchRegistrationEvent.rejectBranchTerms() = _RejectBranchTermsEvent;
}
