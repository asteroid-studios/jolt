import 'package:flutter/foundation.dart';

import 'package:jolt/jolt.dart';

/// Describes which color scheme will be used by **JoltApp**.
enum ThemeMode {
  /// Use a light color scheme.
  light,

  /// Use a dark color scheme.
  dark,

  /// Use a color scheme that matches the system.
  system,
}

/// Jolt Theme Data
@immutable
class ThemeData {
  /// Jolt Theme Data
  const ThemeData({
    required this.id,
    required this.colorScheme,
    this.typography = const Typography(),
  });

  /// The id of the theme.
  final String id;

  /// The color scheme.
  final ColorScheme colorScheme;

  /// The typography.
  final Typography typography;

  ///
  ThemeData copyWith({
    ColorScheme? colorScheme,
    String? id,
    Typography? typography,
  }) {
    return ThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      id: id ?? this.id,
      typography: typography ?? this.typography,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ThemeData &&
        other.colorScheme == colorScheme &&
        other.id == id &&
        other.typography == typography;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      colorScheme,
      id,
      typography,
    ];
    return Object.hashAll(values);
  }
}
