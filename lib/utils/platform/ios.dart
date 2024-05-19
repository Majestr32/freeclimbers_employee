import 'dart:async';

import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theme_bloc/theme_bloc.dart';
import '../../consts/k_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class IosPlatformUtils{
  IosPlatformUtils._internal();
  static final IosPlatformUtils _instance = IosPlatformUtils._internal();

  static IosPlatformUtils get instance => _instance;

  Future<bool> showIosConfirmationWindow(BuildContext context, String title, String content, String yes, String no) async{
    bool? chosen;
    await showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoTheme(
            data: CupertinoThemeData(
                brightness: context.watch<ThemeBloc>().state.brightness
            ),
            child: CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                // The "Yes" button
                CupertinoDialogAction(
                  onPressed: () {
                    chosen = true;
                    Navigator.of(context).pop();
                  },
                  child: Text(yes),
                  isDefaultAction: true,
                  isDestructiveAction: true,
                ),
                // The "No" button
                CupertinoDialogAction(
                  onPressed: () {
                    chosen = false;
                    Navigator.of(context).pop();
                  },
                  child: Text(no),
                  isDefaultAction: false,
                  isDestructiveAction: false,
                )
              ],
            ),
          );
        });
    return chosen ?? false;
  }

  Future<DateTime?> showIosDatePicker(BuildContext context, DateTime currentDate, DateTime startDate, DateTime endDate) async{
    DateTime? date;
    bool returnResult = true;
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => CupertinoTheme(
          data: CupertinoThemeData(
            brightness: context.read<ThemeBloc>().state.brightness
          ),
          child: Container(
            height: 230,
            color: context.read<ThemeBloc>().state.brightness == Brightness.light ? KColors.white : KColors.black,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 180,
                    color: context.read<ThemeBloc>().state.brightness == Brightness.light ? KColors.white : KColors.black,
                    child: CupertinoDatePicker(
                        initialDateTime: currentDate,
                        //minimumDate: startDate,
                        minimumYear: startDate.year,
                        maximumYear: endDate.year,
                        //maximumDate: endDate,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          date = val;
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(children: [
                    GestureDetector(
                        onTap: (){
                          returnResult = false;
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: KColors.red),)),
                    Spacer(),
                    GestureDetector(
                        onTap: (){
                          returnResult = true;
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.ok.toUpperCase(), style: TextStyle(color: context.colors!.link),))
                  ],),
                ),
              ],
            ),
          ),
        ));

    if(!returnResult){
      return null;
    }else{
      return date;
    }
  }


}