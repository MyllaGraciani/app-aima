import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF332b29);
const lightColor = const Color(0xFFe54545);
const backgroundColor = const Color(0xFFeaeaea);

ThemeData lightTheme() {
  return ThemeData(
    // cores
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: lightColor,
    backgroundColor: backgroundColor,

    //forms

    // fontes e textos
    fontFamily: 'Lato',
    textTheme: TextTheme(
      headline4: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 80,
      ),
      headline3: TextStyle(
        color: primaryColor,
      ),
    ),
  );
}
