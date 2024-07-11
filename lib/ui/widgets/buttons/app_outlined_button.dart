import 'package:climbers/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool expanded;
  const AppOutlinedButton({Key? key, required this.title, required this.onPressed, this.expanded = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors?.mainPrimaryBack ?? Color(0xFFFFFFFF),)
      ),
      child: Padding(
        padding: EdgeInsets.all(1),
        child: SizedBox(
          height: expanded ? 45 : 45,
          width: expanded ? double.infinity : MediaQuery.of(context).size.width * 0.5,
          child: CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: 5),
              color: KColors.transparent,
              onPressed: onPressed, child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: context.colors!.mainPrimaryBack, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}