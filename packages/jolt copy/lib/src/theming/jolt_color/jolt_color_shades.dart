import 'package:jolt_copy/jolt.dart';

///
class JoltColorShades {
  /// Defines the HSL lightness values for a [JoltColor]
  ///
  /// Used when converting a normal [Color] into a [JoltColor]
  const JoltColorShades({
    this.shade50 = 0.98,
    this.shade100 = 0.95,
    this.shade200 = 0.93,
    this.shade300 = 0.85,
    this.shade400 = 0.78,
    this.shade500 = 0.66,
    this.shade600 = 0.6,
    this.shade700 = 0.4,
    this.shade800 = 0.32,
    this.shade900 = 0.25,
    this.shade950 = 0.2,
  });

  /// More even shade lightness values, useful for black and white.
  factory JoltColorShades.wide() => const JoltColorShades(
        shade50: 1,
        shade100: 0.9,
        shade200: 0.8,
        shade300: 0.7,
        shade400: 0.6,
        shade500: 0.5,
        shade600: 0.4,
        shade700: 0.3,
        shade800: 0.2,
        shade900: 0.1,
        shade950: 0,
      );

  ///
  final double shade50;

  ///
  final double shade100;

  ///
  final double shade200;

  ///
  final double shade300;

  ///
  final double shade400;

  ///
  final double shade500;

  ///
  ///
  final double shade600;

  ///
  final double shade700;

  ///
  final double shade800;

  ///
  final double shade900;

  ///
  final double shade950;

  /// Returns the lightness values as a list
  List<double> get values => [
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ];

  /// Returns the closest lightness value to the targetLightness
  double closestLightnessToTarget(double targetLightness) {
    var closestDouble = values.first;
    var minDifference = (values.first - targetLightness).abs();
    for (final currentDouble in values) {
      final difference = (currentDouble - targetLightness).abs();
      if (difference < minDifference) {
        minDifference = difference;
        closestDouble = currentDouble;
      }
    }
    return closestDouble;
  }
}
