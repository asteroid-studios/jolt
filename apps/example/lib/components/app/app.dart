import 'dart:ui';

import 'package:jolt/jolt.dart';

import 'package:example/theme/themes.dart';
import 'package:example/theme/widget_theme.dart';

/// The main app widget.
class App extends StatelessWidget {
  /// The main app widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const blur = 100.0;
    const begin = 3;
    const end = 8;
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
                  padding: EdgeInsets.all(context.sizing.xxxl),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                ...Colors.violet.shades.getRange(begin, end),
                                ...Colors.red.shades.getRange(begin, end),
                                ...Colors.violet.shades.getRange(begin, end),
                                ...Colors.sky.shades.getRange(begin, end),
                                ...Colors.violet.shades.getRange(begin, end),
                                ...Colors.red.shades.getRange(begin, end),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: context.borderRadius.l,
                              color: context.color.background.withOpacity(
                                context.color.brightness == Brightness.dark
                                    ? 0.8
                                    : 0.6,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.sizing.xxxl),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JoltText(
                              "Build your next idea\neven faster.",
                              style: context.textStyle.displayLarge
                                  .size(75)
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2,
                                  ),
                            ),
                            JoltText(
                              "Display large",
                              style: context.textStyle.displayLarge,
                            ),
                            const Spacing.sm(),
                            JoltText(
                              "Display",
                              style: context.textStyle.display,
                            ),
                            JoltText(
                              "Display small",
                              style: context.textStyle.displaySmall,
                            ),
                            JoltText(
                              "Heading large",
                              style: context.textStyle.headingLarge,
                            ),
                            JoltText(
                              "Heading",
                              style: context.textStyle.heading,
                            ),
                            JoltText(
                              "Heading small",
                              style: context.textStyle.headingSmall,
                            ),
                            JoltText(
                              "Body large",
                              style: context.textStyle.bodyLarge,
                            ),
                            JoltText(
                              "Body",
                              style: context.textStyle.body,
                            ),
                            JoltText(
                              "Body small",
                              style: context.textStyle.bodySmall,
                            ),
                            JoltText(
                              "Label",
                              style: context.textStyle.label,
                            ),
                            JoltText(
                              "Label small",
                              style: context.textStyle.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
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
                SizedBox(height: context.sizing.sm),
                Surface.focusable(
                  onPressed: () {
                    // dismiss focus
                    // FocusManager.instance.primaryFocus?.unfocus();
                    context.jolt.setSpacingScaleFactorMultiplier(1);
                    context.jolt.setTextScaleFactorMultiplier(1);
                  },
                  builder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.sizing.sm,
                      vertical: context.sizing.xs,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        JoltText(
                          'align',
                        ),
                        SizedBox(width: context.sizing.sm),
                        Text(
                          'align',
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
