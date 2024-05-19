part of 'contact_us_bloc.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const factory ContactUsState.initial() = _InitialState;
  const factory ContactUsState.loading() = _LoadingState;
  const factory ContactUsState.sent() = _SentState;
  const factory ContactUsState.error({required CustomError customError}) = _ErrorState;
}
