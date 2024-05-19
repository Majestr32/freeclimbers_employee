import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool expanded;
  final bool inverseColors;
  const AppElevatedButton({Key? key, required this.title, required this.onPressed, this.expanded = true, this.inverseColors = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: expanded ? double.infinity : 190,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: inverseColors ? context.colors!.mainPrimaryText : context.colors!.mainPrimaryBack,
          shadowColor: KColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
          onPressed: onPressed, child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title, style: TextStyle(color: inverseColors ? context.colors!.mainPrimaryBack : context.colors!.mainPrimaryText, fontSize: 16, fontWeight: FontWeight.bold),))),
    );
  }
}
