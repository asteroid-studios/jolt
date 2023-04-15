import 'package:jolt/jolt.dart';

/// The main app widget.
class App extends StatelessWidget {
  /// The main app widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JoltApp(
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.jolt.setTheme(ThemeMode.light);
                },
                child: Text('Light'),
              ),
              GestureDetector(
                onTap: () {
                  context.jolt.setTheme(ThemeMode.dark);
                },
                child: Text('Dark'),
              ),
              GestureDetector(
                onTap: () {
                  context.jolt.setTheme(ThemeMode.system);
                },
                child: Text('System'),
              ),
            ],
          );
        },
      ),
    );
  }
}
