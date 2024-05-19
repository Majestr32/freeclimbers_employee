import 'dart:ui';

extension InverseBrightnessExtension on Brightness{
  Brightness get inverse => this == Brightness.dark ? Brightness.light : Brightness.dark;
}