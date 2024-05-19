part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.fetchTheme() = _FetchThemeEvent;
  const factory ThemeEvent.toggleTheme() = _ToggleThemeEvent;
}
