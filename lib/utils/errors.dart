import 'package:freeclimbers_employee/custom_error.dart';

void throwTimeoutCustomError(){
  throw const CustomError(code: 400, message: 'Timeout', localizationCode: 'timeout');
}