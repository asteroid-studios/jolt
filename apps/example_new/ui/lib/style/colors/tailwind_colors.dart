import 'package:ui/ui.dart';

/// Some pre-configured colors for Jolt.
///
/// Colors are based on the [TailwindCSS](https://tailwindcss.com/docs/customizing-colors) color palette.
class TailwindColors {
  /// A neutral color with a blueish tint
  ColorSwatch get slate => const ColorSwatch(
        0xFF475569,
        name: 'Slate',
        shade50: Color(0xFFf8fafc),
        shade100: Color(0xFFf1f5f9),
        shade200: Color(0xFFe2e8f0),
        shade300: Color(0xFFcbd5e1),
        shade400: Color(0xFF94a3b8),
        shade500: Color(0xFF64748b),
        shade600: Color(0xFF475569),
        shade700: Color(0xFF334155),
        shade800: Color(0xFF1e293b),
        shade900: Color(0xFF0f172a),
        shade950: Color(0xFF020617),
      );

  ///
  ColorSwatch get grey => const ColorSwatch(
        0xFF4b5563,
        name: 'Grey',
        shade50: Color(0xFFf9fafb),
        shade100: Color(0xFFf3f4f6),
        shade200: Color(0xFFe5e7eb),
        shade300: Color(0xFFd1d5db),
        shade400: Color(0xFF9ca3af),
        shade500: Color(0xFF6b7280),
        shade600: Color(0xFF4b5563),
        shade700: Color(0xFF374151),
        shade800: Color(0xFF1f2937),
        shade900: Color(0xFF111827),
        shade950: Color(0xFF030712),
      );

  ///
  ColorSwatch get neutral => const ColorSwatch(
        0xff525252,
        name: 'Neutral',
        shade50: Color(0xfffafafa),
        shade100: Color(0xfff5f5f5),
        shade200: Color(0xffe5e5e5),
        shade300: Color(0xffd4d4d4),
        shade400: Color(0xffa3a3a3),
        shade500: Color(0xff737373),
        shade600: Color(0xff525252),
        shade700: Color(0xff404040),
        shade800: Color(0xff262626),
        shade900: Color(0xff171717),
        shade950: Color(0xff0a0a0a),
      );

  /// A neutral color
  ColorSwatch get stone => const ColorSwatch(
        0xff525252,
        name: 'Stone',
        shade50: Color(0xfffafaf9),
        shade100: Color(0xfff5f5f4),
        shade200: Color(0xffe7e5e4),
        shade300: Color(0xffd4d4d4),
        shade400: Color(0xffa3a3a3),
        shade500: Color(0xff71717a),
        shade600: Color(0xff525252),
        shade700: Color(0xff404040),
        shade800: Color(0xff262626),
        shade900: Color(0xff171717),
        shade950: Color(0xff0a0a0a),
      );

  /// A light green color.
  ColorSwatch get green => const ColorSwatch(
        0xff15803d,
        name: 'Green',
        shade50: Color(0xfff0fdf4),
        shade100: Color(0xffdcfce7),
        shade200: Color(0xffbbf7d0),
        shade300: Color(0xff86efac),
        shade400: Color(0xff4ade80),
        shade500: Color(0xff22c55e),
        shade600: Color(0xff16a34a),
        shade700: Color(0xff15803d),
        shade800: Color(0xff166534),
        shade900: Color(0xff14532d),
        shade950: Color(0xff052e16),
      );

  /// A light green color.
  ColorSwatch get emerald => const ColorSwatch(
        0xff059669,
        name: 'Emerald',
        shade50: Color(0xffecfdf5),
        shade100: Color(0xffd1fae5),
        shade200: Color(0xffa7f3d0),
        shade300: Color(0xff6ee7b7),
        shade400: Color(0xff34d399),
        shade500: Color(0xFF10b981),
        shade600: Color(0xff059669),
        shade700: Color(0xff047857),
        shade800: Color(0xff065f46),
        shade900: Color(0xff064e3b),
        shade950: Color(0xff022c22),
      );

