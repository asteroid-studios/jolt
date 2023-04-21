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
    const spacer = Spacing.sm();
    return JoltApp(
      themes: themes,
      widgetTheme: widgetTheme,
      child: Builder(
        builder: (context) {
          return SelectionArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacing.section(),
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
                            filter:
                                ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: context.borderRadius.lg,
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
                              spacer,
                              JoltText(
                                "Display large",
                                style: context.textStyle.displayLarge,
                              ),
                              spacer,
                              JoltText(
                                "Display",
                                style: context.textStyle.display,
                              ),
                              spacer,
                              JoltText(
                                "Display small",
                                style: context.textStyle.displaySmall,
                              ),
                              spacer,
                              JoltText(
                                "Heading large",
                                style: context.textStyle.headingLarge,
                              ),
                              spacer,
                              JoltText(
                                "Heading",
                                style: context.textStyle.heading,
                              ),
                              spacer,
                              JoltText(
                                "Heading small",
                                style: context.textStyle.headingSmall,
                              ),
                              spacer,
                              JoltText(
                                "Body large",
                                style: context.textStyle.bodyLarge,
                              ),
                              spacer,
                              JoltText(
                                "Body",
                                style: context.textStyle.body,
                              ),
                              spacer,
                              JoltText(
                                "Body small",
                                style: context.textStyle.bodySmall,
                              ),
                              spacer,
                              JoltText(
                                "Label",
                                style: context.textStyle.label,
                              ),
                              spacer,
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
                  const Spacing.section(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.jolt.setTheme(
                            ThemeMode.light,
                            withHighContrast: false,
                          );
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.sm,
                          child: JoltText(
                            'Light',
                            color: context.color.surface.highlight,
                          ),
                        ),
                      ),
                      spacer,
                      GestureDetector(
                        onTap: () {
                          context.jolt.setTheme(
                            ThemeMode.light,
                            withHighContrast: true,
                          );
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.sm,
                          child: JoltText(
                            'Light high contrast',
                            color: context.color.surface.highlight,
                          ),
                        ),
                      ),
                      spacer,
                      GestureDetector(
                        onTap: () {
                          context.jolt.setTheme(
                            ThemeMode.dark,
                            withHighContrast: false,
                          );
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.md,
                          child: JoltText(
                            'Dark',
                            color: context.color.surface.highlight,
                          ),
                        ),
                      ),
                      spacer,
                      GestureDetector(
                        onTap: () {
                          context.jolt.setTheme(
                            ThemeMode.dark,
                            withHighContrast: true,
                          );
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.lg,
                          child: JoltText(
                            'Dark high contrast',
                            color: context.color.surface.highlight,
                          ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
