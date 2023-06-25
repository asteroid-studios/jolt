import 'package:flutter/widgets.dart';

import 'package:jolt/src/theming/color/jolt_color.dart';

/// Some pre-made colors for Jolt.
class Colors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Colors._();

  /// Completely Transparent.
  ///
  /// To access a JoltColor that is transparent, use context.color.transparent
  static const transparent = Color(0x00000000);

  /// Pure white
  static const white = JoltColor(
    0xffffffff,
    foreground: Color(0xff000000),
    foregroundLight: Color(0xff737373),
    onHovered: Color(0xffa3a3a3),
    onFocused: Color(0xffa3a3a3),
    onDragged: Color(0xffe5e5e5),
    onDisabled: Color(0xffe5e5e5),
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

  /// Pure black
  static const black = JoltColor(
    0xff000000,
    foreground: Color(0xffffffff),
    foregroundLight: Color(0xff737373),
    onHovered: Color(0xff404040),
    onFocused: Color(0xff404040),
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

  /// A neutral color with a blueish tint
  static const slate = JoltColor(
    0xff475569,
    foreground: Color(0xfff1f5f9),
    foregroundLight: Color(0xff94a3b8),
    onHovered: Color(0xff334155),
    onFocused: Color(0xff334155),
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
    foreground: Color(0xfff5f5f4),
    foregroundLight: Color(0xffe7e5e4),
    onHovered: Color(0xff404040),
    onFocused: Color(0xff404040),
    onDisabled: Color(0xffa3a3a3),
    onDragged: Color(0xffa3a3a3),
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
    foreground: Color(0xffecfdf5),
    foregroundLight: Color(0xffa7f3d0),
    onHovered: Color(0xff047857),
    onFocused: Color(0xff047857),
    onDisabled: Color(0xff065f46),
    onDragged: Color(0xff065f46),
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
    foreground: Color(0xffede9fe),
    foregroundLight: Color(0xffddd6fe),
    onHovered: Color(0xff5b21b6),
    onFocused: Color(0xff5b21b6),
    onDisabled: Color(0xff4c1d95),
    onDragged: Color(0xff4c1d95),
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
    foreground: Color(0xfffee2e2),
    foregroundLight: Color(0xfffecaca),
    onHovered: Color(0xffb91c1c),
    onFocused: Color(0xffb91c1c),
    onDisabled: Color(0xff7f1d1d),
    onDragged: Color(0xff7f1d1d),
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
    foreground: Color(0xfffef3c7),
    foregroundLight: Color(0xfffde68a),
    onHovered: Color(0xffb45309),
    onFocused: Color(0xffb45309),
    onDisabled: Color(0xff78350f),
    onDragged: Color(0xff78350f),
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
    foreground: Color(0xffe0f2fe),
    foregroundLight: Color(0xff7dd3fc),
    onHovered: Color(0xff0369a1),
    onFocused: Color(0xff0369a1),
    onDisabled: Color(0xff0c4a6e),
    onDragged: Color(0xff0c4a6e),
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
