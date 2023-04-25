import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static SharedPreferences? preferences;
  static const String key = "pref_key";

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  final _key = "isDarkMode";

  bool _loadThemeFromBox() => preferences?.getBool(_key) ?? false;

  bool get isDarkMode => _loadThemeFromBox() ? true : false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  _saveThemBox(bool isDarkMode) => preferences!.setBool(_key, isDarkMode);
  _changeStatus(bool status) => isDarkMode == status;
  void switchTheme(String theme) {
    // AppThemes
    //     .appThemeData[_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark];

    if (theme == "Light") {
      _changeStatus(false);
      _saveThemBox(false);
    } else {
      _changeStatus(true);
      _saveThemBox(true);
    }
    print("theme is dark mode +" + this.isDarkMode.toString());
  }
}
