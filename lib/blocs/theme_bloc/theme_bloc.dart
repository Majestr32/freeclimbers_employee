import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/theme_repository/theme_repository.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeBloc({required ThemeRepository themeRepository}) :
        _themeRepository = themeRepository,
        super(const ThemeState.initial()) {
    on<ThemeEvent>(_mapThemeToState);
    add(ThemeEvent.fetchTheme());
  }

  Future<void> _mapThemeToState(ThemeEvent event, Emitter<ThemeState> emit) => event.map(
      fetchTheme: (e) => _fetchTheme(e,emit),
      toggleTheme: (e) => _toggleTheme(e,emit));

  Future<void> _fetchTheme(_FetchThemeEvent event, Emitter<ThemeState> emit) async{
    final isDarkTheme = _themeRepository.getNightMode();
    emit(ThemeState.initialized(isNightTheme: isDarkTheme));
  }

  Future<void> _toggleTheme(_ToggleThemeEvent event, Emitter<ThemeState> emit) async{
    final toggledTheme = !state.isNightTheme;
    await _themeRepository.setNightMode(toggledTheme);
    emit(ThemeState.initialized(isNightTheme: toggledTheme));
  }

}
