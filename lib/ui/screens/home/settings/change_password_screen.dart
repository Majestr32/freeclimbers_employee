import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_elevated_button.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/ui/widgets/text_fields/app_plain_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import '../../../../consts/k_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  List<String> _currentErrorTags = [];
  final _formKey = GlobalKey<FormState>();

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberCubit,MemberState>(
      listener: (context,state){
        if(state.status == MemberStateStatus.error && state.error!.targets.isNotEmpty){
          if(state.error!.localizationCode == 'timeout'){
            return;
          }
          setState((){
            _currentErrorTags = state.error!.targets;
          });
         Future.delayed(Duration(milliseconds: 300)).then((_){
           _formKey.currentState!.validate();
         });
        }else if(state.status == MemberStateStatus.updateOperationSuccess){
          context.pop();
        }
      },
      child: CupertinoPageScaffold(
        backgroundColor: context.colors!.basePrimaryBack,
        navigationBar: AppNavbar(
          title: AppLocalizations.of(context)!.change_password,
          onPrefixWidgetTap: () => context.pop(),
          prefixWidget: Container(
            color: KColors.transparent,
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.colors!.mainPrimaryText, size: 24,),
          ),
        ),
        child: ConnectivityBadge(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  AppPlanTextField(
                    controller: _oldPasswordController,
                    prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors!.fieldNormalText, size: 20,),
                      obscure: _showOldPassword,
                      suffixWidget: GestureDetector(
                          onTap: (){
                            setState((){
                              _showOldPassword = !_showOldPassword;
                            });
                          },
                          child: Icon(_showOldPassword ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash, color: context.colors!.fieldNormalText, size: 20,)),
                    title: AppLocalizations.of(context)!.current_password, whiteTitle: false, tagForError: 'password_old', currentTags: _currentErrorTags,),
                  AppPlanTextField(
                    controller: _newPasswordController,
                    prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors!.fieldNormalText, size: 20,),
                    obscure: _showNewPassword,
                      suffixWidget: GestureDetector(
                          onTap: (){
                            setState((){
                              _showNewPassword = !_showNewPassword;
                            });
                          },
                          child: Icon(_showNewPassword ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash, color: context.colors!.fieldNormalText, size: 20,)),
                    title: AppLocalizations.of(context)!.new_password, whiteTitle: false, tagForError: 'password', currentTags: _currentErrorTags,),
                  AppPlanTextField(
                    controller: _confirmPasswordController,
                    prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors!.fieldNormalText, size: 20,),
                    obscure: _showConfirmPassword,
                      suffixWidget: GestureDetector(
                          onTap: (){
                            setState((){
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                          child: Icon(_showConfirmPassword ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash, color: context.colors!.fieldNormalText, size: 20,)),
                    title: AppLocalizations.of(context)!.confirm_password, whiteTitle: false, tagForError: 'password_repeat', currentTags: _currentErrorTags,),
                  SizedBox(height: 25,),
                  AppElevatedButton(title: AppLocalizations.of(context)!.save, expanded: false, onPressed: (){
                    _currentErrorTags = [];
                    context.read<MemberCubit>().updateMemberPassword(oldPassword: _oldPasswordController.text, newPassword: _newPasswordController.text, newPasswordRepeat: _confirmPasswordController.text);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
