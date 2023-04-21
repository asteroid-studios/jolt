import 'package:jolt/jolt.dart';

///
class EdgeInsetsResponsive extends EdgeInsets {
  // TODO allow passing different values for different screen sizes
  // TODO make sure I really think about responsiveness options eg mobile etc

  ///
  EdgeInsetsResponsive(
    BuildContext context, {
    double mobile = 0,
    double? tablet,
  }) : super.all(
          _getSpacing(
            context,
            mobile,
            tablet,
          ),
        );

  ///
  EdgeInsetsResponsive.fromInsets(
    BuildContext context, {
    EdgeInsets mobile = EdgeInsets.zero,
    EdgeInsets? tablet,
  }) : super.only(
          left: _getSpacingFromInsets(
            context,
            _Direction.left,
            mobile,
            tablet,
          ),
          top: _getSpacingFromInsets(
            context,
            _Direction.top,
            mobile,
            tablet,
          ),
          right: _getSpacingFromInsets(
            context,
            _Direction.right,
            mobile,
            tablet,
          ),
          bottom: _getSpacingFromInsets(
            context,
            _Direction.bottom,
            mobile,
            tablet,
          ),
        );
}

double _getSpacing(
  BuildContext context, [
  double? mobile,
  double? tablet,
]) {
  // TODO switch based on current breakpoint
  switch (context.jolt.themeMode) {
    case ThemeMode.light:
      return mobile ?? 0;
    case ThemeMode.dark:
      return 100;
    // return mobile ?? 0;
    case ThemeMode.system:
      return 150;
    // return mobile ?? 0;
  }
}

enum _Direction { left, top, right, bottom }

double _getSpacingFromInsets(
  BuildContext context,
  _Direction direction, [
  EdgeInsets? mobile,
  EdgeInsets? tablet,
]) {
  late EdgeInsets effectiveInsets;
  // TODO switch based on current breakpoint
  switch (context.jolt.themeMode) {
    case ThemeMode.light:
      effectiveInsets = mobile ?? EdgeInsets.zero;
      break;
    case ThemeMode.dark:
      effectiveInsets = tablet ?? EdgeInsets.zero;
      break;
    case ThemeMode.system:
      effectiveInsets = mobile ?? EdgeInsets.zero;
      break;
  }
  return _getSpacingFromDirection(
    direction,
    effectiveInsets,
  );
}

double _getSpacingFromDirection(
  _Direction direction,
  EdgeInsets insets,
) {
  switch (direction) {
    case _Direction.left:
      return insets.left;
    case _Direction.top:
      return insets.top;
    case _Direction.right:
      return insets.right;
    case _Direction.bottom:
      return insets.bottom;
  }
}
