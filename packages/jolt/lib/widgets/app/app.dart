import 'package:jolt/jolt.dart';

class JoltApp extends StatefulWidget {
  const JoltApp({
    required this.home,
    required this.themes,
    super.key,
  });

  final Widget home;
  final List<BaseTheme> themes;

  @override
  State<JoltApp> createState() => _JoltAppState();
}

class _JoltAppState extends State<JoltApp> {
  late BaseTheme theme;

  @override
  void initState() {
    theme = widget.themes.first;
    super.initState();
  }

  // Recursively rebuild all child elements when the theme changes.
  void _rebuildChildren(Element el) {
    el
      ..markNeedsBuild()
      ..visitChildren(_rebuildChildren);
  }

  void setTheme(BaseTheme newTheme) {
    theme = newTheme;
    (context as Element).visitChildren(_rebuildChildren);
  }

  @override
  Widget build(BuildContext context) {
    return widget.home;
  }
}
