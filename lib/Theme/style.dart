import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shifftie/Theme/colors.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: mainColor,

  ///appBar theme
  appBarTheme: AppBarTheme(
    color: transparentColor,
    elevation: 0.0,
  ),

  ///text theme
  textTheme: GoogleFonts.openSansTextTheme().copyWith(
    subtitle1:
        TextStyle(color: disabledTextColor, wordSpacing: 2, letterSpacing: 2),
    caption: TextStyle(color: disabledTextColor),
    bodyText1: const TextStyle(fontSize: 16.0),
    headline6: TextStyle(fontSize: 18.0, color: lightTextColor),
    headline3: TextStyle(fontSize: 24.0, color: lightTextColor),
    button: const TextStyle(fontSize: 16.0, letterSpacing: 1),
    subtitle2: TextStyle(color: captionTextColor),
    bodyText2: TextStyle(color: lightTextColor, fontSize: 18),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mainColor),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
