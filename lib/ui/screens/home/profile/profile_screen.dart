import 'dart:developer';

import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/widgets/app_drawer/app_drawer.dart';
import 'package:climbers/ui/widgets/buttons/app_elevated_button.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:climbers/ui/widgets/profile/profile_topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import '../../../../consts/k_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors!.basePrimaryBack,
      key: _scaffoldKey,
      drawer: AppDrawer(
        scaffoldKey: _scaffoldKey,
        currentPage: DrawerPages.profile,
      ),
      appBar: AppNavbar(
        title: AppLocalizations.of(context)!.profile,
        onPrefixWidgetTap: () => context.pop(),
        prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: KColors.white, size: 24,),
        onSuffixWidgetTap: () => context.push(RouteNames.editProfile),
        suffixWidget: Icon(FontAwesomeIcons.userEdit, color: KColors.white, size: 20,),
      ),
      body: ConnectivityBadge(
        child: BlocBuilder<MemberCubit,MemberState>(
          builder: (context,state) => Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              ProfileTopBar(),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                height: 44,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(AppLocalizations.of(context)!.user_information, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: context.colors!.mainSecondaryText),))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  color: context.colors!.mainSecondaryBack,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                  color: context.colors!.baseSecondaryBack
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _infoTile(AppLocalizations.of(context)!.fullname, state.memberData!.fullName == null ? null : (state.memberData?.getSalutationName(context) ?? '') + " " + state.memberData!.fullName!),
                      ((){
                        final str = [(state.memberData!.street ?? ''),(state.memberData!.city != null ? (state.memberData!.postcode ?? '') + " " + (state.memberData!.city ?? '') : ''),(state.memberData!.getCountryName(context) ?? '')];
                        str.removeWhere((e) => e.isEmpty);
                        return _infoTile(AppLocalizations.of(context)!.address, str.every((s) => s.trim().isEmpty) ? null : str.join("\n"));
                      }()),
                      _infoTile(AppLocalizations.of(context)!.title, state.memberData!.title),
                      _infoTile(AppLocalizations.of(context)!.company, state.memberData!.company),
                      _infoTile(AppLocalizations.of(context)!.phone, state.memberData!.phone),
                      _infoTile(AppLocalizations.of(context)!.email, state.memberData!.email),
                      _infoTile(AppLocalizations.of(context)!.birthday, state.memberData!.birthday),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36,),
              AppElevatedButton(title: AppLocalizations.of(context)!.logout,
                  expanded: false,
                  onPressed: (){
                context.read<MemberCubit>().logout();
              })
            ],),
          ),
        ),
      )
    );
  }

  Widget _infoTile(String? key, String? value){
    return key == null || value == null || key.isEmpty || value.isEmpty ? SizedBox.shrink() : Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(key, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.colors!.basePrimaryText),),
              SizedBox(width: 20,),
              Expanded(child: Text(value, textAlign: TextAlign.end, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: context.colors!.basePrimaryText))),
            ],
          ),
        )
      ],
    );
  }
}
