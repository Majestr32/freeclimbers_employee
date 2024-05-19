import 'package:freeclimbers_employee/blocs/branches_cubit/branches_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchesCubit,BranchesState>(
      listener: (context,state){
        if(state.status == BranchesStateStatus.loaded){
          if(router.location != RouteNames.home || router.location != RouteNames.main){
            context.go(RouteNames.home, extra: 1);
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light ? Color(0xFF429DEB) : Color(0xFF214C72),
        child: Center(child: Image.asset('assets/images/logo.png', fit: BoxFit.fill, width: 128, height: 128,)),
      ),
    );
  }
}
