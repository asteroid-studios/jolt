import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

/// Test
@Style()
class IconStyle {
  ///
  final double? size;

  /// Test
  final Color? color;

  /// Default style for all surfaces
  static IconStyle defaultStyle(BuildContext context, Icon icon) {
    return IconStyle(
      size: 10,
    );
  }
}
