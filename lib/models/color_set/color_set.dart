import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../theme_colors/theme_colors.dart';

part 'color_set.freezed.dart';
part 'color_set.g.dart';

@freezed
class ColorSet with _$ColorSet {
  const ColorSet._();

  const factory ColorSet({
    required ThemeColors light,
    required ThemeColors dark,
  }) = _ColorSet;

  factory ColorSet.fromJson(Map<String, Object?> json) => _$ColorSetFromJson(json);
}

//"colors": {
//       "main_bg": "#FFFFFF",
//       "main_color_1": "#419DEB",
//       "main_text_1": "#FFFFFF",
//       "main_text_2": "#787878",
//       "sub_color_1": "#2A6496",
//       "sub_text_1": "#FFFFFF",
//       "field_value": "#4A4A4A",
//       "field_icon": "#BEBEBE",
//       "field_border": "#E4E4E4",
//       "field_bg": "#FFFFFF"
//     }