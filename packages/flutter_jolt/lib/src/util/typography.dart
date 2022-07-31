import 'package:flutter/material.dart';

/// This mapping is primarty meant to only reveal 2021 textstyles
/// Encouraging use of the new formats, rather than h1-6
class TextStyleMapping {
  final ThemeData themeData;

  TextStyleMapping(this.themeData);

  TextTheme get _textTheme => themeData.textTheme;

  // * Display Typography Styles
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get displayLarge => _textTheme.displayLarge;

  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get display => _textTheme.displayMedium;

  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get displaySmall => _textTheme.displaySmall;

  // * Headline Typography Styles
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineLarge => _textTheme.headlineLarge;

  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headline => _textTheme.headlineMedium;

  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineSmall => _textTheme.headlineSmall;

  // * Title Typography Styles
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleLarge => _textTheme.titleLarge;

  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get title => _textTheme.titleMedium;

  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleSmall => _textTheme.titleSmall;

  // * Label Typography Styles
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  TextStyle? get labelLarge => _textTheme.labelLarge;

  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  TextStyle? get label => _textTheme.labelMedium;

  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  TextStyle? get labelSmall => _textTheme.labelSmall;

  // * Body Typography Styles
  /// Body styles are used for longer passages of text.
  TextStyle? get bodyLarge => _textTheme.bodyLarge;

  /// Body styles are used for longer passages of text.
  TextStyle? get body => _textTheme.bodyMedium;

  /// Body styles are used for longer passages of text.
  TextStyle? get bodySmall => _textTheme.bodySmall;
}
