import 'package:jolt/jolt.dart';

import 'package:example/theme/themes.dart';
import 'package:example/theme/widget_theme.dart';

/// The main app widget.
class App extends StatelessWidget {
  /// The main app widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JoltApp(
      themes: themes,
      widgetTheme: widgetTheme,
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.jolt
                      .setTheme(ThemeMode.light, withHighContrast: false);
                },
                child: Container(
                  color: context.color.surface,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Text('Light'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.jolt
                      .setTheme(ThemeMode.dark, withHighContrast: false);
                },
                child: Container(
                  color: context.color.surface,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Text('Dark'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.jolt.setTheme(ThemeMode.dark, withHighContrast: true);
                },
                child: Container(
                  color: context.color.surface,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Text('Dark high contrast'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.jolt.setTheme(ThemeMode.system);
                },
                child: Container(
                  color: context.color.primary,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Text('System'),
                ),
              ),
              Surface(
                child: Surface(
                  // TODO handle automatic nested surfaces?
                  borderColor: context.color.primary.s700,
                  background: context.color.primary,
                  child: Text(
                    'Surface',
                    style: context.textStyle.body.copyWith(
                      color: context.color.primary.highlight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.spacing.s),
              Surface.focusable(
                onPressed: () {
                  // dismiss focus
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                builder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing.s,
                    vertical: context.spacing.xs,
                  ),
                  child: Text('Surface'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.jolt.setPrimaryColor(Colors.emerald);
                    },
                    child: Container(
                      color: Colors.emerald,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.jolt.setPrimaryColor(Colors.violet);
                    },
                    child: Container(
                      color: Colors.violet,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
