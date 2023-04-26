import 'package:google_fonts/google_fonts.dart';
import 'package:jolt/jolt.dart';

/// Return my widget theme
WidgetThemeData widgetTheme(
  ThemeData theme,
) {
  return WidgetThemeData(
    surface: SurfaceTheme(
      horizontalPadding: theme.dimensions.sizing.md,
      verticalPadding: theme.dimensions.sizing.md,
      borderRadius: theme.borderRadius.lg,
    ),
    button: ButtonTheme(
      horizontalPadding: theme.dimensions.sizing.md,
      verticalPadding: theme.dimensions.sizing.xs,
      borderRadius: theme.borderRadius.md,
      // processingIcon: Icons.duotone.spinnerGap,
      labelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
      ).copyWith(
        color: theme.style.heading.color,
        fontSize: theme.style.body.fontSize,
      ),
    ),
  );
}
