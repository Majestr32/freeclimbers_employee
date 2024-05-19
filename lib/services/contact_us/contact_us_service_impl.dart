import 'package:freeclimbers_employee/custom_error.dart';
import 'package:freeclimbers_employee/services/contact_us/contact_us_service_contract.dart';
import 'package:freeclimbers_employee/utils/dio.dart';
import 'package:dio/dio.dart';

class ContactUsServiceImpl implements ContactUsService{
  final Dio _dio;

  @override
  Future<void> sendEmail({required String email, required String subject, required String message}) async{
    try{
      final result = await _dio.post("$apiHost/app/contact", data: {
        "email": email,
        "subject": subject,
        "message": message
      });
      if(result.data["data"]["send"] == false){
        _throwSendEmailError();
      }
    }on DioError catch(_){
      _throwSendEmailError();
    }

  }

  Never _throwSendEmailError(){
    throw const CustomError(code: 500, message: "Failed to send email", localizationCode: "failed_send_email");
  }

  const ContactUsServiceImpl({
    required Dio dio,
  }) : _dio = dio;
}