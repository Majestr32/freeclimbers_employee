import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum WebDocumentRoutes{
  terms('terms'),
  privatePolicy('privacy'),
  legalNotice('disclaimer'),
  imprint('imprint');

  ///Returns localized document name from [context] using Applocalizations.of(context)
  String getLocalizedDocumentName(BuildContext context){
    switch(index){
      case 0:
        return AppLocalizations.of(context)!.terms_of_use;
      case 1:
        return AppLocalizations.of(context)!.privacy_policy;
      case 2:
        return AppLocalizations.of(context)!.legal_notice;
      case 3:
        return AppLocalizations.of(context)!.imprint;
      default:
        return '';
    }
  }
  static WebDocumentRoutes fromString(String str) => WebDocumentRoutes.values.firstWhere((e) => e.route == str, orElse: () => WebDocumentRoutes.imprint);

  final String route;
  const WebDocumentRoutes(this.route);
}

enum WebBranchDocumentRoutes{
  terms('terms','customer/v1/app/getTerms'),
  privatePolicy('privacy','customer/v1/app/getTerms'),
  imprint('imprint','');

  ///Returns localized document name from [context] using Applocalizations.of(context)
  String getLocalizedDocumentName(BuildContext context){
    switch(index){
      case 0:
        return AppLocalizations.of(context)!.terms_of_use;
      case 1:
        return AppLocalizations.of(context)!.privacy_policy;
      case 2:
        return AppLocalizations.of(context)!.imprint;
      default:
        return '';
    }
  }
  static WebBranchDocumentRoutes fromString(String str) => WebBranchDocumentRoutes.values.firstWhere((e) => e.route == str, orElse: () => WebBranchDocumentRoutes.terms);

  final String route;
  final String path;
  const WebBranchDocumentRoutes(this.route, this.path);
}