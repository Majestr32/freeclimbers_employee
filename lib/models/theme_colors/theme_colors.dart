import 'dart:developer';

import 'package:climbers/consts/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_colors.freezed.dart';
part 'theme_colors.g.dart';

@freezed
class ThemeColors with _$ThemeColors {
  const factory ThemeColors({
    @JsonKey(fromJson: _toBrightness, toJson: _fromBrightness, name: 'status_bar_text') required Brightness statusBarText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_primary_back') required Color basePrimaryBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_primary_text') required Color basePrimaryText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_primary_subtext') required Color basePrimarySubtext,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_secondary_back') required Color baseSecondaryBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_secondary_text') required Color baseSecondaryText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'base_secondary_subtext') required Color baseSecondarySubtext,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'link') required Color link,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'info') required Color info,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'info_back') required Color infoBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'info_text') required Color infoText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'success') required Color success,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'success_back') required Color successBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'success_text') required Color successText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'warning') required Color warning,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'warning_back') required Color warningBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'warning_text') required Color warningText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'error') required Color error,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'error_back') required Color errorBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'error_text') required Color errorText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'main_primary_back') required Color mainPrimaryBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'main_primary_text') required Color mainPrimaryText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'main_secondary_back') required Color mainSecondaryBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'main_secondary_text') required Color mainSecondaryText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_normal_back') required Color fieldNormalBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_normal_text') required Color fieldNormalText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_normal_placeholder') required Color fieldNormalPlaceholder,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_normal_frame') required Color fieldNormalFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_active_back') required Color fieldActiveBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_active_text') required Color fieldActiveText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_active_frame') required Color fieldActiveFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_error_back') required Color fieldErrorBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_error_text') required Color fieldErrorText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_error_frame') required Color fieldErrorFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_success_back') required Color fieldSuccessBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_success_text') required Color fieldSuccessText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'field_success_frame') required Color fieldSuccessFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_normal_back') required Color buttonPrimaryNormalBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_normal_text') required Color buttonPrimaryNormalText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_normal_frame') required Color buttonPrimaryNormalFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_hover_back') required Color buttonPrimaryHoverBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_hover_frame') required Color buttonPrimaryHoverFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_active_back') required Color buttonPrimaryActiveBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_active_text') required Color buttonPrimaryActiveText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_primary_active_frame') required Color buttonPrimaryActiveFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_normal_text') required Color buttonSecondaryNormalText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_normal_back') required Color buttonSecondaryNormalBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_normal_frame') required Color buttonSecondaryNormalFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_hover_back') required Color buttonSecondaryHoverBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_hover_text') required Color buttonSecondaryHoverText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_hover_frame') required Color buttonSecondaryHoverFrame,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_active_back') required Color buttonSecondaryActiveBack,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_active_text') required Color buttonSecondaryActiveText,
    @JsonKey(fromJson: _fromHexOrRgba, toJson: _toHex, name: 'button_secondary_active_frame') required Color buttonSecondaryActiveFrame
  }) = _ThemeColors;

  factory ThemeColors.fromJson(Map<String, Object?> json)
      => _$ThemeColorsFromJson(json);
}

Brightness _toBrightness(String colorStr){
  if(colorStr == "light"){
    return Brightness.light;
  }else{
    return Brightness.dark;
  }
}

String _fromBrightness(Brightness brightness){
  if(brightness == Brightness.light){
    return "light";
  }else{
    return "dark";
  }
}

Color _fromHexOrRgba(String colorStr){
  final Color color;
  if(colorStr.startsWith("#")){
    color = Color(int.parse(colorStr.replaceFirst("#", "0xFF")));
  }else{
    final rgboContent = colorStr.replaceFirst("rgba(", "").replaceFirst(")", "");
    final rgbo = rgboContent.split(",");
    final Color blackPerspectiveColor;
    if(rgbo.length == 3){
      blackPerspectiveColor = Color.fromRGBO(int.parse(rgbo.elementAt(0)), int.parse(rgbo.elementAt(1)), int.parse(rgbo.elementAt(2)), 1);
    }else{
      blackPerspectiveColor = Color.fromRGBO(int.parse(rgbo.elementAt(0)), int.parse(rgbo.elementAt(1)), int.parse(rgbo.elementAt(2)), double.parse(rgbo.elementAt(3)));
    }
    color = Color.alphaBlend(blackPerspectiveColor, Colors.white);
  }
  if(colorStr == "rgba(70,135,255,0.2)"){
    log(color.toString());
  }
  return color;
}

String _toHex(Color color){
  return color.toString();
}

