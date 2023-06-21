import 'package:ui/ui.dart';

// Satoshi Font
final satoshi = TextStyle(
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.w500,
  color: Colors.slate.s600,
);
final outfit = TextStyle(
  fontFamily: 'Outfit',
  fontWeight: FontWeight.w500,
  color: Colors.slate.s600,
);
final outfitBold = satoshi.copyWith(
  fontWeight: FontWeight.w800,
  color: Colors.slate.s800,
);
// Satoshi Dark Variant
final satoshiDark = satoshi.copyWith(
  color: Colors.slate.s200,
);
final outfitDarkBold = outfitBold.copyWith(
  color: Colors.slate.s50,
);

/// The typography for the app.
final typographyLight = Typography(
  heroLarge: outfitBold,
  hero: outfitBold,
  heroSmall: outfitBold,
  displayLarge: outfitBold,
  display: outfitBold,
  displaySmall: outfitBold,
  headingLarge: outfitBold,
  heading: outfitBold,
  headingSmall: outfitBold,
  bodyLarge: satoshi,
  body: satoshi,
  bodySmall: satoshi,
  labelLarge: satoshi,
  label: satoshi,
  labelSmall: satoshi,
);

/// The typography for the app.
final typographyDark = typographyLight.copyWith(
  heroLarge: outfitBold,
  hero: outfitDarkBold,
  heroSmall: outfitBold,
  displayLarge: outfitDarkBold,
  display: outfitDarkBold,
  displaySmall: outfitDarkBold,
  headingLarge: outfitDarkBold,
  heading: outfitDarkBold,
  headingSmall: outfitDarkBold,
  bodyLarge: satoshiDark,
  body: satoshiDark,
  bodySmall: satoshiDark,
  labelLarge: satoshi,
  label: satoshiDark,
  labelSmall: satoshiDark,
);
