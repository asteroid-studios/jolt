import 'package:flutter/material.dart';

abstract class Span {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s16 = 16.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s48 = 48.0;
  static const double s64 = 64.0;
  static const double s96 = 96.0;
  static const double s128 = 128.0;
}

extension SpacingExtension on BuildContext {
  SpacingMapping get spacing => SpacingMapping();
}

class SpacingMapping {
  double get s4 => Span.s4;
  double get s8 => Span.s8;
  double get s16 => Span.s16;
  double get s24 => Span.s24;
  double get s32 => Span.s32;
  double get s48 => Span.s48;
  double get s64 => Span.s64;
  double get s96 => Span.s96;
  double get s128 => Span.s128;
}
