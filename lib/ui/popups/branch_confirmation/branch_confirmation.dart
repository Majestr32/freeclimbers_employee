
import 'dart:async';
import 'dart:developer';

import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/blocs/branch_registration_bloc/branch_registration_bloc.dart';
import 'package:climbers/blocs/branches_cubit/branches_cubit.dart';
import 'package:climbers/blocs/locale_cubit/locale_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/popups/branch_confirmation_success/branch_confirmation_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../blocs/extend_profile_bloc/extend_profile_bloc.dart';
import '../../../blocs/theme_bloc/theme_bloc.dart';
import '../../../consts/web_documents_enums.dart';
import '../../../repositories/app/app_repository.dart';
import '../../../repositories/member/member_repository.dart';
import '../../../utils/toasts.dart';

Future<void> showBranchConfirmationPopup(BuildContext context, BranchRegistrationBloc branchRegistrationBloc){
  return showDialog(
      useRootNavigator: true,
      context: context, builder: (context){
    return BlocProvider.value(
        value: branchRegistrationBloc,
        child: _BranchConfirmation());
  });
}

class _BranchConfirmation extends StatefulWidget {
  const _BranchConfirmation({Key? key}) : super(key: key);

  @override
  State<_BranchConfirmation> createState() => _BranchConfirmationState();
}

class _BranchConfirmationState extends State<_BranchConfirmation> {
  bool _pressed = false;
  StreamSubscription? _subscription;
  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          brightness: context.watch<ThemeBloc>().state.brightness
      ),
      child: BlocListener<BranchRegistrationBloc, BranchRegistrationState>(
  listener: (context, state) {
      state.maybeWhen(
          added: (branchData, requiredFields) async{
            ExtendProfileBloc extendProfileBloc = ExtendProfileBloc(requiredFields: requiredFields, branchesCubit: context.read<BranchesCubit>(), appRepository: context.read<AppRepository>(), qrData: branchData, memberCubit: context.read<MemberCubit>());
            _subscription = extendProfileBloc.stream.listen((event) {
              event.maybeMap(
                  identifiedProblem: (_){
                    Navigator.of(context).pop();
                    context.push(RouteNames.extendProfile, extra: extendProfileBloc);
                  },
                  conflictResolved: (_){
                    Navigator.of(context).pop();
                    showBranchConfirmationSuccessPopup(context);
                  },
                  orElse: (){});
            });
          },
          rejected: (){
            Navigator.of(context).pop();
          },
          error: (error,_){
            AppToast.instance.showError(context, AppLocalizations.of(context)!.no_usable_data_found);
          },
          orElse: (){});
  },
  child: CupertinoAlertDialog(
      actions: [
        Row(
          children: [
            Expanded(
              child: CupertinoDialogAction(
                textStyle: TextStyle(color: KColors.systemMsgText(context), fontSize: 8),
                onPressed: (){
                  context.read<BranchRegistrationBloc>().add(BranchRegistrationEvent.rejectBranchTerms());
                },
                child: Container(
                  color: KColors.transparent,
                  width: double.infinity,
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),
                  ),
                ),),
            ),
            Container(
              height: 45,
              width: 0.3,
              color: KColors.systemMsgSpacer(context),
            ),
            Expanded(
              child: CupertinoDialogAction(
                textStyle: TextStyle(color: KColors.systemMsgText(context), fontSize: 8),
                onPressed: (){
                  if(_pressed){
                    return;
                  }
                  setState(() {
                    _pressed = true;
                  });
                  context.read<BranchRegistrationBloc>().add(BranchRegistrationEvent.confirmBranchTerms());
                },
                child: Container(
                  width: double.infinity,
                  color: KColors.transparent,
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.continue_text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),),
                  ),
                ),),
            ),
          ],
        ),
      ],
      content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Icon(FontAwesomeIcons.addressCard, color: Color(0xFF8991A6), size: 48,),
              SizedBox(height: 15,),
              Text(AppLocalizations.of(context)!.connect_to_gym_question, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ((){
                  return SuperRichText(
                    textAlign: TextAlign.center,
                    text: AppLocalizations.of(context)!.by_continuing_you_agree_to_the_of_gym('<link>' + "${AppLocalizations.of(context)!.terms_of_use}" + '<link>' + ' & ' + '<link>' + "${AppLocalizations.of(context)!.privacy_policy}" + '<link>'),
                    othersMarkers: [

                      MarkerText.withFunction(marker: '<link>', functions: [
                        () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.terms,), extra: {"content": context.read<BranchRegistrationBloc>().state.maybeWhen(
                            foundBranch: (data,documents){
                              return documents!.branchTerms!;
                            },
                            orElse: () => ""), "overrideIcon": context.read<BranchRegistrationBloc>().state.maybeWhen(
                            foundBranch: (data,documents){
                              return data!.logo;
                            },
                            orElse: () => null)}),


                        () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.privatePolicy), extra: {"content": context.read<BranchRegistrationBloc>().state.maybeWhen(
                            foundBranch: (data,documents){
                              return documents!.branchPrivacy!;
                            },
                            orElse: () => ""), "overrideIcon": context.read<BranchRegistrationBloc>().state.maybeWhen(
                            foundBranch: (data,documents){
                              return data!.logo;
                            },
                            orElse: () => null)}),
                      ], style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  );
                }())
              ),
            ],
          ),
        ),
  ),
),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
