import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'choose_theme_state.freezed.dart';

@freezed
class ChooseThemeState with _$ChooseThemeState {
  const factory ChooseThemeState({
    bool? isLoading,
    required Map<String, ThemeData> listTheme,
    required String currentTheme,
    required String error,
  }) = _ChooseThemeState;
  factory ChooseThemeState.initial() => ChooseThemeState(
      isLoading: false,
      error: "",
      currentTheme: "Light",
      listTheme: {"Light": ThemeData.light(), "Dark": ThemeData.dark()});
}
