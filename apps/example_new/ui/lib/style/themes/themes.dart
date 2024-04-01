import 'package:ui/ui.dart';
export 'theme.dart';

///
final themes = <Theme>[
  DefaultThemeLight(),
  DefaultThemeDark(),
];

///
class DefaultThemeLight extends Theme {
  @override
  String get id => 'default_light';

  @override
  ColorScheme get colorScheme => ColorScheme.light();
}

///
class DefaultThemeDark extends Theme {
  @override
  String get id => 'default_dark';

  @override
  ColorScheme get colorScheme => ColorScheme.dark();
}
