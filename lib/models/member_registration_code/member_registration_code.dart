import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'member_registration_code.freezed.dart';
part 'member_registration_code.g.dart';

@freezed
class MemberRegistrationCode with _$MemberRegistrationCode {
  const factory MemberRegistrationCode({
    required String code,
    required String qrcode,
  }) = _MemberRegistrationCode;

  factory MemberRegistrationCode.fromJson(Map<String, Object?> json)
      => _$MemberRegistrationCodeFromJson(json);
}