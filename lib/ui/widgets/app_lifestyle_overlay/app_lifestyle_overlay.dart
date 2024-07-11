import 'dart:developer';
import 'dart:ui';

import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/blocs/security_bloc/security_bloc.dart';
import 'package:climbers/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLifecycleOverlay extends StatefulWidget {
  final Widget child;
  const AppLifecycleOverlay({Key? key, required this.child}) : super(key: key);

  @override
  State<AppLifecycleOverlay> createState() => _AppLifecycleOverlayState();
}

class _AppLifecycleOverlayState extends State<AppLifecycleOverlay>
    with WidgetsBindingObserver {
  bool shouldBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      shouldBlur = state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused;
    });
    if(shouldBlur){
      Future.delayed(Duration(milliseconds: 200), (){
        if(!context.read<SecurityBloc>().state.isLocked){
          context.read<SecurityBloc>().add(const SecurityEvent.fetchAvailableSecurities(firstLaunch: false));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        IgnorePointer(
          ignoring: !shouldBlur,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            tween: Tween<double>(begin: 0, end: !shouldBlur ? 0 : 6),
            builder: (context, val, widget) {
              log(val.toString());
              return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: shouldBlur ? 6 : val, sigmaY: shouldBlur ? 6 : val),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color:
                !shouldBlur ? Colors.transparent :
                context.watch<ThemeBloc>().state.brightness == Brightness.light ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
              ),
            );
            },
          ),
        ),
      ],
    );
  }
}