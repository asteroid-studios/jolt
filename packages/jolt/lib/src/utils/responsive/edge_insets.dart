import 'package:jolt/jolt.dart';

///
class EdgeInsetsResponsive extends EdgeInsets {
  ///
  EdgeInsetsResponsive(
    this.context, {
    this.mobile = EdgeInsets.zero,
    this.tablet,
    this.tabletLandscape,
    this.desktop,
    this.tv,
  }) : super.only(
          left: mobile.left,
          top: mobile.top,
          right: mobile.right,
          bottom: mobile.bottom,
        );

  // Override all the getters to return the current insets
  @override
  double get top => _currentInsets().top;
  @override
  double get right => _currentInsets().right;
  @override
  double get left => _currentInsets().left;
  @override
  double get bottom => _currentInsets().bottom;

  /// The current [BuildContext]
  final BuildContext context;

  /// The insets for mobile
  final EdgeInsets mobile;

  /// The insets for tablet
  final EdgeInsets? tablet;

  /// The insets for tablet landscape
  final EdgeInsets? tabletLandscape;

  /// The insets for desktop
  final EdgeInsets? desktop;

  /// The insets for tv
  final EdgeInsets? tv;

  EdgeInsets _currentInsets() {
    final size = context.mediaQuery.size.shortestSide;
    if (size < 450) {
      return mobile;
    }
    return tablet ?? mobile;
  }
}
