import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_qr_data.freezed.dart';
part 'branch_qr_data.g.dart';

@freezed
class BranchQrData with _$BranchQrData {
  const BranchQrData._();
  Uint8List get logo => base64Decode(logoStr);
  const factory BranchQrData({
    required String id,
    required String no,
    required String company,
    @JsonKey(name: 'logo') required String logoStr
  }) = _BranchQrData;

  factory BranchQrData.fromJson(Map<String, Object?> json)
      => _$BranchQrDataFromJson(json);
}