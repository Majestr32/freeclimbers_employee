import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';

class AppNavbar extends StatelessWidget implements ObstructingPreferredSizeWidget{
  final String title;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onSuffixWidgetTap;
  final VoidCallback? onPrefixWidgetTap;
  const AppNavbar({Key? key, required this.title, this.suffixWidget, this.prefixWidget, this.onSuffixWidgetTap, this.onPrefixWidgetTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      child: Stack(
        children: [
          Container(width: double.infinity, height: double.infinity, color: context.colors!.mainPrimaryBack),
          Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: (){
                  onPrefixWidgetTap?.call();
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 14, bottom: 3),
                    child: Container(
                      width: 44,
                      height: 44,
                      color: KColors.transparent,
                      child: FittedBox(
                          fit: BoxFit.none,
                          child: Center(child: prefixWidget ?? const SizedBox.shrink())),
                    )),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 44,
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Center(child: Text(title, style: TextStyle(color: context.colors.mainPrimaryText, fontSize: 18, fontWeight: FontWeight.w600),)))),
          Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  onSuffixWidgetTap?.call();
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 14, bottom: 3),
                    child: Container(
                      width: 44,
                      height: 44,
                      color: KColors.transparent,
                      child: FittedBox(
                          fit: BoxFit.none,
                          child: suffixWidget ?? const SizedBox.shrink()),
                    )),
              )),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
