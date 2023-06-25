import 'package:jolt/jolt.dart';

///
extension WidgetThemeContextX on BuildContext {
  /// Returns the current widget theme data.
  WidgetTheme get widgetTheme => DefaultWidgetTheme.of(this);
}
