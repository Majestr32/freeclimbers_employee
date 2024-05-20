import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      context.go(RouteNames.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light ? Color(0xFF429DEB) : Color(0xFF214C72),
      child: Center(child: Image.asset('assets/images/logo.png', fit: BoxFit.fill, width: 128, height: 128,)),
    );
  }
}
