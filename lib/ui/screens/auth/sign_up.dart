

import 'package:climbers/blocs/locale_cubit/locale_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/consts/enums.dart';
import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/branch_image/branch_image.dart';
import 'package:climbers/ui/widgets/buttons/app_elevated_button.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/ui/widgets/dropdowns/app_dropdown.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:climbers/ui/widgets/text_fields/app_plain_text_field.dart';
import 'package:climbers/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_icons.dart';
import '../../../consts/web_documents_enums.dart';
import '../../../router.dart';
import '../../../utils/platform/platform.dart';
import '../../widgets/buttons/app_text_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  final bool isAppClip;
  const SignUpScreen({Key? key, this.isAppClip = false}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late int? _salutationId = context.read<AppCubit>().state.settings?.required.salutationId == 1 ? 1 : null;
  late int? _countryId = context.read<AppCubit>().state.settings?.required.countryId == 1 ? 1 : null;
  bool _sendNewsletter = false;

  bool _showEye = true;

  DateTime? _lastSelectedBirthday;

  final _companyController = TextEditingController();
  final _titleController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _streetController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _memberNumberController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _categoryIdController = TextEditingController();
  final _languageCodeController = TextEditingController();

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
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    _categoryIdController.dispose();
    _languageCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: context.colors.basePrimaryBack,
      navigationBar: AppNavbar(
        title: widget.isAppClip ? AppLocalizations.of(context)!.register : AppLocalizations.of(context)!.create_account,
        onSuffixWidgetTap: () => widget.isAppClip ? null : context.pop(),
        prefixWidget: widget.isAppClip ? BranchImage(branchImage: context.watch<AppCubit>().state.branchIcon): null,
        suffixWidget: widget.isAppClip ? SizedBox.shrink() : Container(
          color: KColors.transparent,
          child: Icon(FontAwesomeIcons.times, color: context.colors.mainPrimaryText, size: 24,),
        ),
      ),
        child: context.watch<AppCubit>().state.settings == null ? SizedBox.shrink() : ConnectivityBadge(
          child: BlocListener<MemberCubit,MemberState>(
            listener: (context,state) async{
              if(state.status == MemberStateStatus.error && state.error!.targets.isNotEmpty){
                if(state.error!.localizationCode == 'timeout'){
                  return;
                }
                setState((){
                  _currentErrorTags = state.error!.targets;
                });
                Future.delayed(Duration(microseconds: 100)).then((_){
                  _formKey.currentState!.validate();
                });
              }else if(state.status == MemberStateStatus.loading){
                context.loaderOverlay.show();
              }
              if(state.status != MemberStateStatus.loading){
                context.loaderOverlay.hide();
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

                      context.watch<AppCubit>().state.settings!.registerText == null || context.watch<AppCubit>().state.settings!.registerText!.isEmpty ? SizedBox.shrink() :
                      SizedBox(height: 20,),
                      context.watch<AppCubit>().state.settings!.registerText == null || context.watch<AppCubit>().state.settings!.registerText!.isEmpty ? SizedBox.shrink() :
                      Center(child: Text(context.watch<AppCubit>().state.settings!.registerText!, style: TextStyle(fontWeight: FontWeight.bold, color: context.colors.fieldNormalText, fontSize: 15),)),
                      context.watch<AppCubit>().state.settings!.registerText == null || context.watch<AppCubit>().state.settings!.registerText!.isEmpty ? SizedBox.shrink() :
                      SizedBox(height: 20,),

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
                          Expanded(child: AppPlanTextField(title: AppLocalizations.of(context)!.postcode, validator: AppValidators.zip, keyboard: TextInputType.number, whiteTitle: false,
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
                        prefixWidget: Icon(FontAwesomeIcons.phone, size: 20, color: context.colors.fieldNormalText,),
                      controller: _phoneController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.phone,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.email, tagForError: 'email', currentTags: _currentErrorTags, keyboard: TextInputType.emailAddress, whiteTitle: false,
                        prefixWidget: Icon(FontAwesomeIcons.solidEnvelope, size: 20, color: context.colors.fieldNormalText,),
                      controller: _emailController,
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
                        title: AppLocalizations.of(context)!.birthday, tagForError: 'birthday', currentTags: _currentErrorTags,
                        prefixWidget: Icon(FontAwesomeIcons.calendarDay, size: 20, color: context.colors.fieldNormalText,), whiteTitle: false,
                        controller: _birthdayController,
                        keyboard: TextInputType.datetime,
                        mandatority: context.watch<AppCubit>().state.settings!.required.birthday,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.category_id, tagForError: 'category_id', currentTags: _currentErrorTags, whiteTitle: false,
                      controller: _categoryIdController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.categoryId,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.language_code, currentTags: _currentErrorTags, whiteTitle: false, tagForError: 'language_code',
                      controller: _languageCodeController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.languageCode,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.member_number, currentTags: _currentErrorTags, whiteTitle: false,
                      tagForError: 'member_no',
                      controller: _memberNumberController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.memberNo,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.username, currentTags: _currentErrorTags, whiteTitle: false,
                        prefixWidget: Icon(FontAwesomeIcons.solidUser, color: context.colors.fieldNormalText, size: 20,),
                        tagForError: 'username',
                        textCapitalization: TextCapitalization.none,
                        controller: _usernameController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.username,),
                      AppPlanTextField(title: AppLocalizations.of(context)!.password,
                        prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors.fieldNormalText, size: 20,),
                        currentTags: _currentErrorTags,
                        whiteTitle: false,
                        tagForError: 'password',
                        controller: _passwordController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.password, obscure: _showEye, suffixWidget: GestureDetector(
                            onTap: (){
                              setState((){
                                _showEye = !_showEye;
                              });
                            },
                            child: Icon(_showEye ? KIcons.visibility : KIcons.visibilityOff, color: context.colors.fieldNormalText, size: 20,)),),
                      AppPlanTextField(title: AppLocalizations.of(context)!.password_repeat,
                        prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors.fieldNormalText, size: 20,),
                        whiteTitle: false,
                        tagForError: 'password_repeat',
                        currentTags: _currentErrorTags,
                        controller: _passwordRepeatController,
                        mandatority: context.watch<AppCubit>().state.settings!.required.password, obscure: _showEye, suffixWidget: GestureDetector(
                            onTap: (){
                              setState((){
                                _showEye = !_showEye;
                              });
                            },
                            child: Icon(_showEye ? KIcons.visibility : KIcons.visibilityOff, color: context.colors.fieldNormalText, size: 20,)),),
                      SizedBox(height: 20,),
                      _sendNews(),
                      SizedBox(height: 12,),
                      Center(child: AppElevatedButton(title: widget.isAppClip ? AppLocalizations.of(context)!.register : AppLocalizations.of(context)!.create_account, onPressed: (){
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
                        final password = _passwordController.text.isEmpty ? null : _passwordController.text;
                        final passwordRepeat = _passwordRepeatController.text.isEmpty ? null : _passwordRepeatController.text;
                        final categoryId = _categoryIdController.text.isEmpty ? null : int.parse(_categoryIdController.text);
                        final languageCode = _languageCodeController.text.isEmpty ? null : _languageCodeController.text;

                        final bool branchTermsAvailable = context.read<AppCubit>().state.settings!.required.acceptBranchTerms >= 0 || context.read<AppCubit>().state.documents!.branchTerms != null;

                        context.read<MemberCubit>().registerMember(
                            branchId: context.read<AppCubit>().state.selectedBranchId?.toString(),
                            company: company, title: title, firstname: firstname, lastname: lastname, street: street,
                        postcode: postcode, city: city, email: email, phone: phone, birthday: birthday, memberNo: memberNumber, username: username, password: password, passwordRepeat: passwordRepeat,
                        categoryId: categoryId, languageCode: languageCode, salutationId: _salutationId, countryId: _countryId, newsLetter: _sendNewsletter , acceptBranchTerms: branchTermsAvailable ? true : null, acceptApsTerms: true);
                      }, expanded: false,)),
                      SizedBox(height: 24,),
                      _signTerms(),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.have_an_account, style: TextStyle(
                            color: context.colors.fieldNormalText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),),
                          const SizedBox(width: 5,),
                          AppTextButton(title: AppLocalizations.of(context)!.login, isTitleWhite: false, onPressed: () => context.pop())
                        ],
                      ),
                      SizedBox(height: 80,),
                    ]
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _sendNews(){
    return Row(
      children: [
        Expanded(child: Text(AppLocalizations.of(context)!.send_newspaper, style: TextStyle(color: context.colors.fieldNormalText),)),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(value: _sendNewsletter,
            trackColor: context.colors.basePrimaryText.withOpacity(0.4),
            activeColor: context.colors.mainPrimaryBack.withOpacity(0.4),
            thumbColor: _sendNewsletter ? context.colors.mainPrimaryBack : KColors.white,
            onChanged: (val){
              setState((){
                _sendNewsletter = !_sendNewsletter;
              });
            },),
        ),
      ],
    );
  }

  Widget _signTerms(){
    final bool branchTermsAvailable = context.read<AppCubit>().state.settings!.required.acceptBranchTerms >= 0 || context.read<AppCubit>().state.documents!.branchTerms != null;
    return
      //context.watch<AppCubit>().state.settings!.required.acceptApsTerms == -1 ? SizedBox.shrink() :
      Container(
      color: KColors.transparent,
      child: ((){
        final text = AppLocalizations.of(context)!.accept_app_terms('<link>'+AppLocalizations.of(context)!.terms_of_use + '<link>' + ' & ' + '<link>' + AppLocalizations.of(context)!.privacy_policy + '<link>' + ' ');
        final additionalText = !branchTermsAvailable ? '' : AppLocalizations.of(context)!.accept_branch_terms('<branch_link>' + AppLocalizations.of(context)!.terms_of_use + '<branch_link>' + ' & ' + '<branch_link>' + AppLocalizations.of(context)!.privacy_policy + '<branch_link>' + ' ');
        return Center(
          child: SuperRichText(
            textAlign: TextAlign.center,
            text: text + additionalText,
            style: TextStyle(color: _currentErrorTags.contains('accept_aps_terms') || _currentErrorTags.contains('accept_branch_terms') ? KColors.red : context.colors.fieldNormalText, fontSize: 11),
            othersMarkers: [
              MarkerText.withFunction(marker: '<link>', functions: [
              () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state, WebBranchDocumentRoutes.terms), extra: {"content": context.read<AppCubit>().state.documents!.terms}),
                () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state, WebBranchDocumentRoutes.privatePolicy), extra: {"content": context.read<AppCubit>().state.documents!.privacy}),
              ], style: TextStyle(decoration: TextDecoration.underline, color: context.colors.basePrimaryText)),
              MarkerText.withFunction(marker: '<branch_link>', functions: [
                    () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state, WebBranchDocumentRoutes.terms), extra: {"content": context.read<AppCubit>().state.documents!.branchTerms!, "overrideIcon": context.read<AppCubit>().state.branchIcon}),
                    () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state, WebBranchDocumentRoutes.privatePolicy), extra: {"content": context.read<AppCubit>().state.documents!.branchPrivacy!, "overrideIcon": context.read<AppCubit>().state.branchIcon})
              ], style: TextStyle(decoration: TextDecoration.underline, color: context.colors.basePrimaryText)),
            ],),
        );
      }())
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
