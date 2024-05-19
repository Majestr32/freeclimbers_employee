import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/theme_bloc/theme_bloc.dart';
import 'package:freeclimbers_employee/consts/no_internet_theme_colors.dart';
import 'package:freeclimbers_employee/models/color_set/color_set.dart';
import 'package:freeclimbers_employee/models/theme_colors/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ColorsBuildContextExtension on BuildContext{
  ThemeColors get colors => MediaQuery.of(this).platformBrightness != null && watch<ThemeBloc>().state.brightness == Brightness.dark ? (watch<AppCubit>().state.settings?.colors.dark ?? noInternetThemeColorsBlack) : (watch<AppCubit>().state.settings?.colors.light ?? noInternetThemeColorsWhite);
  ThemeColors get readColors => read<ThemeBloc>().state.brightness == Brightness.dark ? (read<AppCubit>().state.settings?.colors.dark ?? noInternetThemeColorsBlack) : (read<AppCubit>().state.settings?.colors.light ?? noInternetThemeColorsWhite);
}