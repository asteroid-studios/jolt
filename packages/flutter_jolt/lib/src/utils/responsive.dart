import 'package:flutter/material.dart';

extension ResponsivenessExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ScreenMapping get screen => ScreenMapping(this);
}

class ScreenMapping {
  final BuildContext _context;

  ScreenMapping(this._context);

  Size get size => _context.mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  ScreenTypeMapping get type => ScreenTypeMapping(_context);
  MinimumScreenMapping get minSize => MinimumScreenMapping(type.value);
  MaximumScreenMapping get maxSize => MaximumScreenMapping(type.value);
}

class ScreenTypeMapping {
  final BuildContext _context;

  ScreenTypeMapping(this._context);

  JoltScreenType get value => getScreenType(_context);

  bool get isMobile => value == JoltScreenType.mobile;
  bool get isTablet => value == JoltScreenType.tablet;
  bool get isLaptop => value == JoltScreenType.laptop;
  bool get isDesktop => value == JoltScreenType.desktop;
  bool get isDesktopLarge => value == JoltScreenType.desktopLarge;
}

class MinimumScreenMapping {
  final JoltScreenType _windowType;

  MinimumScreenMapping(this._windowType);

  bool get isTablet => _windowType >= JoltScreenType.tablet;
  bool get isLaptop => _windowType >= JoltScreenType.laptop;
  bool get isDesktop => _windowType >= JoltScreenType.desktop;
}

class MaximumScreenMapping {
  final JoltScreenType _windowType;

  MaximumScreenMapping(this._windowType);

  bool get isTablet => _windowType <= JoltScreenType.tablet;
  bool get isLaptop => _windowType <= JoltScreenType.laptop;
  bool get isDesktop => _windowType <= JoltScreenType.desktop;
}

class JoltScreenType {
  const JoltScreenType._({
    required this.name,
    required this.relativeSize,
    required this.widthRangeValues,
    required this.heightLandscapeRangeValues,
    required this.heightPortraitRangeValues,
  });

  /// Name based on the [AdaptiveWindowType].
  ///
  /// Can be: xsmall, small, medium, large or xlarge
  final String name;

  /// Used to set custom comparison operators for the [AdaptiveWindowType] enum.
  final int relativeSize;

  /// Valid range of width for this window type.
  final RangeValues widthRangeValues;

  /// Valid range of height for this window type on landscape mode.
  final RangeValues heightLandscapeRangeValues;

  /// Valid range of height for this window type on portrait mode.
  final RangeValues heightPortraitRangeValues;

  static const JoltScreenType mobile = JoltScreenType._(
    name: 'mobile',
    relativeSize: 0,
    widthRangeValues: RangeValues(0, 599),
    heightLandscapeRangeValues: RangeValues(0, 359),
    heightPortraitRangeValues: RangeValues(0, 959),
  );

  static const JoltScreenType tablet = JoltScreenType._(
    name: 'tablet',
    relativeSize: 1,
    widthRangeValues: RangeValues(600, 1023),
    heightLandscapeRangeValues: RangeValues(360, 719),
    heightPortraitRangeValues: RangeValues(360, 1599),
  );

  static const JoltScreenType laptop = JoltScreenType._(
    name: 'laptop',
    relativeSize: 2,
    widthRangeValues: RangeValues(1024, 1439),
    heightLandscapeRangeValues: RangeValues(720, 959),
    heightPortraitRangeValues: RangeValues(720, 1919),
  );

  static const JoltScreenType desktop = JoltScreenType._(
    name: 'desktop',
    relativeSize: 3,
    widthRangeValues: RangeValues(1440, 1919),
    heightLandscapeRangeValues: RangeValues(960, 1279),
    heightPortraitRangeValues: RangeValues(1920, double.infinity),
  );

  static const JoltScreenType desktopLarge = JoltScreenType._(
    name: 'desktopLarge',
    relativeSize: 4,
    widthRangeValues: RangeValues(1920, double.infinity),
    heightLandscapeRangeValues: RangeValues(1280, double.infinity),
    heightPortraitRangeValues: RangeValues(1920, double.infinity),
  );

  bool operator <=(JoltScreenType other) => relativeSize <= other.relativeSize;

  bool operator <(JoltScreenType other) => relativeSize < other.relativeSize;

