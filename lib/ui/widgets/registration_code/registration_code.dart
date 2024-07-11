import 'dart:typed_data';

import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/profile_image/profile_image.dart';
import 'package:device_display_brightness/device_display_brightness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../consts/k_colors.dart';
import '../../../models/color_set/color_set.dart';
import '../branch_image/branch_image.dart';

class RegistrationCodeWidget extends StatefulWidget {
  final String code;
  final Uint8List qr;
  final DateTime time;
  final ColorSet colorSet;
  ///For localization purposes
  final BuildContext context;
  final Uint8List branchImage;

  const RegistrationCodeWidget({
    required this.code,
    required this.qr,
    required this.colorSet,
    required this.branchImage,
    Key? key, required this.time, required this.context,
  }) : super(key: key);

  @override
  State<RegistrationCodeWidget> createState() => _RegistrationCodeWidgetState();
}

class _RegistrationCodeWidgetState extends State<RegistrationCodeWidget> {

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
    double width = MediaQuery.of(context).size.width - 20;
    double height = 527;
    return _registrationCard(width, height);
  }

  Widget _registrationCard(double width, double height) => Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: context.colors!.mainSecondaryBack
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImage(profileImage: context.watch<MemberCubit>().state.profileImage, size: 80,),
              SizedBox(height: 10,),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(context.watch<MemberCubit>().state.memberData!.fullName!, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: context.colors!.mainPrimaryText),)),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(context.watch<MemberCubit>().state.memberData!.nickname, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: context.colors!.mainPrimaryText),)),
            ],
          ),
        ),
        Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            color: context.colors?.mainPrimaryBack,
          ),
          padding: EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: KColors.white
            ),
            child: Padding(
                padding: EdgeInsets.only(top: 22, right: 18, left: 22, bottom: 18),
                child: Image.memory(widget.qr, fit: BoxFit.cover,)),
          ),
        ),
      ],
    ),
  );
}