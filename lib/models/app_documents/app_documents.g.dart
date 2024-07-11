// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppDocumentsImpl _$$AppDocumentsImplFromJson(Map<String, dynamic> json) =>
    _$AppDocumentsImpl(
      privacy: json['privacy'] as String,
      branchPrivacy: json['branch_privacy'] as String?,
      imprint: json['imprint'] as String,
      terms: json['terms'] as String,
      branchTerms: json['branch_terms'] as String?,
    );

Map<String, dynamic> _$$AppDocumentsImplToJson(_$AppDocumentsImpl instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'branch_privacy': instance.branchPrivacy,
      'imprint': instance.imprint,
      'terms': instance.terms,
      'branch_terms': instance.branchTerms,
    };
