
import 'package:climbers/blocs/locale_cubit/locale_cubit.dart';
import 'package:climbers/blocs/security_bloc/security_bloc.dart';
import 'package:climbers/blocs/theme_bloc/theme_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/popups/face_id_success/face_id_success.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:climbers/utils/action_sheet.dart';
import 'package:climbers/utils/lock_timeout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../consts/k_colors.dart';
import '../../../widgets/app_drawer/app_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecurityBloc, SecurityState>(
  listener: (context, state) {
    state.maybeMap(
      initialized: (state){
        final pushMessagesEnabled = !state.pushMessages;
        if(pushMessagesEnabled){
          OneSignal.User.pushSubscription.optIn();
        }else{
          OneSignal.User.pushSubscription.optOut();
        }
      },
        enabledBiometrics: (_){
          showFaceIdSuccessPopup(context);
        },
        orElse: (){});
  },
  child: Scaffold(
      backgroundColor: context.colors!.basePrimaryBack,
      key: _scaffoldKey,
      drawer: AppDrawer(
        scaffoldKey: _scaffoldKey,
        currentPage: DrawerPages.settings,
      ),
      appBar: AppNavbar(
        title: AppLocalizations.of(context)!.settings,
        onPrefixWidgetTap: () => context.pop(),
        prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: KColors.white, size: 24,),
      ),
      body: ConnectivityBadge(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _section(AppLocalizations.of(context)!.profile),
                _arrowTile(AppLocalizations.of(context)!.change_profile, () => context.push(RouteNames.editProfile), FontAwesomeIcons.solidUser),
                _arrowTile(AppLocalizations.of(context)!.change_password, () => context.push(RouteNames.changePassword), FontAwesomeIcons.lock),
                _arrowTile(AppLocalizations.of(context)!.change_photo, () => showPhotoActionSheet(context), FontAwesomeIcons.solidImage, true),
                SizedBox(height: 12,),
                _section(AppLocalizations.of(context)!.misc),
                _toggleTile(AppLocalizations.of(context)!.push_messages, context.watch<SecurityBloc>().state.pushMessages, () => context.read<SecurityBloc>().add(SecurityEvent.togglePushMessages()), FontAwesomeIcons.solidPaperPlane),
                _toggleTile(AppLocalizations.of(context)!.dark_mode, context.watch<ThemeBloc>().state.isNightTheme, (){
                  context.read<ThemeBloc>().add(ThemeEvent.toggleTheme());
                }, FontAwesomeIcons.solidMoon),
                _dropdownTile(AppLocalizations.of(context)!.language, context.watch<LocaleCubit>().state == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.german, (){
                  showLocaleActionSheet(context).then((locale){
                    if(locale == null){
                      return;
                    }else{
                      context.read<LocaleCubit>().changeLanguage(locale.languageCode);
                    }
                  });
                }, FontAwesomeIcons.solidFlag, true),
                SizedBox(height: 12,),
                _section(AppLocalizations.of(context)!.security),
                _toggleTile(AppLocalizations.of(context)!.require + " " + context.watch<SecurityBloc>().state.lockingMechanism(context), context.watch<SecurityBloc>().state.loginWithFaceId, () => context.read<SecurityBloc>().add(SecurityEvent.toggleLoginWithFaceId()), FontAwesomeIcons.userLock),
                _dropdownTile(AppLocalizations.of(context)!.automatic_lock, context.read<SecurityBloc>().state.timeout!.text(context.read<LocaleCubit>().state), () async{
                  final selectedLock = await _pickLock(context.read<SecurityBloc>().state.timeout!);
                  if(!mounted){
                    return;
                  }
                  context.read<SecurityBloc>().add(SecurityEvent.setTimeout(timeout: selectedLock));
                }, FontAwesomeIcons.lock, true)
              ],
            ),
          ),
        ),
      ),
    ),
);
  }

  Future<LockTimeout> _pickLock(LockTimeout defaultValue) async{
    LockTimeout value = defaultValue;
    bool returnValue = true;
    final items = LockTimeout.values.map((e) => DropdownMenuItem(
        value: e,
        child: Center(child: Text(e.text(context.read<LocaleCubit>().state))))).toList();
    final scrollController = FixedExtentScrollController(initialItem: items.map((e) => e.value).toList().indexOf(value));
    await showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
      height: 190,
      color: SchedulerBinding.instance.window.platformBrightness == Brightness.light ? KColors.white : KColors.black,
      child: Column(
        children: [
          Container(
            height: 180,
            color: SchedulerBinding.instance.window.platformBrightness == Brightness.light ? KColors.white : KColors.black,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                CupertinoPicker(
                    scrollController: scrollController,
                    itemExtent: 40,
                    onSelectedItemChanged: (i){
                      value = items[i].value!;
                    },
                    children: items),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(children: [
                    GestureDetector(
                        onTap: (){
                          returnValue = false;
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text('Cancel', style: TextStyle(color: KColors.red),)),
                    const Spacer(),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text('OK', style: TextStyle(color: context.colors!.mainPrimaryBack),))
                  ],),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
    scrollController.dispose();
    if(!returnValue){
      return defaultValue;
    }else{
      return value;
    }
  }

  Widget _section(String title){
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        color: context.colors!.mainSecondaryBack,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        boxShadow: [
          BoxShadow(color: KColors.black02, blurRadius: 4, offset: Offset(0,4))
        ]
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(title, style: TextStyle(color: context.colors!.mainSecondaryText, fontSize: 16, fontWeight: FontWeight.bold),))),
    );
  }
  Widget _arrowTile(String title, VoidCallback onPressed, IconData icon, [bool roundCorners = false]){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: context.colors!.baseSecondaryBack,
            borderRadius: BorderRadius.vertical(bottom: roundCorners ? Radius.circular(8) : Radius.zero)
        ),
        width: double.infinity,
        height: 44,
        child: Row(
          children: [
            SizedBox(
                width: 48,
                child: Center(child: Icon(icon, size: 20, color: context.colors!.fieldNormalText,))),
            Text(title, style: TextStyle(color: context.colors!.basePrimaryText, fontSize: 16, ),),
            Spacer(),
            Icon(FontAwesomeIcons.angleRight, color: context.colors!.basePrimaryText),
            SizedBox(width: 8,)
          ],
        ),
      ),
    );
  }
  Widget _toggleTile(String title, bool toggleOn, VoidCallback onPressed, IconData icon, [bool roundCorners = false]){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: context.colors!.baseSecondaryBack,
            borderRadius: BorderRadius.vertical(bottom: roundCorners ? Radius.circular(8) : Radius.zero)
        ),
        child: Row(
          children: [
            SizedBox(
                width: 48,
                child: Center(child: Icon(icon, size: 20, color: context.colors!.fieldNormalText,))),
            Expanded(child: Text(title, style: TextStyle(color: context.colors!.basePrimaryText, fontSize: 16, overflow: TextOverflow.ellipsis ),)),
            SizedBox(width: 30,),
            Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    trackColor: context.colors!.basePrimaryText.withOpacity(0.4),
                    activeColor: context.colors!.mainPrimaryBack.withOpacity(0.4),
                    thumbColor: toggleOn ? context.colors!.mainPrimaryBack : KColors.white,
                    value: toggleOn, onChanged: (_) => onPressed.call())),
            SizedBox(width: 4,)
          ],
        ),
      ),
    );
  }
  Widget _dropdownTile(String title, String selectedItemName, VoidCallback onPressed, IconData icon, [bool roundCorners = false]){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: context.colors!.baseSecondaryBack,
          borderRadius: BorderRadius.vertical(bottom: roundCorners ? Radius.circular(8) : Radius.zero)
        ),
        child: Row(
          children: [
            SizedBox(
                width: 48,
                child: Center(child: Icon(icon, size: 20, color: context.colors!.fieldNormalText,))),
            Expanded(child: Text(title, style: TextStyle(color: context.colors!.basePrimaryText, fontSize: 16, overflow: TextOverflow.ellipsis ),)),
            SizedBox(width: 30,),
            Text(selectedItemName, style: TextStyle(color: context.colors!.basePrimaryText, fontSize: 16, ),),
            Icon(FontAwesomeIcons.angleRight, color: context.colors!.basePrimaryText),
            SizedBox(width: 8,)
          ],
        ),
      ),
    );
  }
}
