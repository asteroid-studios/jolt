import 'package:ui/ui.dart';

///
extension ThemesX on BuildContext {
  ///
  Theme get theme => Theme.of(this);

  ///
  ColorScheme get color => theme.colorScheme;
}
