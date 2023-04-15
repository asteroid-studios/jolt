import 'package:jolt/jolt.dart';

import 'package:example/theme/themes.dart';

/// The main app widget.
class App extends StatelessWidget {
  /// The main app widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JoltApp(
      themes: themes,
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
