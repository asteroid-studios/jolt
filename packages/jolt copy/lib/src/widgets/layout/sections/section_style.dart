import 'package:jolt_copy/jolt.dart';

///
class SectionStyle {
  ///
  SectionStyle({
    this.maxContentWidth = 900,
    this.defaultPadding,
  });

  /// Define the max width of content.
  final double maxContentWidth;

  /// Define a default padding for all sections.
  ///
  /// Defaults to EdgeInsets.symmetric(
  ///   vertical: context.spacing.section,
  ///   horizontal: context.spacing.md,
  /// ).
  final EdgeInsetsGeometry? defaultPadding;
}
