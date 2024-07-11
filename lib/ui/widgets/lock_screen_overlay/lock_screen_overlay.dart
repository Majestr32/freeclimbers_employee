import 'dart:async';
import 'dart:developer';

import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/blocs/security_bloc/security_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LockScreenOverlay extends StatefulWidget {
  final SecurityBloc securityBloc;
  final MemberCubit memberCubit;
  final AppCubit appCubit;
  final Widget child;

  const LockScreenOverlay(
      {Key? key, required this.securityBloc, required this.child, required this.memberCubit, required this.appCubit})
      : super(key: key);

  @override
  State<LockScreenOverlay> createState() => _LockScreenOverlayState();
}

class _LockScreenOverlayState extends State<LockScreenOverlay> {

  late final StreamSubscription _securitySubscription;
  late final StreamSubscription _memberSubscription;
  late final StreamSubscription _appSubscription;

  bool _isLocked = false;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _securitySubscription = widget.securityBloc.stream.listen((event) {
      if(event.isLocked && event.needAuthentication && event.loginWithFaceId){
        setState(() {
          _isLocked = true;
        });
      }else{
        setState(() {
          _isLocked = false;
        });
      }
    });

    _memberSubscription = widget.memberCubit.stream.listen((event) {
      if(widget.memberCubit.state.status == MemberStateStatus.authenticated){
        setState((){
          _isAuthenticated = true;
        });
      }else{
        setState(() {
          _isAuthenticated = false;
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        _isLocked && _isAuthenticated ? _LockScreen(securityBloc: widget.securityBloc) : SizedBox.shrink()
      ],
    );
  }

  @override
  void dispose() {
    _securitySubscription.cancel();
    _memberSubscription.cancel();
    _appSubscription.cancel();
    super.dispose();
  }
}

class _LockScreen extends StatefulWidget {
  final SecurityBloc securityBloc;
  const _LockScreen({Key? key, required this.securityBloc}) : super(key: key);

  @override
  State<_LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<_LockScreen> with WidgetsBindingObserver{
  bool needToRequestAuth = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if(SchedulerBinding.instance.lifecycleState == AppLifecycleState.paused || SchedulerBinding.instance.lifecycleState == AppLifecycleState.inactive){
      setState((){
        needToRequestAuth = true;
      });
      return;
    }

    context.read<SecurityBloc>().add(SecurityEvent.authWithSetMethod());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state != AppLifecycleState.inactive && state != AppLifecycleState.paused && needToRequestAuth){
      context.read<SecurityBloc>().add(SecurityEvent.authWithSetMethod());
      Future.delayed(Duration(milliseconds: 200), (){
        context.read<SecurityBloc>().add(const SecurityEvent.fetchAvailableSecurities(firstLaunch: false));
      });
      setState(() {
        needToRequestAuth = false;
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: context.colors!.mainPrimaryBack,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    context.read<SecurityBloc>().add(SecurityEvent.discardAuthentication());
                  },
                  child: Icon(FontAwesomeIcons.times, color: context.colors!.mainPrimaryText,),
                ),
              ),
              Center(
                child: Image.asset('assets/images/logo.png', width: 100, height: 100,),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppElevatedButton(
                    inverseColors: true,
                    title: "${AppLocalizations.of(context)!.authenticate_with} ${widget.securityBloc.state.lockingMechanism(context)}",
                    onPressed: (){
                      context.read<SecurityBloc>().add(SecurityEvent.authWithSetMethod());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
