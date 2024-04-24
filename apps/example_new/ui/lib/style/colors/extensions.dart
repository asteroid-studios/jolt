import 'package:ui/ui.dart';

///
extension ColorX on Color {
  ///
  Color dark(Color color) {
    return Colors.isDark ? color : this;
  }
}
