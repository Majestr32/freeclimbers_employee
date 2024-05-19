import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/models/member_registration_code/member_registration_code.dart';
import 'package:flutter/cupertino.dart';

import '../../models/member_data/member_data.dart';

abstract class IMemberService{
  Future<String?> registerMember({
    String? branchId,
    String? company,
    int? salutationId,
    String? title,
    String? firstname,
    String? lastname,
    String? street,
    int? postcode,
    String? city,
    int? countryId,
    String? email,
    String? phone,
    String? birthday,
    String? memberNo,
    String? username,
    String? password,
    String? passwordRepeat,
    int? categoryId,
    String? languageCode,
    bool? newsLetter,
    bool? acceptApsTerms,
    bool? acceptBranchTerms});

  Future<void> updateMember({
    String? company,
    int? salutationId,
    String? title,
    String? firstname,
    String? lastname,
    String? street,
    int? postcode,
    String? city,
    int? countryId,
    String? email,
    String? phone,
    String? birthday,
    String? memberNo,
    String? username,
  required AccessToken token});

  Future<void> resetPassword({
    required String email
  });

  Future<MemberRegistrationCode> getRegistrationCode({required AccessToken token});
  Future<AccessToken> signIn({required String email, required String password});
  Future<void> logout({required AccessToken token});
  Future<File> getWalletPass({required AccessToken token, required String branchId});
  Future<void> changeLogoUrl({required Uint8List imgBytes, required AccessToken token});
  Future<void> removeLogo({required AccessToken token});
  Future<void> updateMemberPassword({required String oldPassword, required String newPassword, required String newPasswordRepeat, required AccessToken token});
  Future<MemberData> getMemberData({required AccessToken token});
  Future<String?> getMemberImage({required AccessToken token});
  Future<AccessToken> refreshToken({required AccessToken token});
}