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
class Theme {
  /// Jolt Theme Data
  Theme({
    required this.id,
    required this.colorScheme,
    Typography? typography,
    this.dimensions = const Dimensions(),
  }) : typography = typography ?? Typography();

  /// The id of the theme.
  final String id;

  /// The dimensions of the theme.
  final Dimensions dimensions;

  /// The color scheme.
  final ColorScheme colorScheme;

  /// The typography.
  final Typography typography;

  /// Return the ThemeData from the closest instance of this class that encloses
  static Theme of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<DefaultTheme>();
    // TODO could this be the culprit of flashing white?
    return theme?.data ?? _defaultLightTheme;
  }

  ///
  Theme copyWith({
    ColorScheme? colorScheme,
    String? id,
    Typography? typography,
    Dimensions? dimensions,
  }) {
    return Theme(
      colorScheme: colorScheme ?? this.colorScheme,
      id: id ?? this.id,
      typography: typography ?? this.typography,
      dimensions: dimensions ?? this.dimensions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Theme &&
        other.colorScheme == colorScheme &&
        other.id == id &&
        other.typography == typography &&
        other.dimensions == dimensions;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      colorScheme,
      id,
      typography,
      dimensions,
    ];
    return Object.hashAll(values);
  }
}

// Define a default backup theme
final _defaultLightTheme = Theme(
  id: 'default_light',
  colorScheme: ColorScheme.light(),
);
