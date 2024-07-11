import 'dart:convert';

import 'package:climbers/models/app_settings/app_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../branch_details/branch_details.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
class Branch with _$Branch {
  const factory Branch({
    required String id,
    @JsonKey(ignore: true) AppSettings? branchSettings,
    @JsonKey(name: 'member_id') required String memberId,
    @JsonKey(name: 'branch_id') required String branchId,
    @JsonKey(name: 'branch_customer_id') String? branchCustomerId,
    @JsonKey(name: 'branch') required BranchDetails details,
  }) = _Branch;

  factory Branch.fromJson(Map<String, Object?> json)
      => _$BranchFromJson(json);
}