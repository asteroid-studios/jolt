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
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(context.spacing.xxxl),
                  child: JoltText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.jolt
                        .setTheme(ThemeMode.light, withHighContrast: false);
                  },
                  child: Container(
                    color: context.color.surface,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    child: JoltText('Light'),
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
                    child: JoltText('Dark'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.jolt
                        .setTheme(ThemeMode.dark, withHighContrast: true);
                  },
                  child: Container(
                    color: context.color.surface,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    child: JoltText('Dark high contrast'),
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
                    child: JoltText('System'),
                  ),
                ),
                Surface(
                  child: Surface(
                    borderColor: context.color.primary.s700,
                    background: context.color.primary,
                    child: JoltText(
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
                    // FocusManager.instance.primaryFocus?.unfocus();
                    context.jolt.setTextScaleFactorMultiplier(1);
                  },
                  builder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing.s,
                      vertical: context.spacing.xs,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        JoltText(
                          'Align',
                        ),
                        SizedBox(width: context.spacing.s),
                        Text(
                          'Align',
                        ),
                      ],
                    ),
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
            ),
          );
        },
      ),
    );
  }
}
