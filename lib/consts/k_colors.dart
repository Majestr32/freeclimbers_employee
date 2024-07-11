import 'package:climbers/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KColors{
  static Color black02 = const Color(0xFF000000).withOpacity(0.2);
  static Color black = const Color(0xFF000000);
  static Color red = const Color(0xFFB94A48);
  static Color green = const Color(0xFF00AA00);
  static Color blue = const Color(0xFF3A87AD);
  static Color white = const Color(0xFFFFFFFF);
  static Color link = const Color(0xFF4C99EB);
  static Color red02 = const Color(0xFFFF0000).withOpacity(0.2);
  static Color fieldBorderError = const Color(0xFFFF0000);
  static Color toastBg = const Color(0xFFb94a48).withOpacity(0.2);
  static Color mainText = const Color(0xFF4A4A4A);
  static Color systemMsgBg(BuildContext context) => context.watch<ThemeBloc>().state.brightness == Brightness.light ? const Color(0xFFF7F7F7) : const Color(0xFF131314);
  static Color systemMsgText(BuildContext context) => context.watch<ThemeBloc>().state.brightness == Brightness.dark ? const Color(0xFFF7F7F7) : const Color(0xFF131314);
  static Color systemMsgSpacer(BuildContext context) => context.watch<ThemeBloc>().state.brightness == Brightness.light ? const Color(0xFF888888) : Color.alphaBlend(KColors.white.withOpacity(0.2), const Color(0xFF131314));
  static Color transparent = const Color(0x00);
}