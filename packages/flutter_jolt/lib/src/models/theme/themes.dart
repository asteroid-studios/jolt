import 'package:flutter/material.dart';

const defaultJoltColor = Color(0xFF24b47f);

final defaultThemes = [
  ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultJoltColor,
      brightness: Brightness.light,
    ),
  ),
  ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultJoltColor,
      brightness: Brightness.dark,
    ),
  ),
];
