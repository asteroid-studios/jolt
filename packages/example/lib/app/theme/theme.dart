import 'package:example/app/theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';
import 'package:google_fonts/google_fonts.dart';

const _seedColor = Color(0xFF24b47f);

const _scaffoldColorLight = Color(0xFFFFFFFF);
const _surfaceColorLight = Color(0xFFEEEEEE);
const _scaffoldColorDark = Color(0xFF111111);
const _surfaceColorDark = Color(0xFF000000);

// Only used to pass dark and light to Google text theme
final _baseLightTheme = ThemeData(brightness: Brightness.light);
final _baseDarkTheme = ThemeData(brightness: Brightness.dark);

final themes = [
  ThemeData(
    useMaterial3: true,
    // TODO: make sure that when you have settled on a font, to include the font assets in the assets folder
    textTheme: GoogleFonts.rubikTextTheme(_baseLightTheme.textTheme),
    scaffoldBackgroundColor: _scaffoldColorLight,
    colorScheme: ColorScheme.fromSeed(
      surface: _surfaceColorLight,
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    outlinedButtonTheme: buttonTheme(),
  ),
  // ThemeData(
  //   useMaterial3: true,
  //   // TODO: make sure that when you have settled on a font, to include the font assets in the assets folder
  //   textTheme: GoogleFonts.rubikTextTheme(_baseDarkTheme.textTheme),
  //   scaffoldBackgroundColor: _scaffoldColorDark,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: _seedColor,
  //     brightness: Brightness.dark,
  //     background: _scaffoldColorDark,
  //     surface: _surfaceColorDark,
  //   ),
  //   elevatedButtonTheme: buttonTheme(),
  // ),
];
