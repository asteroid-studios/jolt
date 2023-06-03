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

// Define a default backup theme
final _defaultLightTheme = ThemeData(
  id: 'default_light',
  colorScheme: ColorScheme.light(),
);

/// Wrap a section of the widget tree with a theme which will be inherited by
/// all children.
class Theme extends InheritedTheme {
  /// Wrap a section of the widget tree with a theme which will be inherited by
  /// all children.
  const Theme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The theme data to use for this section of the widget tree.
  final ThemeData data;

  /// Return the ThemeData from the closest instance of this class that encloses
  static ThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<Theme>();
    return theme?.data ?? _defaultLightTheme;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return Theme(data: data, child: child);
  }
}

/// Jolt Theme Data
@immutable
class ThemeData {
  /// Jolt Theme Data
  ThemeData({
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

  ///
  ThemeData copyWith({
    ColorScheme? colorScheme,
    String? id,
    Typography? typography,
    Dimensions? dimensions,
  }) {
    return ThemeData(
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
    return other is ThemeData &&
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
