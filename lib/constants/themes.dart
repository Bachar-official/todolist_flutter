import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/constants/text_styles.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: LightPalette.backPrimary,
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightPalette.backPrimary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: LightPalette.blue,
    foregroundColor: LightPalette.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(LightPalette.blue),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) {
        return LightPalette.green;
      }
      return null;
    }),
  ),
  cardColor: LightPalette.backSecondary,
  dividerColor: LightPalette.suportSeparator,
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((state) {
      if (state.contains(WidgetState.selected)) {
        return LightPalette.blue;
      }
      return LightPalette.backElevated;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((state) {
      if (state.contains(WidgetState.selected)) {
        return LightPalette.darkBlue;
      }
      return null;
    }),
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: LightPalette.blue,
    surfaceTintColor: LightPalette.blue,
    todayForegroundColor: WidgetStatePropertyAll(LightPalette.blue),
    rangeSelectionBackgroundColor: LightPalette.blue,
    rangeSelectionOverlayColor: WidgetStatePropertyAll(LightPalette.blue),
    rangePickerBackgroundColor: LightPalette.blue,
    dayOverlayColor: WidgetStatePropertyAll(LightPalette.blue),
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: DarkPalette.backPrimary,
  ),
  scaffoldBackgroundColor: DarkPalette.backPrimary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: DarkPalette.blue,
    foregroundColor: DarkPalette.white,
  ),
  brightness: Brightness.dark,
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) {
        return DarkPalette.green;
      }
      return null;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(DarkPalette.blue),
    ),
  ),
  cardColor: DarkPalette.backSecondary,
  dividerColor: DarkPalette.suportSeparator,
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((state) {
      if (state.contains(WidgetState.selected)) {
        return DarkPalette.blue;
      }
      return DarkPalette.backElevated;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((state) {
      if (state.contains(WidgetState.selected)) {
        return DarkPalette.darkBlue;
      }
      return null;
    }),
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: DarkPalette.blue,
    surfaceTintColor: DarkPalette.blue,
    todayForegroundColor: WidgetStatePropertyAll(DarkPalette.blue),
    rangeSelectionBackgroundColor: DarkPalette.blue,
    rangeSelectionOverlayColor: WidgetStatePropertyAll(DarkPalette.blue),
    rangePickerBackgroundColor: DarkPalette.blue,
    dayOverlayColor: WidgetStatePropertyAll(DarkPalette.blue),
  ),
);
