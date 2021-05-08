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

    //appbar
    appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor.withOpacity(0), elevation: 0),

    //buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5)),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      ),
    ),

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
