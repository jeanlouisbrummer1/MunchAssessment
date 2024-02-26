import 'package:flutter/material.dart';
import 'constants.dart';
import 'variables.dart';

ThemeData munchTheme = ThemeData(
  primaryColor: backgroundColour,
  scaffoldBackgroundColor: backgroundColour,
  appBarTheme: const AppBarTheme(
    color: backgroundColour,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: whiteColour,
    ),
    titleTextStyle: TextStyle(
      color: whiteColour,
      fontFamily: fontFamily,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: buttonColour,
    textTheme: ButtonTextTheme.primary,
  ),
);
