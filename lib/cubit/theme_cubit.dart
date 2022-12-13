import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  bool theme = true;

  void onThemeChange() {
    theme = !theme;
    emit(theme ? ThemeMode.light : ThemeMode.dark);
  }
}
