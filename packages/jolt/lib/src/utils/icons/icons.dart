import 'package:jolt/jolt.dart';

export 'package:phosphor_flutter/phosphor_flutter.dart';

///
abstract class Icons {
  /// Bold Icons
  static final bold = PhosphorIcons.bold;

  /// Duotone Icons
  static final duotone = PhosphorIcons.duotone;

  /// Fill Icons
  static final fill = PhosphorIcons.fill;

  /// Light Icons
  static final light = PhosphorIcons.light;

  /// Regular Icons
  static final regular = PhosphorIcons.regular;

  /// Thin Icons
  static final thin = PhosphorIcons.thin;
}

/// Extension methods for [IconData].
extension IconDataExtension on IconData {
  /// Returns an [Icon] widget for the given [IconData].
  Icon icon({
    double? size,
    Color? color,
  }) =>
      Icon(
        this,
        size: size,
        color: color,
      );
}

/// Extension methods for [IconData].
extension PhosphorIconDataExtension on PhosphorIconData {
  /// Returns an [Icon] widget for the given [IconData].
  PhosphorIcon icon({
    double? size,
    Color? color,
    Color? secondaryColor,
    double duotoneSecondaryOpacity = 0.2,
  }) =>
      PhosphorIcon(
        this,
        size: size,
        color: color,
        duotoneSecondaryColor: secondaryColor,
        duotoneSecondaryOpacity: duotoneSecondaryOpacity,
      );
}
