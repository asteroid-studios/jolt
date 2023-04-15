import 'package:flutter/material.dart';
import 'package:flutter_jolt/src/semantic_colors/theme.dart';
export 'package:tinycolor2/tinycolor2.dart';

extension SemanticColorExtension on ThemeData {
  SemanticColorThemeData get semanticColors =>
      extension<SemanticColorThemeData>()!;
}

extension JoltColorExtensions on BuildContext {
  ColorMapping get color => ColorMapping(Theme.of(this));
}

class ColorMapping {
  final ThemeData _themeData;

  late Map<Color, Color> _colorMap;

  ColorMapping(this._themeData) {
    _colorMap = {
      primary: onPrimary,
      primaryContainer: onPrimaryContainer,
      secondary: onSecondary,
      secondaryContainer: onSecondaryContainer,
      tertiary: onTertiary,
      tertiaryContainer: onTertiaryContainer,
      error: onError,
      errorContainer: onErrorContainer,
      success: onSuccess,
      successContainer: onSuccessContainer,
      warning: onWarning,
      warningContainer: onWarningContainer,
      info: onInfo,
      infoContainer: onInfoContainer,
      background: onBackground,
      surface: onSurface,
      surfaceVariant: onSurfaceVariant,
    };
  }

  ColorScheme get _colorScheme => _themeData.colorScheme;
  SemanticColorThemeData get _semanticColors => _themeData.semanticColors;

  Color? foreground(Color? background) {
    if (background == null) return null;
    return _colorMap[background];
  }

  // Primary Colors
  Color get primary => _colorScheme.primary;
  Color get onPrimary => _colorScheme.onPrimary;
  Color get primaryContainer => _colorScheme.primaryContainer;
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;

  // Secondary Colors
  Color get secondary => _colorScheme.secondary;
  Color get onSecondary => _colorScheme.onSecondary;
  Color get secondaryContainer => _colorScheme.secondaryContainer;
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;

  // Tertiary Colors
  Color get tertiary => _colorScheme.tertiary;
  Color get onTertiary => _colorScheme.onTertiary;
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;
  Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;

  // Error Colors
  Color get error => _colorScheme.error;
  Color get onError => _colorScheme.onError;
  Color get errorContainer => _colorScheme.errorContainer;
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  // Background Colors
  Color get background => _colorScheme.background;
  Color get onBackground => _colorScheme.onBackground;

  // Surface Colors
  Color get surface => _colorScheme.surface;
  Color get onSurface => _colorScheme.onSurface;
  Color get surfaceVariant => _colorScheme.surfaceVariant;
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  // Border
  Color get outline => _colorScheme.outline;
  Color get shadow => _colorScheme.shadow;

  // Inverse
  Color get inverseSurface => _colorScheme.inverseSurface;
  Color get onInverseSurface => _colorScheme.onInverseSurface;
  Color get inversePrimary => _colorScheme.inversePrimary;

  // Semantic Colors
  Color get success => _semanticColors.success;
  Color get onSuccess => _semanticColors.onSuccess;
  Color get successContainer => _semanticColors.successContainer;
  Color get onSuccessContainer => _semanticColors.onSuccessContainer;
  Color get info => _semanticColors.info;
  Color get onInfo => _semanticColors.onInfo;
  Color get infoContainer => _semanticColors.infoContainer;
  Color get onInfoContainer => _semanticColors.onInfoContainer;
  Color get warning => _semanticColors.warning;
  Color get onWarning => _semanticColors.onWarning;
  Color get warningContainer => _semanticColors.warningContainer;
  Color get onWarningContainer => _semanticColors.onWarningContainer;
}
