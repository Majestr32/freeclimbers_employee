import 'package:universal_io/io.dart';

import 'package:freeclimbers_employee/utils/platform/android.dart';
import 'package:freeclimbers_employee/utils/platform/ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppPlatformUtils{
  AppPlatformUtils._internal();
  static final AppPlatformUtils _instance = AppPlatformUtils._internal();

  static AppPlatformUtils get instance => _instance;

  Future<DateTime?> showDatePicker(BuildContext context, DateTime currentDate, DateTime startDate, DateTime endDate) async{
    if(Platform.isIOS){
      return IosPlatformUtils.instance.showIosDatePicker(context, currentDate, startDate, endDate);
    }else{
      return AndroidPlatformUtils.instance.showAndroidDatePicker(context, currentDate, startDate, endDate);
    }
  }

  Future<bool> showConfirmationWindow(BuildContext context) async{
    final yes = AppLocalizations.of(context)!.yes;
    final no = AppLocalizations.of(context)!.no;
    final title = AppLocalizations.of(context)!.confirm_delete_branch_topic;
    final content = AppLocalizations.of(context)!.confirm_delete_branch_text;
    if(Platform.isIOS){
      return IosPlatformUtils.instance.showIosConfirmationWindow(context, title, content, yes, no);
    }else{
      return AndroidPlatformUtils.instance.showAndroidConfirmationWindow(context, title, content, yes, no);
    }
  }
}