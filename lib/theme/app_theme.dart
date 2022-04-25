import 'package:flutter/material.dart';

class Themes {
  static ThemeData mainTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway'),
          headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway'),
        ),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF2E4558),
            onPrimary: Color(0xFFE89E10),
            secondary: Color(0xFF749BFF),
            onSecondary: Color(0xFFC4C4C4),
            error: Color(0xFFFF1F00),
            onError: Color(0xFFFF1F00),
            background: Color(0xFF000000),
            onBackground: Color(0xFFFFFFFF),
            surface: Color(0xFF9F0613),
            onSurface: Color(0xFF2E4558)));
  }
}
