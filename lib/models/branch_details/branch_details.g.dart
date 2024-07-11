// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchDetailsImpl _$$BranchDetailsImplFromJson(Map<String, dynamic> json) =>
    _$BranchDetailsImpl(
      id: json['id'] as String,
      no: json['no'] as String,
      company: json['company'] as String,
      street: json['street'] as String,
      postcode: json['postcode'] as String,
      city: json['city'] as String,
      countryId: json['country_id'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      branchImage: _encodeLogo(json['logo'] as String),
    );

Map<String, dynamic> _$$BranchDetailsImplToJson(_$BranchDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'company': instance.company,
      'street': instance.street,
      'postcode': instance.postcode,
      'city': instance.city,
      'country_id': instance.countryId,
      'phone': instance.phone,
      'email': instance.email,
      'logo': _decodeLogo(instance.branchImage),
    };