  bool operator >=(JoltScreenType other) => relativeSize >= other.relativeSize;

  bool operator >(JoltScreenType other) => relativeSize > other.relativeSize;
}

/// This class represents the Material breakpoint system entry.
/// https://material.io/design/layout/responsive-layout-grid.html#breakpoints
class BreakpointSystemEntry {
  const BreakpointSystemEntry({
    required this.range,
    this.portrait,
    this.landscape,
    required this.adaptiveWindowType,
    required this.columns,
    required this.margin,
    required this.gutter,
  });

  /// The breakpoint range values represents a width range.
  final RangeValues range;

  /// Type of device which uses this breakpoint range in portrait view.
  final String? portrait;

  /// Type of device which uses this breakpoint range in landscape view.
  final String? landscape;

  /// Material generalizes the device size into five different windows: extra
  /// small, small, medium, large, and extra large.
  ///
  /// The adaptive window represents a set of similar devices. For example, if
  /// you want to create an adaptive layout for phones and small tablets you
  /// would check if your window width is within the range of xsmall and s. If your
  /// user has a bigger window size than you would create a different layout for
  /// larger screens.
  final JoltScreenType adaptiveWindowType;

  /// The number of columns in this breakpoint system entry.
  /// https://material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins
  final int columns;

  /// The size of margins in pixels in this breakpoint system entry.
  /// Typically the same as gutters.
  /// https://material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins
  final double margin;

  /// The size of gutters in pixels in this breakpoint system entry. Typically
  /// the same as margins.
  ///
  /// Gutters represents the space between the columns.
  ///
  /// https://material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins
  final double gutter;
}

/// This list represents the material breakpoint system.
/// https://material.io/design/layout/responsive-layout-grid.html#breakpoints
///
/// This list is in sequential order.
const List<BreakpointSystemEntry> breakpointSystem = [
  BreakpointSystemEntry(
    range: RangeValues(0, 359),
    portrait: 'small handset',
    adaptiveWindowType: JoltScreenType.mobile,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(360, 399),
    portrait: 'medium handset',
    adaptiveWindowType: JoltScreenType.mobile,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(400, 479),
    portrait: 'large handset',
    adaptiveWindowType: JoltScreenType.mobile,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(480, 599),
    portrait: 'large handset',
    landscape: 'small handset',
    adaptiveWindowType: JoltScreenType.mobile,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(600, 719),
    portrait: 'small tablet',
    landscape: 'medium handset',
    adaptiveWindowType: JoltScreenType.tablet,
    columns: 8,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(720, 839),
    portrait: 'large tablet',
    landscape: 'large handset',
    adaptiveWindowType: JoltScreenType.tablet,
    columns: 8,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(840, 959),
    portrait: 'large tablet',
    landscape: 'large handset',
    adaptiveWindowType: JoltScreenType.tablet,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(960, 1023),
    landscape: 'small tablet',
    adaptiveWindowType: JoltScreenType.tablet,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1024, 1279),
    landscape: 'large tablet',
    adaptiveWindowType: JoltScreenType.laptop,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1280, 1439),
    landscape: 'large tablet',
    adaptiveWindowType: JoltScreenType.laptop,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1440, 1599),
    portrait: 'small handset',
    adaptiveWindowType: JoltScreenType.desktop,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1600, 1919),
    portrait: 'small handset',
    adaptiveWindowType: JoltScreenType.desktop,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1920, double.infinity),
    portrait: 'small handset',
    adaptiveWindowType: JoltScreenType.desktopLarge,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
];

/// Returns the [AdaptiveWindowType] to the user.
///
/// This is useful when the user wants to compare the MediaQuery to the current
/// window size.
JoltScreenType getScreenType(BuildContext context) {
  return getBreakpointEntry(context).adaptiveWindowType;
}

/// Returns the [BreakpointSystemEntry] to the user.
///
/// Typically the developer will use the getWindowType function. Using this
/// function gives the developer access to the specific breakpoint entry and
/// it's variables.
BreakpointSystemEntry getBreakpointEntry(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  for (BreakpointSystemEntry entry in breakpointSystem) {
    if (entry.range.start <= width && width < entry.range.end + 1) {
      return entry;
    }
  }
  throw AssertionError('Something unexpected happened');
}
