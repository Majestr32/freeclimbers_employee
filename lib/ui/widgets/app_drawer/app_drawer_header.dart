import 'dart:developer';

import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../profile_image/profile_image.dart';

class AppDrawerHeader extends StatefulWidget {
  final VoidCallback onTap;
  const AppDrawerHeader({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AppDrawerHeader> createState() => _AppDrawerHeaderState();
}

class _AppDrawerHeaderState extends State<AppDrawerHeader> {

  late final appState = context.read<AppCubit>().state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit,MemberState>(
      builder: (context,state) {
        log(state.memberData.toString());
        return Container(height: 50 + MediaQuery.of(context).padding.top, width: double.infinity, color: context.colors!.mainPrimaryBack,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 50,
                color: KColors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: 56,
                        height: 50,
                        child: Center(child: ProfileImage(profileImage: state.profileImage, size: 40, borderSize: 1,))),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.memberData!.fullName!, style: TextStyle(fontWeight: FontWeight.bold, color: context.colors!.mainPrimaryText),)),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(state.memberData!.email!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: context.colors!.mainPrimaryText),)),
                        ],),
                    ),
                    SizedBox(
                      width: 54,
                      height: 44,
                      child: Icon(FontAwesomeIcons.chevronRight, size: 16, color: context.colors!.mainPrimaryText,),
                    )
                  ],),
              ),
            ),
          ));
      },
    );
  }
}
