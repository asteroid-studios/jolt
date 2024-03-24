import 'package:jolt/jolt.dart';
export 'dart:ui' show Brightness;

///
@immutable
abstract class BaseTheme {
  /// The unique identifier of the theme
  String get id;

  /// The brightness of the theme ie light/dark
  Brightness get brightness;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is BaseTheme && other.id == id;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      id,
    ];
    return Object.hashAll(values);
  }

  ///
  bool get isLight => brightness == Brightness.light;

  ///
  bool get isDark => brightness == Brightness.dark;
}
