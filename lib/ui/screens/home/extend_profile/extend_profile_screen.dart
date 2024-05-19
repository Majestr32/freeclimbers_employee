
import 'dart:developer';

import 'package:freeclimbers_employee/blocs/extend_profile_bloc/extend_profile_bloc.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/models/required_fields/required_fields.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_elevated_button.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../blocs/member_cubit/member_cubit.dart';
import '../../../../consts/enums.dart';
import '../../../../consts/k_colors.dart';
import '../../../../utils/platform/platform.dart';
import '../../../popups/branch_confirmation_success/branch_confirmation_success.dart';
import '../../../widgets/dropdowns/app_dropdown.dart';
import '../../../widgets/text_fields/app_plain_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExtendProfileScreen extends StatefulWidget {
  final ExtendProfileBloc extendProfileBloc;
  const ExtendProfileScreen({Key? key, required this.extendProfileBloc}) : super(key: key);

  @override
  State<ExtendProfileScreen> createState() => _ExtendProfileScreenState();
}

class _ExtendProfileScreenState extends State<ExtendProfileScreen> {

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
    log(context.colors!.basePrimaryBack.toString());
    return BlocConsumer<ExtendProfileBloc, ExtendProfileState>(
      bloc: widget.extendProfileBloc,
      listener: (context,state){
        state.maybeMap(
            conflictResolved: (_){
              Navigator.of(context).pop();
              showBranchConfirmationSuccessPopup(context);
            },
            error: (state){
              if(state.error.targets.isNotEmpty){
                if(state.error.localizationCode == 'timeout'){
                  return;
                }
                setState((){
                  _currentErrorTags = state.error.targets;
                });
                Future.delayed(const Duration(microseconds: 150)).then((_){
                  _formKey.currentState!.validate();
                });
                AppToast.instance.showError(context, state.error.message);
              }
            },
            loading: (_){
              context.loaderOverlay.show();
            },
            orElse: (){});

        state.maybeMap(
            loading: (_){},
            orElse: (){context.loaderOverlay.hide();});
      },
      builder: (context,state) => state.requiredBranchFields == null ? Scaffold() : Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: context.colors!.basePrimaryBack,
          appBar: AppNavbar(
            title: AppLocalizations.of(context)!.extend_profile,
            onSuffixWidgetTap: (){
              context.pop();
            },
            suffixWidget: Container(
              color: KColors.transparent,
              child: Icon(FontAwesomeIcons.times, color: context.colors!.mainPrimaryText, size: 24,),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Text(AppLocalizations.of(context)!.register_to_branch(state.company!), textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: context.colors!.fieldNormalText,),),
                  const SizedBox(height: 36,),
                  Text(AppLocalizations.of(context)!.extend_profile_hint, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: context.colors!.fieldNormalText, fontWeight: FontWeight.w400),),
                  const SizedBox(height: 16,),
                  AppPlanTextField(
                    title: AppLocalizations.of(context)!.company,
                    whiteTitle: false,
                    onlyMandatory: true,
                    controller: _companyController,
                    tagForError: 'company',
                    currentTags: _currentErrorTags,
                    mandatority: state.requiredBranchFields!.company,),
                  _salutation(state.requiredBranchFields!),
                  Row(
                    children: [
                      Expanded(
                          flex: state.requiredBranchFields!.firstname == 1 ? 1 : 0,
                          child: AppPlanTextField(title: AppLocalizations.of(context)!.first_name, whiteTitle: false,
                          onlyMandatory: true,
                          controller: _firstnameController,
                          tagForError: 'firstname',
                          currentTags: _currentErrorTags,
                          mandatority: state.requiredBranchFields!.firstname)),
                      state.requiredBranchFields!.firstname == 1 && state.requiredBranchFields!.lastname == 1 ? const SizedBox(width: 16,) : const SizedBox.shrink(),
                      Expanded(
                          flex: state.requiredBranchFields!.lastname == 1 ? 1 : 0,
                          child: AppPlanTextField(title: AppLocalizations.of(context)!.last_name, whiteTitle: false,
                        onlyMandatory: true,
                        controller: _lastnameController,
                        tagForError: 'lastname',
                        currentTags: _currentErrorTags,
                        mandatority: state.requiredBranchFields!.lastname,)),
                    ],
                  ),
                  AppPlanTextField(title: AppLocalizations.of(context)!.title, whiteTitle: false,
                    onlyMandatory: true,
                    controller: _titleController,
                    tagForError: 'title',
                    currentTags: _currentErrorTags,
                    mandatority: state.requiredBranchFields!.title,),
                  AppPlanTextField(title: AppLocalizations.of(context)!.street,
                    onlyMandatory: true,
                    mandatority: state.requiredBranchFields!.street,
                    whiteTitle: false, controller: _streetController, tagForError: 'street',currentTags: _currentErrorTags,),
                  Row(
                    children: [
                      Expanded(
                          flex: state.requiredBranchFields!.postcode == 1 ? 1 : 0,
                          child: AppPlanTextField(title: AppLocalizations.of(context)!.postcode, keyboard: TextInputType.number, whiteTitle: false,
                        onlyMandatory: true,
                        controller: _postcodeController,
                        tagForError: 'postcode',
                        currentTags: _currentErrorTags,
                        mandatority: state.requiredBranchFields!.postcode,)),
                      state.requiredBranchFields!.city == 1 && state.requiredBranchFields!.postcode == 1 ? const SizedBox(width: 16,) : SizedBox.shrink(),
                      Expanded(
                          flex: state.requiredBranchFields!.city == 1 ? 1 : 0,
                          child: AppPlanTextField(title: AppLocalizations.of(context)!.city, whiteTitle: false,
                        onlyMandatory: true,
                        tagForError: 'city',
                        currentTags: _currentErrorTags,
                        controller: _cityController,
                        mandatority: state.requiredBranchFields!.city,)),
                    ],
                  ),
                  _countries(state.requiredBranchFields!),
                  AppPlanTextField(title: AppLocalizations.of(context)!.phone, tagForError: 'phone', currentTags: _currentErrorTags, whiteTitle: false,
                    onlyMandatory: true,
                    keyboard: TextInputType.phone,
                    prefixWidget: Icon(FontAwesomeIcons.phone, size: 20, color: context.colors!.fieldNormalText,),
                    controller: _phoneController,
                    mandatority: state.requiredBranchFields!.phone,),
                  AppPlanTextField(title: AppLocalizations.of(context)!.email, tagForError: 'email', currentTags: _currentErrorTags, keyboard: TextInputType.emailAddress, whiteTitle: false,
                    onlyMandatory: true,
                    prefixWidget: Icon(FontAwesomeIcons.solidEnvelope, size: 20, color: context.colors!.fieldNormalText,),
                    controller: _emailController,
                    textCapitalization: TextCapitalization.none,
                    mandatority: state.requiredBranchFields!.email,),
                  AppPlanTextField(
                    onlyMandatory: true,
                    onTap: () async{
                      final date = await AppPlatformUtils.instance.showDatePicker(context, _lastSelectedBirthday ?? DateTime(2000), DateTime(1880), DateTime(2021));
                      if(date == null){
                        return;
                      }
                      _lastSelectedBirthday = date;
                      _birthdayController.text = "${date.day.toString().padLeft(2,'0')}.${date.month.toString().padLeft(2,'0')}.${date.year}";
                    },
                    title: AppLocalizations.of(context)!.birthday, tagForError: 'birthday', currentTags: _currentErrorTags,
                    prefixWidget: Icon(FontAwesomeIcons.calendarDay, size: 20, color: context.colors!.fieldNormalText,), whiteTitle: false,
                    controller: _birthdayController,
                    keyboard: TextInputType.datetime,
                    mandatority: state.requiredBranchFields!.birthday,),
                  AppPlanTextField(title: AppLocalizations.of(context)!.member_number, currentTags: _currentErrorTags, whiteTitle: false,
                    onlyMandatory: true,
                    tagForError: 'member_no',
                    controller: _memberNumberController,
                    mandatority: state.requiredBranchFields!.memberNo,),
                  AppPlanTextField(title: AppLocalizations.of(context)!.username, currentTags: _currentErrorTags, whiteTitle: false,
                    onlyMandatory: true,
                    prefixWidget: Icon(FontAwesomeIcons.solidUser, color: context.colors!.fieldNormalText, size: 20,),
                    tagForError: 'username',
                    textCapitalization: TextCapitalization.none,
                    controller: _usernameController,
                    mandatority: state.requiredBranchFields!.username,),
                  const SizedBox(height: 32,),
                  AppElevatedButton(title: 'Save', onPressed: (){
                    _currentErrorTags = [];
                    final company = _companyController.text.isEmpty ? null : _companyController.text;
                    final title = _titleController.text.isEmpty ? null : _titleController.text;
                    final firstname = _firstnameController.text.isEmpty ? null : _firstnameController.text;
                    final lastname = _lastnameController.text.isEmpty ? null : _lastnameController.text;
                    final street = _streetController.text.isEmpty ? null : _streetController.text;
                    final postcode = _postcodeController.text.isEmpty ? null : _postcodeController.text;
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
                    widget.extendProfileBloc.add(ExtendProfileEvent.extendProfile(updateFields: context.read<MemberCubit>().state.memberData!.copyWith.call(
                      company: company, title: title, firstname: firstname, lastname: lastname, street: street,
                      postcode: postcode, city: city, email: email, phone: phone, birthday: birthday, memberNo: memberNumber, username: username, salutationId: _salutationId?.toString(), countryId: _countryId?.toString(),
                    )));

                  }, expanded: false,),
                  const SizedBox(height: 64,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _salutation(RequiredFields requiredFields){
    return AppDropdown<int>(
      onlyMandatory: true,
        title: AppLocalizations.of(context)!.salutation,
        onChanged: (val){
          setState((){
            _salutationId = val;
          });
        },
        mandatority: requiredFields.salutationId,
        buttons: List<DropdownMenuItem<int?>>.generate(Salutations.values.length, (i) => DropdownMenuItem(value: Salutations.values[i].value,child: Text(Salutations.values[i].getLocalizedSalutationName(context),),)), value: _salutationId);
  }

  Widget _countries(RequiredFields requiredFields){
    return AppDropdown<int>(
      onlyMandatory: true,
        title: AppLocalizations.of(context)!.country,
        mandatority: requiredFields.countryId,
        onChanged: (val){
          setState((){
            _countryId = val;
          });
        },
        buttons: List<DropdownMenuItem<int>>.generate(Countries.values.length, (i) => DropdownMenuItem(child: Text(Countries.values[i].getLocalizedCountryName(context)), value: Countries.values[i].value,)), value: _countryId);
  }
}
