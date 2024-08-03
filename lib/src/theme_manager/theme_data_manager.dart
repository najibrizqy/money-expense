import 'package:flutter/material.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primary,
    colorScheme: ColorScheme.light(
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      onSurface: ColorManager.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstant.sourceSansPro,
  );
}
