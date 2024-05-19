import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawerTab extends StatelessWidget {
  final IconData drawerIcon;
  final String title;
  final int number;
  final VoidCallback onPressed;
  const AppDrawerTab({Key? key, required this.drawerIcon, required this.title, required this.onPressed, this.number = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        color: KColors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 48,
                  child: Center(child: Icon(drawerIcon, color: context.colors!.mainPrimaryBack, size: 20,))),
              SizedBox(width: 6,),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: context.readColors!.basePrimaryText),),
              Spacer(),
              number <= 0 ? SizedBox.shrink() : Container(
                width: 30,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.colors!.mainPrimaryBack,
                ),
                child: Center(child: Text(number.toString(), style: TextStyle(fontSize: 10, color: context.colors!.mainPrimaryText, fontWeight: FontWeight.w700),)),
              ),
              SizedBox(width: 8,)
          ],),
        ),
      ),
    );
  }
}
