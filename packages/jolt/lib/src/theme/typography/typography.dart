import 'package:flutter/widgets.dart';

/// The typography for the theme.
@immutable
class Typography {
  /// Initialise the typography for the theme.
  const Typography({
    this.defaultColor,
    this.displayLarge = const TextStyle(fontSize: 60),
    this.display = const TextStyle(fontSize: 48),
    this.displaySmall = const TextStyle(fontSize: 36),
    this.headingLarge = const TextStyle(fontSize: 28),
    this.heading = const TextStyle(fontSize: 24),
    this.headingSmall = const TextStyle(fontSize: 20),
    this.bodyLarge = const TextStyle(fontSize: 18),
    this.body = const TextStyle(fontSize: 16),
    this.bodySmall = const TextStyle(fontSize: 14),
    this.label = const TextStyle(fontSize: 12),
    this.labelSmall = const TextStyle(fontSize: 10),
  });

  /// The default color for text.
  final Color? defaultColor;

  /// Used for large display text. (Eg: hero section)
  final TextStyle displayLarge;

  /// Used for display text. (Eg: hero section)
  final TextStyle display;

  /// Used for small display text. (Eg: hero section)
  final TextStyle displaySmall;

  /// Used for large heading text.)
  final TextStyle headingLarge;

  /// Used for heading text.
  final TextStyle heading;

  /// Used for small heading text.
  final TextStyle headingSmall;

  /// Used for large body text.
  final TextStyle bodyLarge;

  /// Used for body text.
  final TextStyle body;

  /// Used for small body text.
  final TextStyle bodySmall;

  /// Used for label text.
  final TextStyle label;

  /// Used for small label text.
  final TextStyle labelSmall;

  /// Return a copy of Typography with the given parameters replaced
  Typography copyWith({
    Color? defaultColor,
    TextStyle? displayLarge,
    TextStyle? display,
    TextStyle? displaySmall,
    TextStyle? headingLarge,
    TextStyle? heading,
    TextStyle? headingSmall,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? bodySmall,
    TextStyle? label,
    TextStyle? labelSmall,
  }) {
    return Typography(
      defaultColor: defaultColor ?? this.defaultColor,
      displayLarge: displayLarge ?? this.displayLarge,
      display: display ?? this.display,
      displaySmall: displaySmall ?? this.displaySmall,
      headingLarge: headingLarge ?? this.headingLarge,
      heading: heading ?? this.heading,
      headingSmall: headingSmall ?? this.headingSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      body: body ?? this.body,
      bodySmall: bodySmall ?? this.bodySmall,
      label: label ?? this.label,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Typography &&
        other.defaultColor == defaultColor &&
        other.displayLarge == displayLarge &&
        other.display == display &&
        other.displaySmall == displaySmall &&
        other.headingLarge == headingLarge &&
        other.heading == heading &&
        other.headingSmall == headingSmall &&
        other.bodyLarge == bodyLarge &&
        other.body == body &&
        other.bodySmall == bodySmall &&
        other.label == label &&
        other.labelSmall == labelSmall;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      defaultColor,
      displayLarge,
      display,
      displaySmall,
      headingLarge,
      heading,
      headingSmall,
      bodyLarge,
      body,
      bodySmall,
      label,
      labelSmall,
    ];
    return Object.hashAll(values);
  }
}
