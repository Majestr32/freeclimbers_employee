import 'dart:developer';

import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../blocs/member_cubit/member_cubit.dart';
import '../../../../consts/enums.dart';
import '../../../../consts/k_colors.dart';
import '../../../../utils/platform/platform.dart';
import '../../../../utils/validators.dart';
import '../../../widgets/buttons/app_elevated_button.dart';
import '../../../widgets/dropdowns/app_dropdown.dart';
import '../../../widgets/nav/app_navbar.dart';
import '../../../widgets/text_fields/app_plain_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late int? _salutationId = context.read<MemberCubit>().state.memberData!.salutationId == null ? null : int.parse(context.watch<MemberCubit>().state.memberData!.salutationId!);
  late int? _countryId = context.read<MemberCubit>().state.memberData!.countryId == null ? null : int.parse(context.watch<MemberCubit>().state.memberData!.countryId!);

  late DateTime? _lastSelectedBirthday = context.read<MemberCubit>().state.memberData!.birthday == null ? null : DateTime.parse(context.read<MemberCubit>().state.memberData!.birthday!);

  late final _companyController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.company);
  late final _titleController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.title);
  late final _firstnameController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.firstname);
  late final _lastnameController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.lastname);
  late final _streetController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.street);
  late final _postcodeController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.postcode);
  late final _cityController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.city);
  late final _emailController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.email);
  late final _phoneController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.phone);
  late final _birthdayController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.birthday);
  late final _memberNumberController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.memberNo);
  late final _usernameController = TextEditingController(text: context.read<MemberCubit>().state.memberData!.username);

  final _formKey = GlobalKey<FormState>();

  List<String> _currentErrorTags = [];

  @override
  void dispose() {
    _companyController.dispose();
    _titleController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _streetController.dispose();
    _postcodeController.dispose();
    _cityController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    _memberNumberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberCubit,MemberState>(
      listener: (context,state){
        if(state.status == MemberStateStatus.updateOperationSuccess){
          context.pop();
        }
      },
      child: CupertinoPageScaffold(
          backgroundColor: context.colors!.basePrimaryBack,
          navigationBar: AppNavbar(
            title: AppLocalizations.of(context)!.change_profile,
            onPrefixWidgetTap: () => context.pop(),
            prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: context.colors!.mainPrimaryText, size: 24,),
          ),
          child: ConnectivityBadge(
            child: BlocListener<MemberCubit,MemberState>(
              listener: (context,state){
                if(state.status == MemberStateStatus.error && state.error!.targets.isNotEmpty){
                  if(state.error!.localizationCode == 'timeout'){
                    return;
                  }
                  setState((){
                    _currentErrorTags = state.error!.targets;
                  });
                  _formKey.currentState!.validate();
                }
              },
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          AppPlanTextField(title: AppLocalizations.of(context)!.company, whiteTitle: false,
                            controller: _companyController,
                            tagForError: 'company',
                            currentTags: _currentErrorTags,
                            mandatority: context.watch<AppCubit>().state.settings!.required.company,),
                          _salutation(),
                          Row(
                            children: [
                              Expanded(child: AppPlanTextField(title: AppLocalizations.of(context)!.first_name, whiteTitle: false,
                                  controller: _firstnameController,
                                  tagForError: 'firstname',
                                  currentTags: _currentErrorTags,
                                  mandatority: context.watch<AppCubit>().state.settings!.required.firstname)),
                              SizedBox(width: 16,),
                              Expanded(child: AppPlanTextField(title: AppLocalizations.of(context)!.last_name, whiteTitle: false,
                                controller: _lastnameController,
                                tagForError: 'lastname',
                                currentTags: _currentErrorTags,
                                mandatority: context.watch<AppCubit>().state.settings!.required.lastname,)),
                            ],
                          ),
                          AppPlanTextField(title: AppLocalizations.of(context)!.title, whiteTitle: false,
                            controller: _titleController,
                            tagForError: 'title',
                            currentTags: _currentErrorTags,
                            mandatority: context.watch<AppCubit>().state.settings!.required.title,),
                          AppPlanTextField(title: AppLocalizations.of(context)!.street, whiteTitle: false, controller: _streetController, tagForError: 'street',currentTags: _currentErrorTags,),
                          Row(
                            children: [
                              Expanded(child: AppPlanTextField(title: AppLocalizations.of(context)!.postcode, keyboard: TextInputType.number, whiteTitle: false,
                                controller: _postcodeController,
                                tagForError: 'postcode',
                                currentTags: _currentErrorTags,
                                mandatority: context.watch<AppCubit>().state.settings!.required.postcode,)),
                              SizedBox(width: 16,),
                              Expanded(child: AppPlanTextField(title: AppLocalizations.of(context)!.city, whiteTitle: false,
                                tagForError: 'city',
                                currentTags: _currentErrorTags,
                                controller: _cityController,
                                mandatority: context.watch<AppCubit>().state.settings!.required.city,)),
                            ],
                          ),
                          _countries(),
                          AppPlanTextField(title: AppLocalizations.of(context)!.phone, tagForError: 'phone', currentTags: _currentErrorTags, whiteTitle: false,
                            keyboard: TextInputType.phone,
                            prefixWidget: Icon(FontAwesomeIcons.phone, size: 20, color: context.colors!.fieldNormalText,),
                            controller: _phoneController,
                            mandatority: context.watch<AppCubit>().state.settings!.required.phone,),
                          AppPlanTextField(title: AppLocalizations.of(context)!.email, tagForError: 'email', currentTags: _currentErrorTags, keyboard: TextInputType.emailAddress, whiteTitle: false,
                            controller: _emailController,
                            prefixWidget: Icon(FontAwesomeIcons.solidEnvelope, size: 20, color: context.colors!.fieldNormalText,),
                            textCapitalization: TextCapitalization.none,
                            mandatority: context.watch<AppCubit>().state.settings!.required.email,),
                          AppPlanTextField(
                            onTap: () async{
                              final date = await AppPlatformUtils.instance.showDatePicker(context, _lastSelectedBirthday ?? DateTime(2000), DateTime(1880), DateTime(2021));
                              if(date == null){
                                return;
                              }
                              _lastSelectedBirthday = date;
                              _birthdayController.text = "${date.day.toString().padLeft(2,'0')}.${date.month.toString().padLeft(2,'0')}.${date.year}";
                            },
                            prefixWidget: Icon(FontAwesomeIcons.calendarDay, size: 20, color: context.colors!.fieldNormalText,),
                            title: AppLocalizations.of(context)!.birthday, tagForError: 'birthday', currentTags: _currentErrorTags, whiteTitle: false,
                            controller: _birthdayController,
                            keyboard: TextInputType.datetime,
                            mandatority: context.watch<AppCubit>().state.settings!.required.birthday,),
                          AppPlanTextField(title: AppLocalizations.of(context)!.member_number, currentTags: _currentErrorTags, whiteTitle: false,
                            tagForError: 'member_no',
                            controller: _memberNumberController,
                            mandatority: context.watch<AppCubit>().state.settings!.required.memberNo,),
                          AppPlanTextField(title: AppLocalizations.of(context)!.username, currentTags: _currentErrorTags, whiteTitle: false,
                            tagForError: 'username',
                            prefixWidget: Icon(FontAwesomeIcons.solidUser, color: context.colors!.fieldNormalText, size: 20,),
                            textCapitalization: TextCapitalization.none,
                            controller: _usernameController,
                            mandatority: context.watch<AppCubit>().state.settings!.required.username,),
                          SizedBox(height: 32,),
                          Center(child: AppElevatedButton(title: AppLocalizations.of(context)!.save, onPressed: (){
                            _currentErrorTags = [];
                            final company = _companyController.text.isEmpty ? null : _companyController.text;
                            final title = _titleController.text.isEmpty ? null : _titleController.text;
                            final firstname = _firstnameController.text.isEmpty ? null : _firstnameController.text;
                            final lastname = _lastnameController.text.isEmpty ? null : _lastnameController.text;
                            final street = _streetController.text.isEmpty ? null : _streetController.text;
                            final postcode = _postcodeController.text.isEmpty ? null : int.parse(_postcodeController.text);
                            final city = _cityController.text.isEmpty ? null : _cityController.text;
                            final email = _emailController.text.isEmpty ? null : _emailController.text;
                            final phone = _phoneController.text.isEmpty ? null : _phoneController.text;
                            String? birthday = _birthdayController.text.isEmpty ? null : _birthdayController.text;
                            if(birthday != null){
                              final birthdayParts = birthday.split(".");
                              birthday = "${birthdayParts[2]}-${birthdayParts[1]}-${birthdayParts[0]}";
                            }

                            final memberNumber = _memberNumberController.text.isEmpty ? null : _memberNumberController.text;
                            final username = _usernameController.text.isEmpty ? null : _usernameController.text;

                            context.read<MemberCubit>().updateMember(company: company, title: title, firstname: firstname, lastname: lastname, street: street,
                                postcode: postcode, city: city, email: email, phone: phone, birthday: birthday, memberNo: memberNumber, username: username, salutationId: _salutationId, countryId: _countryId,);
                          }, expanded: false,)),
                          SizedBox(height: 80,),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _salutation(){
    return AppDropdown<int>(
        title: AppLocalizations.of(context)!.salutation,
        onChanged: (val){
          setState((){
            _salutationId = val;
          });
        },
        mandatority: context.watch<AppCubit>().state.settings!.required.salutationId,
        buttons: List<DropdownMenuItem<int?>>.generate(Salutations.values.length, (i) => DropdownMenuItem(value: Salutations.values[i].value,child: Text(Salutations.values[i].getLocalizedSalutationName(context),),)), value: _salutationId);
  }

  Widget _countries(){
    return AppDropdown<int>(
        title: AppLocalizations.of(context)!.country,
        mandatority: context.watch<AppCubit>().state.settings!.required.countryId,
        onChanged: (val){
          setState((){
            _countryId = val;
          });
        },
        buttons: List<DropdownMenuItem<int>>.generate(Countries.values.length, (i) => DropdownMenuItem(child: Text(Countries.values[i].getLocalizedCountryName(context)), value: Countries.values[i].value,)), value: _countryId);
  }
}
