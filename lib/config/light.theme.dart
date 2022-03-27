import 'package:flutter/material.dart';

import 'app.color.dart';

ThemeData lightTheme() {
  return ThemeData(
    // cores
    colorScheme: ColorScheme.light(
      brightness: AppColors.brightness,
      primary: AppColors.primaryColor,
      secondary: AppColors.lightColor,
      background: AppColors.backgroundColor,
    ),

    backgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,

    //appbar
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor.withOpacity(0),
        elevation: 0),

    //buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5)),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.primaryColor,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.backgroundColor,
        side: BorderSide(color: AppColors.backgroundColor),
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
        color: AppColors.backgroundColor,
        fontSize: 50,
      ),
      headline2: TextStyle(
        color: AppColors.primaryColor,
      ),
      headline3: TextStyle(
        color: AppColors.primaryColor,
      ),
      headline4: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 80,
      ),
      headline5: TextStyle(
        color: AppColors.primaryColor,
      ),
      headline6: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 35,
      ),
      subtitle1: TextStyle(
        color: AppColors.primaryColor,
      ),
      subtitle2: TextStyle(
        color: AppColors.primaryColor,
      ),
      bodyText1: TextStyle(
        color: AppColors.primaryColor,
      ),
      bodyText2: TextStyle(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
    ),
  );
}
