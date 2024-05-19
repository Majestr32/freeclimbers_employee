import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_colors.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final bool isTitleWhite;
  final VoidCallback onPressed;
  const AppTextButton({Key? key, required this.title, required this.onPressed, this.isTitleWhite = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 16,
        padding: EdgeInsets.zero,
        child: Text(title, style: TextStyle(
          fontSize: 16,
        fontFamily: 'OpenSans',
        color: isTitleWhite ? context.colors!.mainPrimaryText : context.colors?.fieldNormalText,
        fontWeight: FontWeight.w600,
        decorationThickness: 0.5,
        decoration: TextDecoration.underline
    ),), onPressed: onPressed);
  }
}
