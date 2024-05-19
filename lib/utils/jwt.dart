import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String generateJwt(){
  final jwt = JWT(
    {
      "iss": "APSS",
      "aud": "FreeclimberApp",
      "iat": DateTime.now().millisecondsSinceEpoch,
      "exp": DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch,
      "nbf": DateTime.now().subtract(Duration(minutes: 1)).millisecondsSinceEpoch
    },
    header: {
      "alg": "HS512",
      "typ": "JWT"
    },
  );

  final res = jwt.sign(SecretKey('WI0tg2PMjMtNUK7uIW9vh3E4XHp7PxBr'), algorithm: JWTAlgorithm.HS512, noIssueAt: true);
  return res;
}