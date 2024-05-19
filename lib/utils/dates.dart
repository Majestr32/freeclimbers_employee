import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String formatTime(DateTime time){
  final dateFormat = DateFormat.jm();
  return dateFormat.format(time);
}

String formattedDate(DateTime date){
  final dateFormat = DateFormat('dd.MM.yyyy');
  return dateFormat.format(date);
}

///Extracts localized names from [context] to display date
String formattedPaymentGroup(BuildContext context, DateTime date){
  if(DateTime.now().day == date.day){
    return AppLocalizations.of(context)!.today;
  }else if(DateTime.now().day == date.day - 1){
    return AppLocalizations.of(context)!.yesterday;
  }else{
    final dateFormat = DateFormat('dd. MMM yyyy');
    return dateFormat.format(date);
  }
}