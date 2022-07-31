import 'package:flutter/material.dart';

import '../models/color/semantic_color.dart';

extension SemanticColorExtension on ThemeData {
  SemanticColors get semanticColors => extension<SemanticColors>()!;

  Color get success => semanticColors.success;
  Color get onSuccess => semanticColors.onSuccess;
  Color get successContainer => semanticColors.successContainer;
  Color get onSuccessContainer => semanticColors.onSuccessContainer;
  Color get info => semanticColors.info;
  Color get onInfo => semanticColors.onInfo;
  Color get infoContainer => semanticColors.infoContainer;
  Color get onInfoContainer => semanticColors.onInfoContainer;
  Color get warning => semanticColors.warning;
  Color get onWarning => semanticColors.onWarning;
  Color get warningContainer => semanticColors.warningContainer;
  Color get onWarningContainer => semanticColors.onWarningContainer;
}

class ColorMapping {
  final ThemeData themeData;

  ColorMapping(this.themeData);

  ColorScheme get colorScheme => themeData.colorScheme;

  // Primary Colors
  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  // Secondary Colors
  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  // Tertiary Colors
  Color get tertiary => colorScheme.tertiary;
  Color get onTertiary => colorScheme.onTertiary;
  Color get tertiaryContainer => colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  // Error Colors
  Color get error => colorScheme.error;
  Color get onError => colorScheme.onError;
  Color get errorContainer => colorScheme.errorContainer;
  Color get onErrorContainer => colorScheme.onErrorContainer;

  // Background Colors
  Color get background => colorScheme.background;
  Color get onBackground => colorScheme.onBackground;

  // Surface Colors
  Color get surface => colorScheme.surface;
  Color get onSurface => colorScheme.onSurface;
  Color get surfaceVariant => colorScheme.surfaceVariant;
  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;

  // Border
  Color get outline => colorScheme.outline;
  Color get shadow => colorScheme.shadow;

  // Inverse
  Color get inverseSurface => colorScheme.inverseSurface;
  Color get onInverseSurface => colorScheme.onInverseSurface;
  Color get inversePrimary => colorScheme.inversePrimary;

  // Semantic Colors
  Color get success => themeData.success;
  Color get onSuccess => themeData.onSuccess;
  Color get successContainer => themeData.successContainer;
  Color get onSuccessContainer => themeData.onSuccessContainer;
  Color get info => themeData.info;
  Color get onInfo => themeData.onInfo;
  Color get infoContainer => themeData.infoContainer;
  Color get onInfoContainer => themeData.onInfoContainer;
  Color get warning => themeData.warning;
  Color get onWarning => themeData.onWarning;
  Color get warningContainer => themeData.warningContainer;
  Color get onWarningContainer => themeData.onWarningContainer;
}
