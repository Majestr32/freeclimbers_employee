
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/utils/qr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../router.dart';
import '../../widgets/buttons/app_elevated_button.dart';

class RegistrationComplete extends StatefulWidget {
  final bool isAppClip;
  const RegistrationComplete({Key? key, required this.isAppClip}) : super(key: key);

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(widget.isAppClip){
          return false;
        }else{
          context.go(RouteNames.signIn);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.mainPrimaryBack,
        body: ConnectivityBadge(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: KColors.white,
                  ),
                  width: 176,
                  height: 176,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Qr(
                        content: context.read<MemberCubit>().state.memberRegistrationCode!.qrcode),
                  ),
                ),
                SizedBox(height: 40,),
                Text(AppLocalizations.of(context)!.registration_complete_title, style: TextStyle(fontWeight: FontWeight.w700, color: context.colors.mainPrimaryText, fontSize: 30),),
                SizedBox(height: 52,),
                Text(AppLocalizations.of(context)!.registration_complete_subtext, textAlign: TextAlign.center, style: TextStyle(color: context.colors.mainPrimaryText, fontSize: 20),),
                SizedBox(height: 40,),
                Text(AppLocalizations.of(context)!.verification_sent, textAlign: TextAlign.center, style: TextStyle(color: context.colors.mainPrimaryText, fontSize: 20),),
                SizedBox(height: 64,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: AppElevatedButton(
                      inverseColors: true,
                      title: AppLocalizations.of(context)!.close,
                      onPressed: () async{
                        if(widget.isAppClip){
                          _proposeToDownloadFullApp();
                        }else{
                          _close();
                        }
                      },
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _proposeToDownloadFullApp() async{
    final uri = Uri.parse("https://apps.apple.com/");
    if(await canLaunchUrl(uri)){
    launchUrl(uri);
    }
  }

  void _close() async{
    context.go(RouteNames.signIn);
  }
}
