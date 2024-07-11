import 'package:climbers/extensions/colors.dart';
import 'package:climbers/utils/license.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../consts/k_colors.dart';
import '../../../widgets/nav/app_navbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LicenseScreen extends StatelessWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: context.colors.basePrimaryBack,
        navigationBar: AppNavbar(title: AppLocalizations.of(context)!.license,
          onPrefixWidgetTap: () => context.pop(),
          prefixWidget: Container(
          color: KColors.transparent,
          child: Icon(FontAwesomeIcons.chevronLeft, color: context.colors.mainPrimaryText, size: 24,),
        ),),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: getLicenseContent(textStyle: TextStyle(color: context.colors.basePrimaryText))));
  }
}
