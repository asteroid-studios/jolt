import 'package:ui/ui.dart';

/// Body Font
const satoshi = TextStyle(
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.w500,
);

/// Heading font
const outfit = satoshi;
// const outfit = TextStyle(
// fontFamily: 'Outfit',
// fontWeight: FontWeight.w600,
// );

/// The typography for the app.
final typography = Typography(
  heroLarge: outfit,
  hero: outfit,
  heroSmall: outfit,
  displayLarge: outfit,
  display: outfit,
  displaySmall: outfit,
  headingLarge: outfit,
  heading: outfit,
  headingSmall: outfit,
  bodyLarge: satoshi,
  body: satoshi,
  bodySmall: satoshi,
  labelLarge: satoshi,
  label: satoshi,
  labelSmall: satoshi,
);
