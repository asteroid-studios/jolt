import 'dart:ui';

import 'package:collection/collection.dart';

import 'package:jolt/jolt.dart';

///
extension BreakpointsContextX on BuildContext {
  /// Returns the current media query data.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get info about the current view and related breakpoints
  ViewData get view => ViewData(this);

  /// Returns the current breakpoints data.
  Breakpoints get breakpoints => jolt.value.breakpoints;

  ///
  Rect? get globalPaintBounds {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }

  ///
  T? responsive<T>({
    T? wearable,
    T? mobile,
    T? tablet,
    T? tabletLandscape,
    T? laptop,
    T? desktop,
    T? tv,
  }) {
    final mobileBreakpoint = mobile ?? wearable;
    final tabletBreakpoint = tablet ?? mobileBreakpoint;
    final tabletLandscapeBreakpoint = tabletLandscape ?? tabletBreakpoint;
    final laptopBreakpoint = laptop ?? tabletLandscapeBreakpoint;
    final desktopBreakpoint = desktop ?? laptopBreakpoint;
    final tvBreakpoint = tv ?? desktopBreakpoint;
    switch (view.breakpoint) {
      case Wearable():
        return wearable;
      case Mobile():
        return mobileBreakpoint;
      case Tablet():
        return tabletBreakpoint;
      case TabletLandscape():
        return tabletLandscapeBreakpoint;
      case Laptop():
        return laptopBreakpoint;
      case Desktop():
        return desktopBreakpoint;
      case Tv():
        return tvBreakpoint;
    }
  }
}

///
class ViewData {
  ///
  const ViewData(this._context);

  ///
  final BuildContext _context;

  ///
  FlutterView get value => View.of(_context);

  ///
  Breakpoint get breakpoint =>
      _context.breakpoints.breakpoints.firstWhereOrNull(
        (b) => _context.mediaQuery.size.width < b.maxWidth,
      ) ??
      _context.breakpoints.mobile;

  /// Returns true if current breakpoint is a wearable
  bool get isWearable => breakpoint is Wearable;

  /// Returns true if current breakpoint is mobile
  bool get isMobile => breakpoint is Mobile;

  /// Returns true if current breakpoint is tablet
  bool get isTablet => breakpoint is Tablet;

  /// Returns true if current breakpoint is a laptop
  bool get isLaptop => breakpoint is Laptop;

  /// Returns true if current breakpoint is desktop
  bool get isDesktop => breakpoint is Desktop;

  /// Returns true if current breakpoint is tv
  bool get isTv => breakpoint is Tv;

  /// Returns true if current breakpoint is mobile or smaller
  bool get isMobileOrSmaller => breakpoint <= _context.breakpoints.mobile;

  /// Returns true if current breakpoint is tablet or smaller
  bool get isTabletOrSmaller => breakpoint <= _context.breakpoints.tablet;

  /// Returns true if current breakpoint is laptop or smaller
  bool get isLaptopOrSmaller => breakpoint <= _context.breakpoints.laptop;

  /// Returns true if current breakpoint is desktop or smaller
  bool get isDesktopOrSmaller => breakpoint <= _context.breakpoints.desktop;

  /// Returns true if current breakpoint is tv or smaller
  bool get isTvOrSmaller => breakpoint <= _context.breakpoints.tv;

  /// Returns true if current breakpoint is wearable or larger
  bool get isWearableOrLarger => breakpoint >= _context.breakpoints.wearable;

  /// Returns true if current breakpoint is mobile or larger
  bool get isMobileOrLarger => breakpoint >= _context.breakpoints.mobile;

  /// Returns true if current breakpoint is tablet or larger
  bool get isTabletOrLarger => breakpoint >= _context.breakpoints.tablet;

  /// Returns true if current breakpoint is laptop or larger
  bool get isLaptopOrLarger => breakpoint >= _context.breakpoints.laptop;

  /// Returns true if current breakpoint is desktop or larger
  bool get isDesktopOrLarger => breakpoint >= _context.breakpoints.desktop;
}
