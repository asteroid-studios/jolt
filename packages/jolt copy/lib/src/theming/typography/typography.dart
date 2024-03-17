import 'package:jolt_copy/jolt.dart';

const _defaultHeroLarge = TextStyle(fontSize: 128);
const _defaultHero = TextStyle(fontSize: 96);
const _defaultHeroSmall = TextStyle(fontSize: 72);
const _defaultDisplayLarge = TextStyle(fontSize: 60);
const _defaultDisplay = TextStyle(fontSize: 48);
const _defaultDisplaySmall = TextStyle(fontSize: 36);
const _defaultHeadingLarge = TextStyle(fontSize: 28);
const _defaultHeading = TextStyle(fontSize: 24);
const _defaultHeadingSmall = TextStyle(fontSize: 20);
const _defaultBodyLarge = TextStyle(fontSize: 18);
const _defaultBody = TextStyle(fontSize: 16);
const _defaultBodySmall = TextStyle(fontSize: 14);
const _defaultLabelLarge = TextStyle(fontSize: 12);
const _defaultLabel = TextStyle(fontSize: 10);
const _defaultLabelSmall = TextStyle(fontSize: 8);

/// The typography for the theme.
@immutable
class Typography {
  /// Initialise the typography for the theme.
  Typography({
    TextStyle? heroLarge,
    TextStyle? hero,
    TextStyle? heroSmall,
    TextStyle? displayLarge,
    TextStyle? display,
    TextStyle? displaySmall,
    TextStyle? headingLarge,
    TextStyle? heading,
    TextStyle? headingSmall,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? label,
    TextStyle? labelSmall,
  })  : _heroLarge = heroLarge?.merge(_defaultHeroLarge) ?? _defaultHeroLarge,
        _hero = hero?.merge(_defaultHero) ?? _defaultHero,
        _heroSmall = heroSmall?.merge(_defaultHeroSmall) ?? _defaultHeroSmall,
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
        _labelLarge =
            labelLarge?.merge(_defaultLabelLarge) ?? _defaultLabelLarge,
        _label = label?.merge(_defaultLabel) ?? _defaultLabel,
        _labelSmall =
            labelSmall?.merge(_defaultLabelSmall) ?? _defaultLabelSmall;

  TextStyle _formatStyle(TextStyle style) {
    // We use the font weight to determine the font variation settings.
    // This means that for variable fonts its enough to just set the font weight
    return style.withFontVariationsFromWeight();
  }

  /// Used for large hero text.
  TextStyle get heroLarge => _formatStyle(_heroLarge);
  final TextStyle _heroLarge;

  /// Used for hero text.
  TextStyle get hero => _formatStyle(_hero);
  final TextStyle _hero;

  /// Used for small hero text.
  TextStyle get heroSmall => _formatStyle(_heroSmall);
  final TextStyle _heroSmall;

  /// Used for large display text.
  TextStyle get displayLarge => _formatStyle(_displayLarge);
  final TextStyle _displayLarge;

  /// Used for display text.
  TextStyle get display => _formatStyle(_display);
  final TextStyle _display;

  /// Used for small display text.
  TextStyle get displaySmall => _formatStyle(_displaySmall);
  final TextStyle _displaySmall;

  /// Used for large heading text.
  TextStyle get headingLarge => _formatStyle(_headingLarge);
  final TextStyle _headingLarge;

  /// Used for heading text.
  TextStyle get heading => _formatStyle(_heading);
  final TextStyle _heading;

  /// Used for small heading text.
  TextStyle get headingSmall => _formatStyle(_headingSmall);
  final TextStyle _headingSmall;

  /// Used for large body text.
  TextStyle get bodyLarge => _formatStyle(_bodyLarge);
  final TextStyle _bodyLarge;

  /// Used for body text.
  TextStyle get body => _formatStyle(_body);
  final TextStyle _body;

  /// Used for small body text.
  TextStyle get bodySmall => _formatStyle(_bodySmall);
  final TextStyle _bodySmall;

  /// Used for large label text.
  TextStyle get labelLarge => _formatStyle(_labelLarge);
  final TextStyle _labelLarge;

  /// Used for label text.
  TextStyle get label => _formatStyle(_label);
  final TextStyle _label;

  /// Used for small label text.
  TextStyle get labelSmall => _formatStyle(_labelSmall);
  final TextStyle _labelSmall;

  /// Return a copy of Typography with the given parameters replaced
  Typography copyWith({
    TextStyle? heroLarge,
    TextStyle? hero,
    TextStyle? heroSmall,
    TextStyle? displayLarge,
    TextStyle? display,
    TextStyle? displaySmall,
    TextStyle? headingLarge,
    TextStyle? heading,
    TextStyle? headingSmall,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? label,
    TextStyle? labelSmall,
  }) {
    return Typography(
      heroLarge: heroLarge ?? _heroLarge,
      hero: hero ?? _hero,
      heroSmall: heroSmall ?? _heroSmall,
      displayLarge: displayLarge ?? _displayLarge,
      display: display ?? _display,
      displaySmall: displaySmall ?? _displaySmall,
      headingLarge: headingLarge ?? _headingLarge,
      heading: heading ?? _heading,
      headingSmall: headingSmall ?? _headingSmall,
      bodyLarge: bodyLarge ?? _bodyLarge,
      body: body ?? _body,
      bodySmall: bodySmall ?? _bodySmall,
      labelLarge: labelLarge ?? _labelLarge,
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
        other._heroLarge == _heroLarge &&
        other._hero == _hero &&
        other._heroSmall == _heroSmall &&
        other._displayLarge == _displayLarge &&
        other._display == _display &&
        other._displaySmall == _displaySmall &&
        other._headingLarge == _headingLarge &&
        other._heading == _heading &&
        other._headingSmall == _headingSmall &&
        other._bodyLarge == _bodyLarge &&
        other._body == _body &&
        other._bodySmall == _bodySmall &&
        other._labelLarge == _labelLarge &&
        other._label == _label &&
        other._labelSmall == _labelSmall;
  }

  @override
  int get hashCode {
    final values = <Object?>[
      _heroLarge,
      _hero,
      _heroSmall,
      _displayLarge,
      _display,
      _displaySmall,
      _headingLarge,
      _heading,
      _headingSmall,
      _bodyLarge,
      _body,
      _bodySmall,
      _labelLarge,
      _label,
      _labelSmall,
    ];
    return Object.hashAll(values);
  }
}

/// Available font variation axis
class FontVariationAxis {
  /// The font variation axis for the font weight
  static const weight = 'wght';
}
