import 'package:flutter/material.dart';
import 'package:todolist_flutter/constants/palette.dart';
import 'package:todolist_flutter/constants/text_styles.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: LightPalette.backPrimary,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(LightPalette.blue),
    ),
  ),
  cardColor: LightPalette.backSecondary,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: DarkPalette.backPrimary,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
      foregroundColor: WidgetStateProperty.all<Color>(DarkPalette.blue),
    ),
  ),
  cardColor: DarkPalette.backSecondary,
);
