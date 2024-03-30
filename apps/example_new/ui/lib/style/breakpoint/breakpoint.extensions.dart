part of 'breakpoint.dart';

///
extension BreakpointX<T> on T {
  ///
  T responsive(
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
    switch (Breakpoint.current()) {
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

///
extension BreakpointContentX<T> on BuildContext {
  ///
  Breakpoint get breakpoint => Breakpoint.current(this);

  ///
  T responsive(
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
    switch (Breakpoint.current(this)) {
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
