part of 'contact_us_bloc.dart';

@freezed
class ContactUsEvent with _$ContactUsEvent {
  const factory ContactUsEvent.sendEmail({required String email, required String subject, required String message}) = _SendEmailEvent;
}
