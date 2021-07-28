import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(
      primaryColor: isDarkTheme ? Colors.black : Colors.blue,
      scaffoldBackgroundColor: isDarkTheme ? Color(0xff222222) : Colors.white,
    );
  }
}