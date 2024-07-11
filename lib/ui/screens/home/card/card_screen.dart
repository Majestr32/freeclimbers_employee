import 'package:universal_io/io.dart';

import 'package:climbers/blocs/branches_cubit/branches_cubit.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:device_display_brightness/device_display_brightness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import '../../../../blocs/member_cubit/member_cubit.dart';
import '../../../../consts/k_colors.dart';
import '../../../../utils/permissions.dart';
import '../../../../utils/toasts.dart';
import '../../../widgets/app_drawer/app_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/buttons/app_elevated_button.dart';
import '../../../widgets/home/member_card.dart';
import '../../../widgets/nav/app_navbar.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final appState = context.read<AppCubit>().state;

  @override
  void initState() {
    DeviceDisplayBrightness.setBrightness(1);
    super.initState();
  }

  @override
  void dispose() {
    DeviceDisplayBrightness.resetBrightness();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberCubit,MemberState>(
      listener: (context,state) async{
        if(state.status == MemberStateStatus.memberCardDownloaded){
          context.read<MemberCubit>().openMemberCard();
        }
      },
      child: Scaffold(
        backgroundColor: context.colors!.basePrimaryBack,
        key: _scaffoldKey,
        drawer: AppDrawer(
          scaffoldKey: _scaffoldKey,
          currentPage: DrawerPages.card,
          onTransitionStart: (){
            DeviceDisplayBrightness.resetBrightness();
          },
        ),
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.member_card,
          onSuffixWidgetTap: () {
            context.pop();
          },
          suffixWidget: Icon(FontAwesomeIcons.times, color: KColors.white, size: 24,),
        ),
        body: ConnectivityBadge(
          child: !context.watch<AppCubit>().state.branchIsSelected ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Text(AppLocalizations.of(context)!.disabled_membercard, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 22,
                  color: context.colors!.fieldNormalPlaceholder, fontWeight: FontWeight.w500),),
            ),
          ) : Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                MemberCard(title: context.watch<MemberCubit>().state.memberData!.fullName!, number: context.watch<MemberCubit>().state.memberData!.no!,),
                SizedBox(height: 36,),
                AppElevatedButton(title: AppLocalizations.of(context)!.add_to_wallet, onPressed: () async{
                  await requestStoragePermissions();
                  if(Platform.isAndroid){
                    AppToast.instance.showInfo(context, AppLocalizations.of(context)!.not_available_for_android);
                  }else if(Platform.isIOS){
                    AppToast.instance.showInfo(context, AppLocalizations.of(context)!.requesting_membercard);
                    context.read<MemberCubit>().getNewWalletPass(context.read<BranchesCubit>().state.getBranchByNo(context.read<AppCubit>().state.selectedBranchId.toString()));
                  }
                }, expanded: false,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}