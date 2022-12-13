// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  bool _theme = true;

  // Toggles the current theme
  void changeTheme() {
    _theme = !_theme;
    emit(_theme ? ThemeMode.light : ThemeMode.dark);
  }

  // Sets the theme to the given value
  void setTheme(bool newTheme) {
    _theme = newTheme;
    emit(_theme ? ThemeMode.light : ThemeMode.dark);
  }

  // Gets the current theme value
  bool getTheme() {
    return _theme;
  }
}