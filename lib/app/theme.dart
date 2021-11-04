import 'package:flutter/material.dart';

final ThemeData basicTheme = _buildBasicTheme();

const colorPrimary = Color(0xFF282828);
const colorSecondory = Color(0xFF8193CE);

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline4.copyWith(
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-Regular",
      color: colorPrimary,
    ),
  );
}

ThemeData _buildBasicTheme() {
  const Color primaryColor = Colors.orange;
  const Color secondaryColor = Colors.lightGreen;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
//    brightness: Brightness.light,
//    accentColorBrightness: Brightness.light,
    primaryColor: primaryColor,
    //primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: primaryColor,
    accentColor: secondaryColor,
    //canvasColor: const Color(0xFF202124),
    //scaffoldBackgroundColor: const Color(0xFF202124),
    //backgroundColor: const Color(0xFF202124),
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
