import 'package:jolt/jolt.dart';

///
extension ThemeContextX on BuildContext {
  /// Returns the current theme data.
  Theme get theme => Theme.of(this);
}
