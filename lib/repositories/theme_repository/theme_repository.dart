import 'dart:ui';

import 'package:climbers/data/shared_prefs/app_shared_prefs_contract.dart';
import 'package:flutter/scheduler.dart';

class ThemeRepository{
  final IAppSharedPrefs _appSharedPrefs;

  Future<void> setNightMode(bool isDarkMode){
    return _appSharedPrefs.setNightMode(isDarkMode);
  }

  bool getNightMode(){
    final savedNightMode = _appSharedPrefs.getNightMode();
    return savedNightMode ?? false;
  }

  const ThemeRepository({
    required IAppSharedPrefs appSharedPrefs,
  }) : _appSharedPrefs = appSharedPrefs;
}