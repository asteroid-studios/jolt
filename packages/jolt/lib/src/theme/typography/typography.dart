import 'package:flutter/widgets.dart';

import 'package:jolt/src/utils/theme/defaults.dart';

const _defaultHero = TextStyle(fontSize: 72);
const _defaultDisplayLarge = TextStyle(fontSize: 60);
const _defaultDisplay = TextStyle(fontSize: 48);
const _defaultDisplaySmall = TextStyle(fontSize: 36);
const _defaultHeadingLarge = TextStyle(fontSize: 28);
const _defaultHeading = TextStyle(fontSize: 24);
const _defaultHeadingSmall = TextStyle(fontSize: 20);
const _defaultBodyLarge = TextStyle(fontSize: 18);
const _defaultBody = TextStyle(fontSize: 16);
const _defaultBodySmall = TextStyle(fontSize: 14);
const _defaultLabel = TextStyle(fontSize: 12);
const _defaultLabelSmall = TextStyle(fontSize: 10);

/// The typography for the theme.
@immutable
class Typography {
  /// Initialise the typography for the theme.
  Typography({
    TextStyle? hero,
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
  })  : _hero = hero?.merge(_defaultHero) ?? _defaultHero,
        _displayLarge =
            displayLarge?.merge(_defaultDisplayLarge) ?? _defaultDisplayLarge,
        _display = display?.merge(_defaultDisplay) ?? _defaultDisplay,
        _displaySmall =
            displaySmall?.merge(_defaultDisplaySmall) ?? _defaultDisplaySmall,
        _headingLarge =
            headingLarge?.merge(_defaultHeadingLarge) ?? _defaultHeadingLarge,
        _heading = heading?.merge(_defaultHeading) ?? _defaultHeading,
        _headingSmall =
            headingSmall?.merge(_defaultHeadingSmall) ?? _defaultHeadingSmall,
        _bodyLarge = bodyLarge?.merge(_defaultBodyLarge) ?? _defaultBodyLarge,
        _body = body?.merge(_defaultBody) ?? _defaultBody,
        _bodySmall = bodySmall?.merge(_defaultBodySmall) ?? _defaultBodySmall,
        _label = label?.merge(_defaultLabel) ?? _defaultLabel,
        _labelSmall =
            labelSmall?.merge(_defaultLabelSmall) ?? _defaultLabelSmall;

  /// Used for hero text.
  TextStyle get hero => _hero.withFontVariationsFromWeight();
  final TextStyle _hero;

  /// Used for large display text.
  TextStyle get displayLarge => _displayLarge.withFontVariationsFromWeight();
  final TextStyle _displayLarge;

  /// Used for display text.
  TextStyle get display => _display.withFontVariationsFromWeight();
  final TextStyle _display;

  /// Used for small display text.
  TextStyle get displaySmall => _displaySmall.withFontVariationsFromWeight();
  final TextStyle _displaySmall;

  /// Used for large heading text.
  TextStyle get headingLarge => _headingLarge.withFontVariationsFromWeight();
  final TextStyle _headingLarge;

  /// Used for heading text.
  TextStyle get heading => _heading.withFontVariationsFromWeight();
  final TextStyle _heading;

  /// Used for small heading text.
  TextStyle get headingSmall => _headingSmall.withFontVariationsFromWeight();
  final TextStyle _headingSmall;

  /// Used for large body text.
  TextStyle get bodyLarge => _bodyLarge.withFontVariationsFromWeight();
  final TextStyle _bodyLarge;

  /// Used for body text.
  TextStyle get body => _body.withFontVariationsFromWeight();
  final TextStyle _body;

  /// Used for small body text.
  TextStyle get bodySmall => _bodySmall.withFontVariationsFromWeight();
  final TextStyle _bodySmall;

  /// Used for label text.
  TextStyle get label => _label.withFontVariationsFromWeight();
  final TextStyle _label;

  /// Used for small label text.
  TextStyle get labelSmall => _labelSmall.withFontVariationsFromWeight();
  final TextStyle _labelSmall;

  /// Return a copy of Typography with the given parameters replaced
  Typography copyWith({
    TextStyle? hero,
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
      hero: hero ?? _hero,
      displayLarge: displayLarge ?? _displayLarge,
      display: display ?? _display,
      displaySmall: displaySmall ?? _displaySmall,
      headingLarge: headingLarge ?? _headingLarge,
      heading: heading ?? _heading,
      headingSmall: headingSmall ?? _headingSmall,
      bodyLarge: bodyLarge ?? _bodyLarge,
      body: body ?? _body,
      bodySmall: bodySmall ?? _bodySmall,
      label: label ?? _label,
      labelSmall: labelSmall ?? _labelSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Typography &&
        other._hero == _hero &&
        other._displayLarge == _displayLarge &&
        other._display == _display &&
        other._displaySmall == _displaySmall &&
        other._headingLarge == _headingLarge &&
        other._heading == _heading &&
        other._headingSmall == _headingSmall &&
        other._bodyLarge == _bodyLarge &&
        other._body == _body &&
        other._bodySmall == _bodySmall &&
        other._label == _label &&
        other._labelSmall == _labelSmall;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      _hero,
      _displayLarge,
      _display,
      _displaySmall,
      _headingLarge,
      _heading,
      _headingSmall,
      _bodyLarge,
      _body,
      _bodySmall,
      _label,
      _labelSmall,
    ];
    return Object.hashAll(values);
  }
}
