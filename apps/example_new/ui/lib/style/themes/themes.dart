import 'package:ui/ui.dart';
export 'theme.dart';

part 'extensions.dart';

///
class DefaultThemeLight extends Theme {
  @override
  String get id => 'default_light';

  @override
  Brightness get brightness => Brightness.light;

  @override
  ColorScheme get colorScheme => ColorScheme.light();
}

///
class DefaultThemeDark extends Theme {
  @override
  String get id => 'default_dark';

  @override
  Brightness get brightness => Brightness.dark;

  @override
  ColorScheme get colorScheme => ColorScheme.dark();
}
