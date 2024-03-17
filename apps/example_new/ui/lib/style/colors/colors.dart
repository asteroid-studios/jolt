import 'package:jolt/jolt.dart';

/// Some pre-configured colors for Jolt.
///
/// Colors are based on the [TailwindCSS](https://tailwindcss.com/docs/customizing-colors) color palette.
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely Transparent.
  ///
  /// To access a ColorSwatch that is transparent, use context.color.transparent
  static const transparent = Color(0x00000000);

  /// Pure white
  static const white = Color(0xffffffff);

  /// Pure black
  static const black = Color(0xff000000);

  /// A neutral color with a blueish tint
  static const slate = ColorSwatch(
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
  static const grey = ColorSwatch(
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
  static const neutral = ColorSwatch(
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
  static const stone = ColorSwatch(
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
  static const emerald = ColorSwatch(
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
  static const violet = ColorSwatch(
    0xff7c3aed,
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
  static const red = ColorSwatch(
    0xffdc2626,
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
  static const amber = ColorSwatch(
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
  static const sky = ColorSwatch(
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
  static const rose = ColorSwatch(
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
