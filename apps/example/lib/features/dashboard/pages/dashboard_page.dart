import 'dart:ui';

import 'package:ui/ui.dart';

import 'package:example/utils/router/router.dart';
import 'package:example/utils/translation/app_translations.dart';
import 'package:example/utils/translation/locales.dart';

///
@RoutePage()
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
      title: context.translations.dashboard.title,
      content: Padding(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: context.spacing.section,
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
                      //   mobile: context.spacing.md,
                      //   tablet: context.spacing.xxxl,
                      // ),
                      padding: EdgeInsets.all(context.spacing.xxxl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.translations.dashboard.hero,
                            style: context.style.heroLarge,
                          ),
                          spacer,
                          Text(
                            context.translations.dashboard.hero,
                            style: context.style.hero,
                          ),
                          spacer,
                          Text(
                            context.translations.dashboard.hero,
                            style: context.style.heroSmall,
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
                            'Label Large',
                            style: context.style.labelLarge,
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
              spacing: context.spacing.md,
              runSpacing: context.spacing.md,
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
                    final result = await JoltOverlay.show(
                      position: Alignment.topCenter,
                      child: Button(
                        onTap: () async {
                          final result = await JoltOverlay.show(
                            // zindex: -1,
                            position: Alignment.bottomCenter,
                            child: Button(
                              onTap: () async {
                                JoltOverlay.pop('Test');
                              },
                              label: 'Nested Button',
                            ),
                          );
                          JoltOverlay.pop(result);
                        },
                        label: 'Test',
                      ),
                    );
                    print(result);
                    // final test = [].elementAt(10);
                  },
                  icon: Icons.gear,
                  label: 'Button',
                ),
                Button(
                  onTap: () async {
                    await Future<void>.delayed(
                      const Duration(milliseconds: 300),
                    );
                    JoltOverlay.show(
                      // barrierOpacity: 0.5,
                      // barrierColor: context.color.primary,
                      child: TestDialog(),
                    );
                  },
                  onLongPressed: () {
                    print('long pressed from dashboard');
                  },
                  tooltip: 'Open Settings',
                  icon: Icons.gear,
                ),
                Button(
                  onTap: () {
                    context.overlay.show(
                      useRootOverlayStack: false,
                      // barrierDisabled: true,
                      child: TestPanel(),
                    );
                  },
                  label: 'Align',
                ),
                Button(
                  icon: Icons.gear,
                  label: 'Button Disabled',
                ),
                Button(
                  onTap: () async {
                    await Future<void>.delayed(
                      const Duration(seconds: 4),
                    );
                  },
                  label: 'Button Primary',
                  icon: Icons.gear,
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
            Text(
              'Translation',
              style: context.style.heading,
            ),
            Wrap(
              children: [
                Button(
                  onTap: () {
                    context.jolt.setLocale(Locales.fr);
                  },
                  label: 'English',
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

class TestDialog extends StatelessWidget {
  const TestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Surface(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Icon(
              IconsBold.gear,
              size: context.style.hero.fontSize,
              color: context.color.surface.s300,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: context.style.heading,
                ),
                const Spacing.xs(),
                Text(
                  'Settings',
                ),
                const Spacing.md(),
                Row(
                  children: [
                    Button(
                      label: 'Cancel',
                      onTap: () {
                        context.overlay.pop();
                      },
                      // background: context.color.surface.s300,
                    ),
                    const Spacing.md(),
                    Button(
                      label: 'Ok',
                      background: context.color.primary,
                      onTap: () {
                        context.overlay.pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TestPanel extends StatelessWidget {
  const TestPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Surface(
        // margin: EdgeInsets.only(
        //   // right: context.spacing.xxxl * 2,
        //   top: context.spacing.lg,
        //   bottom: context.spacing.lg,
        // ),
        padding: EdgeInsets.all(context.spacing.xxl),
        borderRadius: context.borderRadius.zero,
        background: context.color.background,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My panel',
              style: context.style.heading,
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: [
                Button(
                  // background: context.color.surface.s300,
                  icon: IconsDuotone.floppyDisk,
                  onTap: () {
                    JoltOverlay.show(child: TestDialog());
                  },
                ),
                Spacing.md(),
                Button(
                  // background: context.color.surface.s300,
                  icon: Icons.x,
                  onTap: () {
                    context.overlay.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
