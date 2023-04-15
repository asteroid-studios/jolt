import 'package:flutter/widgets.dart';

import 'package:jolt/src/theme/color/jolt_color.dart';

/// Some pre-made colors for Jolt.
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely invisible.
  static const Color transparent = Color(0x00000000);

  /// A neutral color with a blueish tint
  static const JoltColor slate = JoltColor(
    0xFF64748b,
    highlight: 0xfff1f5f9,
    shade50: 0xfff8fafc,
    shade100: 0xfff1f5f9,
    shade200: 0xffe2e8f0,
    shade300: 0xffcbd5e1,
    shade400: 0xff94a3b8,
    shade600: 0xff475569,
    shade700: 0xff334155,
    shade800: 0xff1e293b,
    shade900: 0xff0f172a,
    shade950: 0xff020617,
  );

  /// A neutral color
  static const JoltColor stone = JoltColor(
    0xff71717a,
    highlight: 0xfff5f5f4,
    shade50: 0xfffafaf9,
    shade100: 0xfff5f5f4,
    shade200: 0xffe7e5e4,
    shade300: 0xffd4d4d4,
    shade400: 0xffa3a3a3,
    shade600: 0xff525252,
    shade700: 0xff404040,
    shade800: 0xff262626,
    shade900: 0xff171717,
    shade950: 0xff0a0a0a,
  );

  /// A light green color.
  static const JoltColor emerald = JoltColor(
    0xFF10b981,
    highlight: 0xffd1fae5,
    shade50: 0xffecfdf5,
    shade100: 0xffd1fae5,
    shade200: 0xffa7f3d0,
    shade300: 0xff6ee7b7,
    shade400: 0xff34d399,
    shade600: 0xff059669,
    shade700: 0xff047857,
    shade800: 0xff065f46,
    shade900: 0xff064e3b,
    shade950: 0xff022c22,
  );

  /// A light purple color.
  static const JoltColor violet = JoltColor(
    0xff8b5cf6,
    highlight: 0xffede9fe,
    shade50: 0xfffaf5ff,
    shade100: 0xffede9fe,
    shade200: 0xffddd6fe,
    shade300: 0xffc4b5fd,
    shade400: 0xffa78bfa,
    shade600: 0xff7c3aed,
    shade700: 0xff6d28d9,
    shade800: 0xff5b21b6,
    shade900: 0xff4c1d95,
    shade950: 0xff2e1065,
  );

  /// A light red color.
  static const JoltColor red = JoltColor(
    0xffef4444,
    highlight: 0xfffee2e2,
    shade50: 0xfffef2f2,
    shade100: 0xfffee2e2,
    shade200: 0xfffecaca,
    shade300: 0xfffca5a5,
    shade400: 0xfff87171,
    shade600: 0xffdc2626,
    shade700: 0xffb91c1c,
    shade800: 0xff991b1b,
    shade900: 0xff7f1d1d,
    shade950: 0xff450a0a,
  );

  /// A light yellow color.
  static const JoltColor amber = JoltColor(
    0xfff59e0b,
    highlight: 0xfffef3c7,
    shade50: 0xfffffbeb,
    shade100: 0xfffef3c7,
    shade200: 0xfffde68a,
    shade300: 0xfffcd34d,
    shade400: 0xfffbbf24,
    shade600: 0xffd97706,
    shade700: 0xffb45309,
    shade800: 0xff92400e,
    shade900: 0xff78350f,
    shade950: 0xff451a03,
  );

  /// A light blue color.
  static const JoltColor sky = JoltColor(
    0xff0ea5e9,
    highlight: 0xffe0f2fe,
    shade50: 0xfff0f9ff,
    shade100: 0xffe0f2fe,
    shade200: 0xffbae6fd,
    shade300: 0xff7dd3fc,
    shade400: 0xff38bdf8,
    shade600: 0xff0284c7,
    shade700: 0xff0369a1,
    shade800: 0xff075985,
    shade900: 0xff0c4a6e,
    shade950: 0xff082f49,
  );
}
