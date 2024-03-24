part of 'colors.dart';

///
extension ColorX on Color {
  ///
  Color dark(Color color) {
    return ThemeProvider.theme.isDark ? color : this;
  }
}
