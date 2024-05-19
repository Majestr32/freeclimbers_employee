// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppDocuments _$$_AppDocumentsFromJson(Map<String, dynamic> json) =>
    _$_AppDocuments(
      privacy: json['privacy'] as String,
      branchPrivacy: json['branch_privacy'] as String?,
      imprint: json['imprint'] as String,
      terms: json['terms'] as String,
      branchTerms: json['branch_terms'] as String?,
    );

Map<String, dynamic> _$$_AppDocumentsToJson(_$_AppDocuments instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'branch_privacy': instance.branchPrivacy,
      'imprint': instance.imprint,
      'terms': instance.terms,
      'branch_terms': instance.branchTerms,
    };
