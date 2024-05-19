import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/theme_bloc/theme_bloc.dart';
import '../../../consts/k_colors.dart';

Future<void> showBranchChangeSuccessPopup(BuildContext context){
  return showDialog(
      useRootNavigator: true,
      context: context, builder: (context){
    return _BranchChangeSuccess();
  });
}

class _BranchChangeSuccess extends StatelessWidget {
  const _BranchChangeSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          brightness: context.watch<ThemeBloc>().state.brightness
      ),
      child: CupertinoAlertDialog(
        actions: [
          CupertinoDialogAction(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              width: double.infinity,
              color: KColors.transparent,
              child: Center(
                child: Text(AppLocalizations.of(context)!.ok.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Color(0xFF4D8EF6)),),
              ),
            ),)
        ],
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.already_registered_to_branch_title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),)),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.already_registered_to_branch_message, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)),
            ],
          ),
        ),
      ),
    );
  }
}
