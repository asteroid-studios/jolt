import 'package:flutter/material.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

extension ResponsivenessExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ResponsiveMapping get responsive => ResponsiveMapping(this);
}

class ResponsiveMapping {
  final BuildContext context;

  ResponsiveMapping(this.context);

  Size get size => context.mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  AdaptiveWindowType get _windowType => getWindowType(context);

  bool get isMobile => _windowType == AdaptiveWindowType.xsmall;
  bool get isTablet => _windowType == AdaptiveWindowType.small;
  bool get isLaptop => _windowType == AdaptiveWindowType.medium;
  bool get isDesktop => _windowType == AdaptiveWindowType.large;
  bool get isDesktopLarge => _windowType == AdaptiveWindowType.xlarge;
}
