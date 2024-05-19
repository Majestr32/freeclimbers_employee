part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();

  Brightness get brightness => maybeMap(
      initialized: (state) => !state.isNightTheme && SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light ? Brightness.light : Brightness.dark,
      orElse: () => Brightness.dark);

  bool get isNightTheme => maybeMap(
      initialized: (state) => state.isNightTheme,
      orElse: () => false);

  const factory ThemeState.initial() = _InitialState;
  const factory ThemeState.initialized({required bool isNightTheme}) = _InitializedState;
}
