
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/auth/bg.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/buttons/app_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.mainPrimaryBack,
      body: ConnectivityBadge(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Spacer(),
              Container(
                width: 176,
                height: 176,
                decoration: BoxDecoration(
                    color: context.colors.mainSecondaryBack,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 4, color: KColors.white)
                ),
                child: Center(
                  child: Icon(FontAwesomeIcons.check, color: KColors.white, size: 66),
                ),
              ),
              SizedBox(height: 40,),
              Text(AppLocalizations.of(context)!.account_created, style: TextStyle(fontWeight: FontWeight.w700, color: context.colors.mainPrimaryText, fontSize: 30),),
              SizedBox(height: 52,),
              Text(AppLocalizations.of(context)!.verification_sent, textAlign: TextAlign.center, style: TextStyle(color: context.colors.mainPrimaryText, fontSize: 20),),
              SizedBox(height: 64,),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: AppElevatedButton(
                    inverseColors: true,
                    title: AppLocalizations.of(context)!.next,
                    onPressed: (){
                      context.read<MemberCubit>().goBackToSignIn();
                    },
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
