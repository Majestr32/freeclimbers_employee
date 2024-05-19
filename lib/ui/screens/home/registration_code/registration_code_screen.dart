import 'dart:convert';

import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/ui/widgets/registration_code/registration_code.dart';
import 'package:device_display_brightness/device_display_brightness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../consts/k_colors.dart';

class RegistrationCodeScreen extends StatefulWidget {
  const RegistrationCodeScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationCodeScreen> createState() => _RegistrationCodeScreenState();
}

class _RegistrationCodeScreenState extends State<RegistrationCodeScreen> {

  @override
  Widget build(BuildContext context) {
    final memberState = context.watch<MemberCubit>().state;
    final appState = context.watch<AppCubit>().state;
    return WillPopScope(
      onWillPop: () async{
        DeviceDisplayBrightness.resetBrightness();
        return true;
      },
      child: Scaffold(
        backgroundColor: context.colors.basePrimaryBack,
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.registration_code,
          onSuffixWidgetTap: () {
            DeviceDisplayBrightness.resetBrightness();
            context.pop();
          },
          suffixWidget: Container(
            color: KColors.transparent,
            child: Icon(FontAwesomeIcons.times, color: context.colors.mainPrimaryText, size: 24,),
          ),
        ),
        body: ConnectivityBadge(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: RegistrationCodeWidget(context: context, time: DateTime.now(), code: memberState.memberRegistrationCode!.code, colorSet: appState.settings!.colors, qr: base64Decode(memberState.memberRegistrationCode!.qrcode), branchImage: appState.branchIcon!,)),
              const SizedBox(height: 14,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('You can register you with this QR-Code in the location. Show the QR-Code in the location at the checkout', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: context.colors.fieldNormalText),))
            ],
          ),
        ),
      ),
    );
  }
}
