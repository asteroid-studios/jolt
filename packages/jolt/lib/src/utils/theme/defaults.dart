import 'package:jolt/jolt.dart';

///
extension Defaults on BuildContext {
  ///
  DefaultMapping get defaults => DefaultMapping(this);
}

///
class DefaultMapping {
  ///
  const DefaultMapping(this.context);

  ///
  final BuildContext context;

  /// Default horizontal padding
  double get horizontalPadding => context.sizing.sm;

  /// Default vertical padding
  double get verticalPadding => context.sizing.xs;
}
