import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_documents.freezed.dart';
part 'app_documents.g.dart';

@freezed
class AppDocuments with _$AppDocuments {
  const factory AppDocuments({
    required String privacy,
    @JsonKey(name: 'branch_privacy') String? branchPrivacy,
    required String imprint,
    required String terms,
    @JsonKey(name: 'branch_terms') String? branchTerms
  }) = _AppDocuments;

  factory AppDocuments.fromJson(Map<String, Object?> json)
      => _$AppDocumentsFromJson(json);
}