import 'package:google_fonts/google_fonts.dart';
import 'package:jolt/jolt.dart';

final _inter700 = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
);
final _inter300Light = GoogleFonts.inter(
  fontWeight: FontWeight.w300,
  color: Colors.slate.s600,
);

final _inter300Dark = _inter300Light.copyWith(
  color: Colors.slate.s400,
);

/// The typography for the app.
final typographyLight = Typography(
  displayLarge: _inter700,
  display: _inter700,
  displaySmall: _inter700,
  headingLarge: _inter700,
  heading: _inter700,
  headingSmall: _inter700,
  bodyLarge: _inter300Light,
  body: _inter300Light,
  bodySmall: _inter300Light,
  label: _inter300Light,
  labelSmall: _inter300Light,
);

/// The typography for the app.
final typographyDark = typographyLight.copyWith(
  bodyLarge: _inter300Dark,
  body: _inter300Dark,
  bodySmall: _inter300Dark,
  label: _inter300Dark,
  labelSmall: _inter300Dark,
);
