import 'package:climbers/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../consts/k_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showFaceIdSuccessPopup(BuildContext context){
  return showDialog(
      useRootNavigator: true,
      context: context, builder: (context){
    return _FaceIdSuccess();
  });
}

class _FaceIdSuccess extends StatelessWidget {
  const _FaceIdSuccess({Key? key}) : super(key: key);

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
            child: Center(
              child: Text(AppLocalizations.of(context)!.ok.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: Color(0xFF4D8EF6)),),
            ),)
        ],
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.activated_successfully, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),)),
              SizedBox(height: 10,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.enabled_face_id, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)),
              SizedBox(height: 5,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppLocalizations.of(context)!.enabled_face_id_subtext, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)),

            ],
          ),
        ),
      ),
    );
  }
}
