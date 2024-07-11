
import 'package:app_links/app_links.dart';
import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/blocs/servers_bloc/servers_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/sheets/branches/branches_sheet.dart';
import 'package:climbers/ui/widgets/buttons/app_elevated_button.dart';
import 'package:climbers/ui/widgets/buttons/app_text_button.dart';
import 'package:climbers/ui/widgets/buttons/app_outlined_button.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/utils/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {

  final _emailController = TextEditingController();

  String _currentErrorTag = '';


  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
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
                        const SizedBox(height: 8,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${AppLocalizations.of(context)!.login_at}:", style: TextStyle(
                              color: context.colors.fieldNormalText,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),),
                            const SizedBox(width: 4,),
                            GestureDetector(
                              onTap: (){
                                //context.go(RouteNames.createServer);
                                openBranchSheetInitial(context);
                              },
                              child: Text(context.watch<ServersBloc>().state.selectedServer.displayName, style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  color: context.colors.fieldNormalText,
                                  fontWeight: FontWeight.w600,
                                  decorationThickness: 0.5,
                                  decoration: TextDecoration.underline
                              )),
                            ),
                            const SizedBox(width: 4,),
                            Container(
                              width: 12,
                              height: 12,
                              child: Center(
                                child: Icon(FontAwesomeIcons.chevronDown, color: context.colors.fieldNormalText, size: 10,),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 32,),
                        AppElevatedButton(title: AppLocalizations.of(context)!.continue_text,
                          onPressed: () async{
                          if(_emailController.text.isEmpty){
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
                          Future.delayed(const Duration(milliseconds: 100)).then((_){
                            _formKey.currentState!.validate();
                          });
                          context.push(RouteNames.signInPassword, extra: _emailController.text);
                          //TextInput.finishAutofillContext();
                          //context.loaderOverlay.show();
                          //context.read<MemberCubit>().signIn(email: _emailController.text, password: _passwordController.text);
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
