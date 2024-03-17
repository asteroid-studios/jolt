///
class JoltColorShades {
  /// Defines the HSL lightness values for converting a color into each shade
  ///
  /// Values are inspired by Tailwind colors
  const JoltColorShades({
    this.shade50 = 0.98,
    this.shade100 = 0.93,
    this.shade200 = 0.85,
    this.shade300 = 0.8,
    this.shade400 = 0.65,
    this.shade500 = 0.55,
    this.shade600 = 0.38,
    this.shade700 = 0.3,
    this.shade800 = 0.2,
    this.shade900 = 0.12,
    this.shade950 = 0.05,
  });

  /// More even shade lightness values, useful for black and white.
  factory JoltColorShades.wide() => const JoltColorShades(
        shade50: 1,
        shade100: 0.9,
        shade200: 0.8,
        shade300: 0.7,
        shade400: 0.6,
        shade500: 0.5,
        shade600: 0.35,
        shade700: 0.25,
        shade800: 0.15,
        shade900: 0.08,
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
  final double shade600;

  ///
  final double shade700;

  ///
  final double shade800;

  ///
  final double shade900;

  ///
  final double shade950;
}
