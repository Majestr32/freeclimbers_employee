

import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/blocs/branch_registration_bloc/branch_registration_bloc.dart';
import 'package:climbers/blocs/branches_cubit/branches_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/blocs/tutorial_bloc/tutorial_bloc.dart';
import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/repositories/app/app_repository.dart';
import 'package:climbers/repositories/qr_code/qr_code_repository.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/popups/branch_change_success/branch_change_success.dart';
import 'package:climbers/ui/popups/branch_confirmation/branch_confirmation.dart';
import 'package:climbers/ui/popups/branch_confirmation_success/branch_confirmation_success.dart';
import 'package:climbers/ui/widgets/app_drawer/app_drawer.dart';
import 'package:climbers/ui/widgets/branch_image/branch_image.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:climbers/ui/widgets/profile_image/profile_image.dart';
import 'package:climbers/ui/widgets/tutorial_window/tutorial_window.dart';
import 'package:climbers/utils/dates.dart';
import 'package:climbers/utils/permissions.dart';
import 'package:device_display_brightness/device_display_brightness.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:overlay_tutorial/overlay_tutorial.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    requestStoragePermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.basePrimaryBack,
        key: _scaffoldKey,
        drawer: AppDrawer(
          currentPage: DrawerPages.home,
          scaffoldKey: _scaffoldKey,
        ),
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.home,
          prefixWidget: ProfileImage(
            profileImage: context.watch<MemberCubit>().state.profileImage, size: 40, borderSize: 1,),
          onPrefixWidgetTap: () => _scaffoldKey.currentState!.openDrawer(),
          suffixWidget: BranchImage(
            branchImage: context.read<AppCubit>().state.branchIconOrDefault, isEmptyBranchIsLogo: false, width: 36, height: 36, ),
          onSuffixWidgetTap: () {
            DeviceDisplayBrightness.setBrightness(1);
            context.push(RouteNames.card);
          },
        ),
        body: ConnectivityBadge(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(AppLocalizations.of(context)!.welcome_back, style: TextStyle(color: context.colors.fieldNormalText, fontSize: 16, fontWeight: FontWeight.w400),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text((context.watch<MemberCubit>().state.memberData?.firstname ?? '')
                  , style: TextStyle(color: context.colors.fieldNormalText, fontSize: 20, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        )
    );
  }
}
