// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as String,
      memberId: json['member_id'] as String,
      branchId: json['branch_id'] as String,
      branchCustomerId: json['branch_customer_id'] as String?,
      details: BranchDetails.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'branch_id': instance.branchId,
      'branch_customer_id': instance.branchCustomerId,
      'branch': instance.details,
    };
