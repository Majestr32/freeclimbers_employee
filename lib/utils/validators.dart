import 'dart:developer';

class AppValidators{
  static String? email(String? val){
    val!;
    if(val.contains('@') && val.length > 4){
      return null;
    }
    return 'Email is not valid';
  }
  static String? zip(String? val){
    val!;
    if(val.length > 9){
      return 'Zip code is not valid';
    }
    return null;
  }
  static String? date(String? val){
    val!;
    if(val.length > 8 && val.split(".").length == 3){
      return null;
    }
    return 'Date must have the same format as in example';
  }
  static String? notEmpty(String? val){
    val!;
    if(val.isEmpty){
      return 'Mandatory fields can`t be empty';
    }
    return null;
  }
  static String? phone(String? val){
    val!;
    RegExp phoneExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
    if(phoneExp.hasMatch(val)){
      return 'Phone number is not valid';
    }
    return null;
  }
}