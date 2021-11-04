import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp();

  ThemeData get use => ThemeData(
      backgroundColor: const Color(0xffFFFAEE),
      primaryColor: const Color(0xff883B35),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff883B35),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xff883B35),
      ),
      scaffoldBackgroundColor: const Color(0xffFFFAEE),
      textTheme: const TextTheme(
        headline2: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline3: TextStyle(
          fontSize: 12,
          color: Color(0xff883B35),
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
            fontSize: 15,
            color: Color(0xff883B35),
            fontWeight: FontWeight.w500),
        bodyText2: TextStyle(
            fontSize: 15,
            color: Color(0xff883B35),
            fontWeight: FontWeight.w500),
        headline1: TextStyle(
            fontSize: 24,
            color: Color(0xff883B35),
            fontWeight: FontWeight.bold),
        button: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xff883B35)));
}
