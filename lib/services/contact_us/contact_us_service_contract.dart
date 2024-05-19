abstract class ContactUsService{
  Future<void> sendEmail({required String email, required String subject, required String message});
}