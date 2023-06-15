import 'package:ui/ui.dart';
export 'package:jolt/jolt.dart';

/// My custom text styles.
extension CustomTypography on Typography {
  /// Text style for button
  TextStyle get button => body.copyWith(
      // fontWeight: FontWeight.w400,
      );
}

extension CustomColors on ColorScheme {
  double get _opacity => isDark ? 0.3 : 0.2;
  JoltColor get primaryButton => primary.withOpacity(_opacity);
  JoltColor get secondaryButton => secondary.withOpacity(_opacity);
}
