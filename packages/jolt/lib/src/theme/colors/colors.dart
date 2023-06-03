import 'package:flutter/widgets.dart';

import 'package:jolt/src/theme/color/jolt_color.dart';

/// Some pre-made colors for Jolt.
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely Transparent.
  static const Color transparent = Color(0x00000000);

  /// Pure white
  static const white = JoltColor(
    0xffffffff,
    onTop: Color(0xff000000),
    onHover: Color(0xff9ca3af),
    onFocus: Color(0xff9ca3af),
    shade50: Color(0xff000000),
    shade100: Color(0xff111827),
    shade200: Color(0xff1f2937),
    shade300: Color(0xff4b5563),
    shade400: Color(0xff4b5563),
    shade500: Color(0xff6b7280),
    shade600: Color(0xff9ca3af),
    shade700: Color(0xffd1d5db),
    shade800: Color(0xffe5e7eb),
    shade900: Color(0xfff3f4f6),
    shade950: Color(0xffffffff),
  );

  /// Pure black
  static const black = JoltColor(
    0xff000000,
    onTop: Color(0xffffffff),
    onHover: Color(0xff4b5563),
    onFocus: Color(0xff4b5563),
    shade50: Color(0xffffffff),
    shade100: Color(0xfff3f4f6),
    shade200: Color(0xffe5e7eb),
    shade300: Color(0xffd1d5db),
    shade400: Color(0xff9ca3af),
    shade500: Color(0xff6b7280),
    shade600: Color(0xff4b5563),
    shade700: Color(0xff4b5563),
    shade800: Color(0xff1f2937),
    shade900: Color(0xff111827),
    shade950: Color(0xff000000),
  );

  /// A neutral color with a blueish tint
  static const slate = JoltColor(
    0xff475569,
    onTop: Color(0xfff1f5f9),
    onHover: Color(0xff334155),
    onFocus: Color(0xff334155),
    shade50: Color(0xfff8fafc),
    shade100: Color(0xfff1f5f9),
    shade200: Color(0xffe2e8f0),
    shade300: Color(0xffcbd5e1),
    shade400: Color(0xff94a3b8),
    shade500: Color(0xFF64748b),
    shade600: Color(0xff475569),
    shade700: Color(0xff334155),
    shade800: Color(0xff1e293b),
    shade900: Color(0xff0f172a),
    shade950: Color(0xff020617),
  );

  /// A neutral color
  static const stone = JoltColor(
    0xff525252,
    onTop: Color(0xfff5f5f4),
    onHover: Color(0xff404040),
    onFocus: Color(0xff404040),
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
  static const emerald = JoltColor(
    0xff059669,
    onTop: Color(0xffecfdf5),
    onHover: Color(0xff047857),
    onFocus: Color(0xff047857),
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
  static const violet = JoltColor(
    0xff7c3aed,
    onTop: Color(0xffede9fe),
    onHover: Color(0xff5b21b6),
    onFocus: Color(0xff5b21b6),
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
  static const red = JoltColor(
    0xffdc2626,
    onTop: Color(0xfffee2e2),
    onHover: Color(0xffb91c1c),
    onFocus: Color(0xffb91c1c),
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
  static const amber = JoltColor(
    0xffd97706,
    onTop: Color(0xfffef3c7),
    onHover: Color(0xffb45309),
    onFocus: Color(0xffb45309),
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
  static const sky = JoltColor(
    0xff0284c7,
    onTop: Color(0xffe0f2fe),
    onHover: Color(0xff0369a1),
    onFocus: Color(0xff0369a1),
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
}
