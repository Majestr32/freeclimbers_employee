import 'package:climbers/services/contact_us/contact_us_service_contract.dart';

class ContactUsRepository{
  final ContactUsService _contactUsService;

  Future<void> sendEmail({required String email, required String subject, required String message}) =>
    _contactUsService.sendEmail(email: email, subject: subject, message: message);

  const ContactUsRepository({
    required ContactUsService contactUsService,
  }) : _contactUsService = contactUsService;
}