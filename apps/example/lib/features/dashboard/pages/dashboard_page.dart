import 'dart:ui';

import 'package:jolt/jolt.dart';

import 'package:example/theming/typography.dart';

///
class DashboardPage extends StatefulWidget {
  ///
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool loaded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      setState(() {
        loaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const blur = 100.0;
    const begin = 3;
    const end = 8;
    const spacer = Spacing.sm();
    return Scaffold(
      title: 'Dashboard',
      // content: Text('Test'),
      content: Padding(
        padding: EdgeInsets.all(context.sizing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: context.sizing.section,
              ),
              width: double.infinity,
              child: Center(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: loaded
                            ? Container(
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
                              )
                            : const SizedBox.shrink(),
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
                            borderRadius: context.borderRadius.xl,
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
                      // padding: EdgeInsetsResponsive(
                      //   context,
                      //   mobile: context.sizing.md,
                      //   tablet: context.sizing.xxxl,
                      // ),
                      padding: EdgeInsets.all(context.sizing.xxxl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Build your next idea\neven faster.',
                            style: context.style.hero,
                          ),
                          spacer,
                          Text(
                            'Display large',
                            style: context.style.displayLarge,
                          ),
                          spacer,
                          Text(
                            'Display',
                            style: context.style.display,
                          ),
                          spacer,
                          Text(
                            'Display small',
                            style: context.style.displaySmall,
                          ),
                          spacer,
                          Text(
                            'Heading large',
                            style: context.style.headingLarge,
                          ),
                          spacer,
                          Text(
                            'Heading',
                            style: context.style.heading,
                          ),
                          spacer,
                          Text(
                            'Heading small',
                            style: context.style.headingSmall,
                          ),
                          spacer,
                          Text(
                            'Body large',
                            style: context.style.bodyLarge,
                          ),
                          spacer,
                          Text(
                            'Body',
                            style: context.style.body,
                          ),
                          spacer,
                          Text(
                            'Body small',
                            style: context.style.bodySmall,
                          ),
                          spacer,
                          Text(
                            'Label',
                            style: context.style.label,
                          ),
                          spacer,
                          Text(
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
            const Spacing.section(),
            Text(
              'Widgets',
              style: context.style.heading,
            ),
            const Spacing.lg(),
            Wrap(
              spacing: context.sizing.md,
              runSpacing: context.sizing.md,
              children: [
                Surface(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card title',
                        style: context.style.headingSmall,
                      ),
                      Text(
                        'Card body',
                      ),
                    ],
                  ),
                ),
                Button(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(seconds: 4),
                    );
                  },
                  icon: Icons.regular.gear,
                  label: 'Button',
                ),
                Button(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(seconds: 4),
                    );
                  },
                  onLongPressed: () {
                    print('long pressed from dashboard');
                  },
                  tooltip: 'Open Settings',
                  icon: Icons.regular.gear,
                ),
                Button(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(seconds: 4),
                    );
                  },
                  label: 'Align',
                ),
                Button(
                  icon: Icons.regular.gear,
                  label: 'Button Disabled',
                ),
                Button(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(seconds: 4),
                    );
                  },
                  label: 'Button Primary',
                  icon: Icons.regular.gear,
                  background: context.color.primary,
                ),
              ],
            ),
            const Spacing.section(),
            Text(
              'Theme',
              style: context.style.heading,
            ),
            const Spacing.lg(),
            Wrap(
              spacing: context.sizing.md,
              runSpacing: context.sizing.md,
              children: [
                Surface.focusable(
                  onTap: () {
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
                    return Text(
                      'Light',
                      style: context.style.button,
                      color: context.jolt.themeMode == ThemeMode.light &&
                              !context.color.highContrast
                          ? context.color.primary.highlight
                          : null,
                    );
                  },
                ),
                Surface.focusable(
                  onTap: () {
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
                    return Text(
                      'Light high contrast',
                      style: context.style.button,
                      color: context.jolt.themeMode == ThemeMode.light &&
                              context.color.highContrast
                          ? context.color.primary.highlight
                          : null,
                    );
                  },
                ),
                Surface.focusable(
                  onTap: () {
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
                    return Text(
                      'Dark',
                      style: context.style.button,
                      color: context.jolt.themeMode == ThemeMode.dark &&
                              !context.color.highContrast
                          ? context.color.primary.highlight
                          : null,
                    );
                  },
                ),
                Surface.focusable(
                  onTap: () {
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
                    return Text(
                      'Dark high contrast',
                      style: context.style.button,
                      color: context.jolt.themeMode == ThemeMode.dark &&
                              context.color.highContrast
                          ? context.color.primary.highlight
                          : null,
                    );
                  },
                ),
                Surface.focusable(
                  onTap: () {
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
                    return Text(
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
          ],
        ),
      ),
    );
  }
}
