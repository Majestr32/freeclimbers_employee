import 'package:climbers/models/color_set/color_set.dart';
import 'package:climbers/models/required_fields/required_fields.dart';
import 'package:climbers/models/theme_colors/theme_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required String name1,
    @JsonKey(name: 'register_text') String? registerText,
    required RequiredFields required,
    required ColorSet colors,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, Object?> json) => _$AppSettingsFromJson(json);
}