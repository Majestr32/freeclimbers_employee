import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_details.freezed.dart';
part 'branch_details.g.dart';

@freezed
class BranchDetails with _$BranchDetails {
  const factory BranchDetails({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'no') required String no,
    @JsonKey(name: 'company') required String company,
    @JsonKey(name: 'street') required String street,
    @JsonKey(name: 'postcode') required String postcode,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'country_id') required String countryId,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'logo', fromJson: _encodeLogo, toJson: _decodeLogo) required Uint8List branchImage,
  }) = _BranchDetails;

  factory BranchDetails.fromJson(Map<String, Object?> json)
  => _$BranchDetailsFromJson(json);
}

Uint8List _encodeLogo(String logo){
  return base64Decode(logo);
}

String _decodeLogo(Uint8List logo){
  return base64Encode(logo);
}