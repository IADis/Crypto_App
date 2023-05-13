import 'package:crypto_app/ui/theme/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(themeData: appThemeData[AppTheme.Light]!),
        ) {
    on<ThemeEvent>((event, emit) async {
      if (event is ThemeChanged) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isDark', event.theme == AppTheme.Dark);
        emit.call(
          ThemeState(themeData: appThemeData[event.theme]!),
        );
      }
    });
    on<InitialTheme>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDark') ?? false;
      if (isDark) {
        emit.call(
          ThemeState(themeData: appThemeData[AppTheme.Dark]!),
        );
      } else {
        emit.call(
          ThemeState(themeData: appThemeData[AppTheme.Light]!),
        );
      }
    });
  }
}
