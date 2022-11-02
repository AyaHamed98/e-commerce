import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';

ThemeData getTheme(){
  return ThemeData(
    colorScheme:ColorScheme(
        primary: primaryColor,
        onPrimary: Color(0xff),
        secondary: Color(0xffcdcdcd),
        onSecondary: Color(0xff),
        error: Color(0xffea0000),
        onError: Color(0xff),
        background: Colors.transparent,
        onBackground: Color(0xff),
        surface: Colors.transparent,
        onSurface: Color(0xff),
        brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    )
  );
}

/*
colorScheme = ColorScheme.fromSwatch(
      primarySwatch: primarySwatch, // as above
      primaryColorDark: primaryColorDark, // as above
      accentColor: accentColor, // as above
      cardColor: cardColor, // default based on theme brightness, can be set manually
      backgroundColor: backgroundColor, // as above
      errorColor: errorColor, // default (Colors.red[700]), can be set manually
      brightness: brightness, // default (Brightness.light), can be set manually
    );
 */