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
  // iconButtonTheme: IconButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor: WidgetStateProperty.all<Color>(LightPalette.blue),
  //   ),
  // ),
  // primaryColor: LightPalette.backPrimary,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(LightPalette.blue),
    ),
  ),
  cardColor: LightPalette.backSecondary,
  dividerColor: LightPalette.suportSeparator,
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
  // iconButtonTheme: IconButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor: WidgetStateProperty.all<Color>(DarkPalette.blue),
  //   ),
  // ),
  brightness: Brightness.dark,
  // primaryColor: DarkPalette.backPrimary,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(DarkPalette.blue),
    ),
  ),
  cardColor: DarkPalette.backSecondary,
  dividerColor: DarkPalette.suportSeparator,
);
