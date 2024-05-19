import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/theme_bloc/theme_bloc.dart';
import '../../../consts/k_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showBranchConfirmationSuccessPopup(BuildContext context){
  return showDialog(
      useRootNavigator: true,
      context: context, builder: (context){
    return _BranchConfirmationSuccess();
  });
}

class _BranchConfirmationSuccess extends StatelessWidget {
  const _BranchConfirmationSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          brightness: context.watch<ThemeBloc>().state.brightness
      ),
      child: CupertinoAlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.success_joined_jym_title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),)),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.success_joined_jym_message, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              width: double.infinity,
              color: KColors.transparent,
              child: Center(
                child: Text(AppLocalizations.of(context)!.ok.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
              ),
            ),)
        ],
      ),
    );
  }
}
