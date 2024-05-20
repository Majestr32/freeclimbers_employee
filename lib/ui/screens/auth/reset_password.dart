
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_elevated_button.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../utils/toasts.dart';
import '../../widgets/buttons/app_outlined_button.dart';

import '../../widgets/text_fields/app_plain_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String _errorTag = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: context.colors!.basePrimaryBack,
        child: ConnectivityBadge(
          child: Form(
            key: _formKey,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 2,),
                    Image.asset('assets/images/logo.png', width: 100, height: 100,),
                    const SizedBox(height: 20,),
                    Text(AppLocalizations.of(context)!.reset_password, style: TextStyle(color: context.colors!.fieldNormalText, fontSize: 32, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 24,),
                    Text(AppLocalizations.of(context)!.reset_password_hint, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.colors!.fieldNormalText),),
                    const SizedBox(height: 24),
                    AppPlanTextField(title: AppLocalizations.of(context)!.email,
                      whiteTitle: false,
                      currentTags: [_errorTag],
                      prefixWidget: Icon(FontAwesomeIcons.solidEnvelope, color: context.colors!.fieldNormalText, size: 20,),
                      mandatority: 0,
                      textCapitalization: TextCapitalization.none,
                      tagForError: 'password_reset',
                      controller: _emailController, validator: AppValidators.email,),
                    SizedBox(height: 32,),
                    AppElevatedButton(
                      title: AppLocalizations.of(context)!.reset_password, onPressed: (){
                        _errorTag = '';
                        if(_emailController.text.trim().isEmpty){
                          setState((){
                            _errorTag = 'password_reset';
                          });
                          Future.delayed(Duration(milliseconds: 100)).then((_){
                            _formKey.currentState!.validate();
                          });
                          AppToast.instance.showError(context, AppLocalizations.of(context)!.reset_password_empty_error);
                          return;
                        }else if(AppValidators.email(_emailController.text) != null){
                          setState((){
                            _errorTag = 'password_reset';
                          });
                          Future.delayed(Duration(milliseconds: 100)).then((_){
                            _formKey.currentState!.validate();
                          });
                          AppToast.instance.showError(context, AppLocalizations.of(context)!.reset_password_email_not_valid_error);
                          return;
                        }
                        //context.loaderOverlay.show();
                    }),
                    const SizedBox(height: 32,),
                    AppOutlinedButton(title: AppLocalizations.of(context)!.back, onPressed: () => context.pop()),
                    const Spacer(flex: 2,)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
