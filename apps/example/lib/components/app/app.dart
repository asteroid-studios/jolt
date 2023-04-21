import 'dart:ui';

import 'package:jolt/jolt.dart';

import 'package:example/theme/themes.dart';
import 'package:example/theme/typography.dart';
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
                  spacer,
                  JoltText(
                    'Jolt',
                    style: context.style.displaySmall,
                  ),
                  spacer,
                  ClipRect(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: context.sizing.section,
                      ),
                      width: double.infinity,
                      child: Center(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      ...Colors.violet.shades
                                          .getRange(begin, end),
                                      ...Colors.red.shades.getRange(begin, end),
                                      ...Colors.violet.shades
                                          .getRange(begin, end),
                                      ...Colors.sky.shades.getRange(begin, end),
                                      ...Colors.violet.shades
                                          .getRange(begin, end),
                                      ...Colors.red.shades.getRange(begin, end),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: blur,
                                  sigmaY: blur,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: context.borderRadius.lg,
                                    color: context.color.background.withOpacity(
                                      context.color.brightness ==
                                              Brightness.dark
                                          ? 0.8
                                          : 0.6,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              // padding: EdgeInsetsResponsive(
                              //   context,
                              //   mobile: context.sizing.md,
                              //   tablet: context.sizing.xxxl,
                              // ),
                              padding: EdgeInsets.all(context.sizing.xxxl),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JoltText(
                                    'Build your next idea\neven faster.',
                                    style: context.style.displayLarge
                                        .withSize(75)
                                        .copyWith(
                                          letterSpacing: -2,
                                        ),
                                  ),
                                  spacer,
                                  JoltText(
                                    'Display large',
                                    style: context.style.displayLarge,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Display',
                                    style: context.style.display,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Display small',
                                    style: context.style.displaySmall,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Heading large',
                                    style: context.style.headingLarge,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Heading',
                                    style: context.style.heading,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Heading small',
                                    style: context.style.headingSmall,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Body large',
                                    style: context.style.bodyLarge,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Body',
                                    style: context.style.body,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Body small',
                                    style: context.style.bodySmall,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Label',
                                    style: context.style.label,
                                  ),
                                  spacer,
                                  JoltText(
                                    'Label small',
                                    style: context.style.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacing.section(),
                  Text(
                    'Theme',
                    style: context.style.heading,
                  ),
                  const Spacing.lg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Surface.focusable(
                        onPressed: () {
                          context.jolt.setTheme(
                            ThemeMode.light,
                            withHighContrast: false,
                          );
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sizing.sm,
                          vertical: context.sizing.xs,
                        ),
                        background: context.jolt.themeMode == ThemeMode.light &&
                                !context.color.highContrast
                            ? context.color.primary
                            : null,
                        borderRadius: context.borderRadius.sm,
                        builder: (context, state) {
                          return JoltText(
                            'Light',
                            style: context.style.button,
                            color: context.jolt.themeMode == ThemeMode.light &&
                                    !context.color.highContrast
                                ? context.color.primary.highlight
                                : null,
                          );
                        },
                      ),
                      spacer,
                      Surface.focusable(
                        onPressed: () {
                          context.jolt.setTheme(
                            ThemeMode.light,
                            withHighContrast: true,
                          );
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sizing.sm,
                          vertical: context.sizing.xs,
                        ),
                        background: context.jolt.themeMode == ThemeMode.light &&
                                context.color.highContrast
                            ? context.color.primary
                            : null,
                        borderRadius: context.borderRadius.sm,
                        builder: (context, state) {
                          return JoltText(
                            'Light high contrast',
                            style: context.style.button,
                            color: context.jolt.themeMode == ThemeMode.light &&
                                    context.color.highContrast
                                ? context.color.primary.highlight
                                : null,
                          );
                        },
                      ),
                      spacer,
                      Surface.focusable(
                        onPressed: () {
                          context.jolt.setTheme(
                            ThemeMode.dark,
                            withHighContrast: false,
                          );
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sizing.sm,
                          vertical: context.sizing.xs,
                        ),
                        background: context.jolt.themeMode == ThemeMode.dark &&
                                !context.color.highContrast
                            ? context.color.primary
                            : null,
                        borderRadius: context.borderRadius.md,
                        builder: (context, state) {
                          return JoltText(
                            'Dark',
                            style: context.style.button,
                            color: context.jolt.themeMode == ThemeMode.dark &&
                                    !context.color.highContrast
                                ? context.color.primary.highlight
                                : null,
                          );
                        },
                      ),
                      spacer,
                      Surface.focusable(
                        onPressed: () {
                          context.jolt.setTheme(
                            ThemeMode.dark,
                            withHighContrast: true,
                          );
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sizing.lg,
                          vertical: context.sizing.xs,
                        ),
                        background: context.jolt.themeMode == ThemeMode.dark &&
                                context.color.highContrast
                            ? context.color.primary
                            : null,
                        borderRadius: context.borderRadius.lg,
                        builder: (context, state) {
                          return JoltText(
                            'Dark high contrast',
                            style: context.style.button,
                            color: context.jolt.themeMode == ThemeMode.dark &&
                                    context.color.highContrast
                                ? context.color.primary.highlight
                                : null,
                          );
                        },
                      ),
                      spacer,
                      Surface.focusable(
                        onPressed: () {
                          context.jolt.setTheme(ThemeMode.system);
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: context.sizing.lg,
                          vertical: context.sizing.xs,
                        ),
                        background: context.jolt.themeMode == ThemeMode.system
                            ? context.color.primary
                            : null,
                        borderRadius: context.borderRadius.lg,
                        builder: (context, state) {
                          return JoltText(
                            'System',
                            style: context.style.button,
                            color: context.jolt.themeMode == ThemeMode.system
                                ? context.color.primary.highlight
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacing.lg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.jolt.setPrimaryColor(Colors.emerald);
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.lg,
                          background: Colors.emerald,
                          padding: EdgeInsets.zero,
                          child: const Spacing.xl(),
                        ),
                      ),
                      spacer,
                      GestureDetector(
                        onTap: () {
                          context.jolt.setPrimaryColor(Colors.violet);
                        },
                        child: Surface(
                          borderRadius: context.borderRadius.lg,
                          background: Colors.violet,
                          padding: EdgeInsets.zero,
                          child: const Spacing.xl(),
                        ),
                      ),
                    ],
                  ),
                  const Spacing.section(),
                  Surface(
                    child: Surface(
                      borderColor: context.color.primary.s700,
                      background: context.color.primary,
                      child: JoltText(
                        'Surface',
                        style: context.style.body.copyWith(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: context.sizing.sm,
                      vertical: context.sizing.xs,
                    ),
                    builder: (_, __) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        JoltText(
                          'align',
                          style: context.style.button,
                        ),
                        const Spacing.sm(),
                        const Text(
                          'align',
                        ),
                      ],
                    ),
                  ),
                  const Spacing.section(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
