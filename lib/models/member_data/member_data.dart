import 'package:climbers/consts/enums.dart';
import 'package:climbers/models/required_fields/required_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_data.freezed.dart';
part 'member_data.g.dart';

@freezed
class MemberData with _$MemberData {
  const MemberData._();

  bool satisfies(RequiredFields requiredFields){
    return [
      _satisfiesField(requiredFields.salutationId, salutationId),
      _satisfiesField(requiredFields.countryId, countryId),
      _satisfiesField(requiredFields.postcode, postcode),
      _satisfiesField(requiredFields.username, username),
      _satisfiesField(requiredFields.memberNo, memberNo),
      _satisfiesField(requiredFields.birthday, birthday),
      _satisfiesField(requiredFields.phone, phone),
      _satisfiesField(requiredFields.email, email),
      _satisfiesField(requiredFields.city, city),
      _satisfiesField(requiredFields.street, street),
      _satisfiesField(requiredFields.title, title),
      _satisfiesField(requiredFields.company, company),
      _satisfiesField(requiredFields.categoryId, categoryId)
    ].every((truth) => truth);
  }

  bool _satisfiesField(int mandatority, String? fieldValue){
    return mandatority != 1 || (fieldValue != null && fieldValue.isNotEmpty);
  }

  String? getSalutationName(BuildContext context) => salutationId == null ? null : Salutations.values[int.parse(salutationId!) - 1].getLocalizedSalutationName(context);
  String? getCountryName(BuildContext context) => countryId == null ? null : Countries.values[int.parse(countryId!) - 1].getLocalizedCountryName(context);


  String? get fullName => firstname == null || lastname == null ? null : "${firstname!} ${lastname!}";

  String get nickname => username != null && username!.isNotEmpty ? "@${username!}" : email!;

  const factory MemberData({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'no') required String? no,
    @JsonKey(name: 'company') required String? company,
    @JsonKey(name: 'salutation_id') required String? salutationId,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'firstname') required String? firstname,
    @JsonKey(name: 'lastname') required String? lastname,
    @JsonKey(name: 'street') required String? street,
    @JsonKey(name: 'postcode') required String? postcode,
    @JsonKey(name: 'city') required String? city,
    @JsonKey(name: 'country_id') required String? countryId,
    @JsonKey(name: 'email') required String? email,
    @JsonKey(name: 'phone') required String? phone,
    @JsonKey(name: 'birthday') required String? birthday,
    @JsonKey(name: 'member_no') required String? memberNo,
    @JsonKey(name: 'username') required String? username,
    @JsonKey(name: 'category_id') required String? categoryId,
    @JsonKey(name: 'newsletter') required String? newsletter,
    @JsonKey(name: 'reg_code') required String? regCode
  }) = _MemberData;

  factory MemberData.fromJson(Map<String, Object?> json) => _$MemberDataFromJson(json);
}


//{
//         "id": "17",
//         "no": "006213396993",
//         "company": "",
//         "salutation_id": "1",
//         "title": "",
//         "firstname": "AppClimb",
//         "lastname": "Developer",
//         "street": "Schillerstrasse 32",
//         "postcode": "85391",
//         "city": "Allershausen",
//         "country_id": null,
//         "phone": "+380664315735",
//         "email": "vladik11042002v@gmail.com",
//         "birthday": "2002-04-11",
//         "member_no": "",
//         "newsletter": "0",
//         "username": "vladik1234512312",
//         "category_id": null,
//         "reg_code": "GKD3QQWX51T3TV2V2F8BGD958FP428F2"
//     }