  /// A light purple color.
  ColorSwatch get violet => const ColorSwatch(
        0xff8b5cf6,
        name: 'Violet',
        shade50: Color(0xfffaf5ff),
        shade100: Color(0xffede9fe),
        shade200: Color(0xffddd6fe),
        shade300: Color(0xffc4b5fd),
        shade400: Color(0xffa78bfa),
        shade500: Color(0xff8b5cf6),
        shade600: Color(0xff7c3aed),
        shade700: Color(0xff6d28d9),
        shade800: Color(0xff5b21b6),
        shade900: Color(0xff4c1d95),
        shade950: Color(0xff2e1065),
      );

  /// A light red color.
  ColorSwatch get red => const ColorSwatch(
        0xffb91c1c,
        name: 'Red',
        shade50: Color(0xfffef2f2),
        shade100: Color(0xfffee2e2),
        shade200: Color(0xfffecaca),
        shade300: Color(0xfffca5a5),
        shade400: Color(0xfff87171),
        shade500: Color(0xffef4444),
        shade600: Color(0xffdc2626),
        shade700: Color(0xffb91c1c),
        shade800: Color(0xff991b1b),
        shade900: Color(0xff7f1d1d),
        shade950: Color(0xff450a0a),
      );

  /// A light yellow color.
  ColorSwatch get orange => const ColorSwatch(
        0xffea580c,
        name: 'Orange',
        shade50: Color(0xfffff7ed),
        shade100: Color(0xffffedd5),
        shade200: Color(0xfffed7aa),
        shade300: Color(0xfffdba74),
        shade400: Color(0xfffb923c),
        shade500: Color(0xfff97316),
        shade600: Color(0xffea580c),
        shade700: Color(0xffc2410c),
        shade800: Color(0xff9a3412),
        shade900: Color(0xff7c2d12),
        shade950: Color(0xff431407),
      );

  /// A light yellow color.
  ColorSwatch get amber => const ColorSwatch(
        0xffd97706,
        name: 'Amber',
        shade50: Color(0xfffffbeb),
        shade100: Color(0xfffef3c7),
        shade200: Color(0xfffde68a),
        shade300: Color(0xfffcd34d),
        shade400: Color(0xfffbbf24),
        shade500: Color(0xfff59e0b),
        shade600: Color(0xffd97706),
        shade700: Color(0xffb45309),
        shade800: Color(0xff92400e),
        shade900: Color(0xff78350f),
        shade950: Color(0xff451a03),
      );

  /// A light blue color.
  ColorSwatch get sky => const ColorSwatch(
        0xff0284c7,
        name: 'Sky',
        shade50: Color(0xfff0f9ff),
        shade100: Color(0xffe0f2fe),
        shade200: Color(0xffbae6fd),
        shade300: Color(0xff7dd3fc),
        shade400: Color(0xff38bdf8),
        shade500: Color(0xff0ea5e9),
        shade600: Color(0xff0284c7),
        shade700: Color(0xff0369a1),
        shade800: Color(0xff075985),
        shade900: Color(0xff0c4a6e),
        shade950: Color(0xff082f49),
      );

  /// Rose
  ColorSwatch get rose => const ColorSwatch(
        0xFFe11d48,
        name: 'Rose',
        shade50: Color(0xFFfff1f2),
        shade100: Color(0xFFffe4e6),
        shade200: Color(0xFFfecdd3),
        shade300: Color(0xFFfda4af),
        shade400: Color(0xFFfb7185),
        shade500: Color(0xFFf43f5e),
        shade600: Color(0xFFe11d48),
        shade700: Color(0xFFbe123c),
        shade800: Color(0xFF9f1239),
        shade900: Color(0xFF881337),
        shade950: Color(0xFF4c0519),
      );
}
