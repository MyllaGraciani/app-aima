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

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: backgroundColor,
        side: BorderSide(color: backgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          ),
        ),
      ),
    ),
    // fontes e textos

    fontFamily: 'Lato',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: backgroundColor,
        fontSize: 50,
      ),
      headline2: TextStyle(
        color: primaryColor,
      ),
      headline3: TextStyle(
        color: primaryColor,
      ),
      headline4: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 80,
      ),
      headline5: TextStyle(
        color: primaryColor,
      ),
      subtitle1: TextStyle(
        color: primaryColor,
      ),
      subtitle2: TextStyle(
        color: primaryColor,
      ),
      bodyText1: TextStyle(
        color: primaryColor,
      ),
      bodyText2: TextStyle(
        color: backgroundColor,
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
    ),
  );
}
