import 'package:freezed_annotation/freezed_annotation.dart';

part 'required_fields.freezed.dart';
part 'required_fields.g.dart';

@freezed
class RequiredFields with _$RequiredFields {
  const RequiredFields._();

  factory RequiredFields.fromError(List<String> errorTags){
    return RequiredFields(
        company: errorTags.contains('company') ? 1 : -1,
        salutationId: errorTags.contains('salutation_id') ? 1 : -1,
        title: errorTags.contains('title') ? 1 : -1,
        firstname: errorTags.contains('firstname') ? 1 : -1,
        lastname: errorTags.contains('lastname') ? 1 : -1,
        street: errorTags.contains('street') ? 1 : -1,
        postcode: errorTags.contains('postcode') ? 1 : -1,
        city: errorTags.contains('city') ? 1 : -1,
        countryId: errorTags.contains('country_id') ? 1 : -1,
        email: errorTags.contains('email') ? 1 : -1,
        phone: errorTags.contains('phone') ? 1 : -1,
        birthday: errorTags.contains('birthday') ? 1 : -1,
        memberNo: errorTags.contains('member_no') ? 1 : -1,
        username: -1,
        password: -1,
        categoryId: errorTags.contains('category_id') ? 1 : -1,
        languageCode: -1,
        acceptApsTerms: -1,
        acceptBranchTerms: -1);
  }

  const factory RequiredFields({
    @JsonKey(name: 'company') required int company,
    @JsonKey(name: 'salutation_id') required int salutationId,
    @JsonKey(name: 'title') required int title,
    @JsonKey(name: 'firstname') required int firstname,
    @JsonKey(name: 'lastname') required int lastname,
    @JsonKey(name: 'street') required int street,
    @JsonKey(name: 'postcode') required int postcode,
    @JsonKey(name: 'city') required int city,
    @JsonKey(name: 'country_id') required int countryId,
    @JsonKey(name: 'email') required int email,
    @JsonKey(name: 'phone') required int phone,
    @JsonKey(name: 'birthday') required int birthday,
    @JsonKey(name: 'member_no') required int memberNo,
    @JsonKey(name: 'username') required int username,
    @JsonKey(name: 'password') required int password,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'language_code') required int languageCode,
    @JsonKey(name: 'accept_aps_terms') required int acceptApsTerms,
    @JsonKey(name: 'accept_branch_terms') required int acceptBranchTerms,
  }) = _RequiredFields;

  factory RequiredFields.fromJson(Map<String, Object?> json) => _$RequiredFieldsFromJson(json);
}

//"required": {
//       "company": -1,
//       "salutation_id": 0,
//       "title": -1,
//       "firstname": 1,
//       "lastname": 1,
//       "street": 0,
//       "postcode": 0,
//       "city": 0,
//       "country_id": 0,
//       "email": 1,
//       "phone": 0,
//       "birthday": 0,
//       "member_no": -1,
//       "username": 0,
//       "password": 1,
//       "category_id": -1,
//       "language_code": -1,
//       "accept_aps_terms": 1,
//       "accept_branch_terms": -1
//     },