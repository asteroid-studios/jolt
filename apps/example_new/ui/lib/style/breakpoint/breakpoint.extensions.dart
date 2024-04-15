import 'package:ui/ui.dart';

///
extension BreakpointX on Breakpoint {
  ///
  T when<T>(
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
    switch (this) {
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
extension BreakpointXT<T> on T {
  ///
  T responsive({
    T? mobile,
    T? tablet,
    T? tabletLandscape,
    T? laptop,
    T? desktop,
  }) =>
      Breakpoint.current().when(
        this,
        mobile: mobile,
        tablet: tablet,
        tabletLandscape: tabletLandscape,
        laptop: laptop,
        desktop: desktop,
      );
}

///
extension BreakpointContentX on BuildContext {
  ///
  Breakpoint get breakpoint => Breakpoint.current(this);

  ///
  T responsive<T>(
    T defaultValue, {
    T? mobile,
    T? tablet,
    T? tabletLandscape,
    T? laptop,
    T? desktop,
  }) =>
      breakpoint.when(
        defaultValue,
        mobile: mobile,
        tablet: tablet,
        tabletLandscape: tabletLandscape,
        laptop: laptop,
        desktop: desktop,
      );
}
