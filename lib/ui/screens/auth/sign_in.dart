
import 'package:app_links/app_links.dart';
import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/router.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_elevated_button.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_text_button.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_outlined_button.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../blocs/branches_cubit/branches_cubit.dart';
import '../../../consts/k_colors.dart';
import '../../../consts/k_icons.dart';
import '../../widgets/auth/bg.dart';
import '../../widgets/text_fields/app_plain_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _currentErrorTag = '';


  final _formKey = GlobalKey<FormState>();
  bool _showEye = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchesCubit, BranchesState>(
    listener: (context, state) {
      if(context.read<BranchesCubit>().state.status == BranchesStateStatus.loaded){
        context.loaderOverlay.hide();
        router.go(RouteNames.home, extra: 3);
      }
    },
    child: CupertinoPageScaffold(
        backgroundColor: context.colors.basePrimaryBack,
          child: ConnectivityBadge(
            child: Stack(
        children: [
            BlocListener<MemberCubit,MemberState>(
              listener: (context,state){
                if(state.status == MemberStateStatus.error){
                  context.loaderOverlay.hide();
                  if(state.error!.localizationCode == 'timeout'){
                    return;
                  }
                  setState((){
                    _currentErrorTag = 'error';
                  });
                  Future.delayed(Duration(milliseconds: 100)).then((_){
                    _formKey.currentState!.validate();
                  });
                }
              },
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: AutofillGroup(
                    onDisposeAction: AutofillContextAction.commit,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(flex: 2),
                        Image.asset('assets/images/logo.png', width: 100, height: 100,),
                        const SizedBox(height: 20,),
                        Text(AppLocalizations.of(context)!.welcome, style: TextStyle(color: context.colors.fieldNormalText, fontSize: 32, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 24,),
                        Text(AppLocalizations.of(context)!.sign_in_freeclimbers, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.colors.fieldNormalText),),
                        const SizedBox(height: 8,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.dont_have_an_account, style: TextStyle(
                              color: context.colors.fieldNormalText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),),
                            const SizedBox(width: 5,),
                            AppTextButton(title: AppLocalizations.of(context)!.sign_up, isTitleWhite: false, onPressed: () => context.push(RouteNames.signUp))
                          ],
                        ),
                        const SizedBox(height: 24,),
                        AppPlanTextField(title: AppLocalizations.of(context)!.email,
                          tagForError: 'error',
                          currentTags: [_currentErrorTag],
                          keyboard: TextInputType.emailAddress,
                            prefixWidget: Icon(FontAwesomeIcons.solidUser, color: context.colors.fieldNormalText, size: 20,),
                          controller: _emailController,
                            autofillHints: [
                              AutofillHints.username
                            ],
                            whiteTitle: false,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                          mandatority: 0),
                        const SizedBox(height: 3,),
                        AppPlanTextField(title: AppLocalizations.of(context)!.password,
                          tagForError: 'error',
                          currentTags: [_currentErrorTag],
                          controller: _passwordController,
                          prefixWidget: Icon(FontAwesomeIcons.lock, color: context.colors.fieldNormalText, size: 20,),
                          keyboard: TextInputType.visiblePassword,
                          textCapitalization: TextCapitalization.none,
                          mandatority: 0, obscure: _showEye,
                          autofillHints: [
                            AutofillHints.password
                          ],
                          whiteTitle: false,
                          suffixWidget: GestureDetector(
                            onTap: (){
                              setState((){
                                _showEye = !_showEye;
                              });
                            },
                            child: Icon(_showEye ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash, color: context.colors.fieldNormalText, size: 20,)),),
                        const SizedBox(height: 8,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppTextButton(
                              isTitleWhite: false,
                              title: AppLocalizations.of(context)!.forgot_password, onPressed: () => context.push(RouteNames.resetPassword)),
                        ),
                        const SizedBox(height: 32,),
                        AppElevatedButton(title: AppLocalizations.of(context)!.login,
                          onPressed: () async{
                          if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                            AppToast.instance.showError(context, AppLocalizations.of(context)!.login_empty_error);
                            setState((){
                              _currentErrorTag = 'error';
                             });
                            Future.delayed(const Duration(milliseconds: 100)).then((_){
                              _formKey.currentState!.validate();
                            });
                            return;
                          }
                          _currentErrorTag = '';
                          TextInput.finishAutofillContext();
                          context.loaderOverlay.show();
                          context.read<MemberCubit>().signIn(email: _emailController.text, password: _passwordController.text);
                        }, expanded: true,),
                        const Spacer(flex: 2,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
          )),
);
  }
}
