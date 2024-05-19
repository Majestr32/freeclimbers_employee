import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Salutations{
  Mr(1),
  Mrs(2),
  Diverse(3);

  ///Returns localized salutation name from [context] using Applocalizations.of(context)
  String getLocalizedSalutationName(BuildContext context){
    switch(value){
      case 1:
        return AppLocalizations.of(context)!.mr;
      case 2:
        return AppLocalizations.of(context)!.mrs;
      case 3:
        return AppLocalizations.of(context)!.diverse;
      default:
        return '';
    }
  }

  final int value;
  const Salutations(this.value);
}

enum Countries{
  Germany(1),
  Swiss(2),
  Austria(3);

  ///Returns localized salutation name from [context] using Applocalizations.of(context)
  String getLocalizedCountryName(BuildContext context){
    switch(value){
      case 1:
        return AppLocalizations.of(context)!.germany;
      case 2:
        return AppLocalizations.of(context)!.swiss;
      case 3:
        return AppLocalizations.of(context)!.austria;
      default:
        return '';
    }
  }

  final int value;
  const Countries(this.value);
}