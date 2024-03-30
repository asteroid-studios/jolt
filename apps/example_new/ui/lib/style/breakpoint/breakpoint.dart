// ignore_for_file: prefer_constructors_over_static_methods

import 'package:collection/collection.dart';
import 'package:ui/ui.dart';

part 'breakpoint.extensions.dart';

///
class Mobile extends Breakpoint {
  @override
  double get minWidth => 0;
  @override
  double get maxWidth => 599;
}

///
class Tablet extends Breakpoint {
  @override
  double get minWidth => 600;
  @override
  double get maxWidth => 899;
}

///
class TabletLandscape extends Breakpoint {
  @override
  double get minWidth => 900;
  @override
  double get maxWidth => 1199;
}

///
class Laptop extends Breakpoint {
  @override
  double get minWidth => 1200;
  @override
  double get maxWidth => 1599;
}

///
class Desktop extends Breakpoint {
  @override
  double get minWidth => 1600;
  @override
  double get maxWidth => double.infinity;
}

///
sealed class Breakpoint {
  ///
  double get minWidth;

  ///
  double get maxWidth;

  /// Less than operator
  bool operator <(Breakpoint other) => maxWidth < other.maxWidth;

  /// Less than or equal operator
  bool operator <=(Breakpoint other) => maxWidth <= other.maxWidth;

  /// Greater than operator
  bool operator >(Breakpoint other) => maxWidth > other.maxWidth;

  /// Greater than or equal operator
  bool operator >=(Breakpoint other) => maxWidth >= other.maxWidth;

  /// The mobile breakpoint
  static Mobile get mobile => Mobile();

  /// The tablet breakpoint
  static Tablet get tablet => Tablet();

  /// The tablet landscape breakpoint
  static TabletLandscape get tabletLandscape => TabletLandscape();

  /// The tablet landscape breakpoint
  static Laptop get laptop => Laptop();

  /// The desktop breakpoint
  static Desktop get desktop => Desktop();

  ///
  bool get isMobile => this is Mobile;

  ///
  bool get isTablet => this is Tablet;

  ///
  bool get isTabletLandscape => this is TabletLandscape;

  ///
  bool get isLaptop => this is Laptop;

  ///
  bool get isDesktop => this is Desktop;

  /// Get all breakpoint values as a list
  static List<Breakpoint> get values => [
        mobile,
        tablet,
        tabletLandscape,
        laptop,
        desktop,
      ];

  ///
  static Breakpoint current([BuildContext? context]) {
    final width = context?.mediaQuery.size.width ?? _screenSize().width;

    return values.firstWhereOrNull(
          (breakpoint) =>
              width >= breakpoint.minWidth && width <= breakpoint.maxWidth,
        ) ??
        Breakpoint.mobile;
  }

  ///
  static T when<T>(
    T defaultValue, {
    T? mobile,
    T? tablet,
    T? tabletLandscape,
    T? laptop,
    T? desktop,
  }) {
    final mobileBreakpoint = mobile ?? defaultValue;
    final tabletBreakpoint = tablet ?? mobileBreakpoint;
    final tabletLandscapeBreakpoint = tabletLandscape ?? tabletBreakpoint;
    final laptopBreakpoint = laptop ?? tabletLandscapeBreakpoint;
    final desktopBreakpoint = desktop ?? laptopBreakpoint;
    switch (current()) {
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
    }
  }
}

Size _screenSize() {
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  return Size(
    view.physicalSize.width / view.devicePixelRatio,
    view.physicalSize.height / view.devicePixelRatio,
  );
}
