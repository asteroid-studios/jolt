import 'package:example_new/utils/macros/route_macro.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/settingss')
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usingSystem = ThemeProvider.of(context)?.usingSystemTheme ?? false;
    final isDark = context.theme.isDark;
    final isLight = context.theme.isLight;
    // return SingleChildScrollView();
    return Scaffold(
      topBar: TempAppBar(title: 'Settings', showBack: false),
      builder: (context) => ScrollArea.fill(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: Spacing.md,
            right: Spacing.md,
            bottom: Spacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Theme', style: Fonts.heading.sm),
              Gap.md(),
              Row(
                children: [
                  Card(
                    expanded: true,
                    active: isLight && !usingSystem,
                    onTap: () => ThemeProvider.of(context)?.setTheme(themes.first),
                    child: Column(
                      children: [
                        Text('Light', style: Fonts.body),
                        const Gap.sm(),
                        IconsDuotone.sun.icon,
                      ],
                    ),
                  ),
                  Card(
                    expanded: true,
                    active: isDark && !usingSystem,
                    onTap: () => ThemeProvider.of(context)?.setTheme(themes.firstWhere((t) => t.isDark)),
                    child: Column(
                      children: [
                        Text('Dark', style: Fonts.body),
                        const Gap.sm(),
                        IconsDuotone.moon.icon,
                      ],
                    ),
                  ),
                  Card(
                    expanded: true,
                    active: ThemeProvider.of(context)?.usingSystemTheme ?? false,
                    onTap: () => ThemeProvider.of(context)?.setSystemTheme(),
                    child: Column(
                      children: [
                        Text('System', style: Fonts.body),
                        const Gap.sm(),
                        IconsDuotone.deviceMobile.icon,
                      ],
                    ),
                  ),
                ].withExpanded().withSeparator(const Gap.sm()),
              ),
              Divider(),
              Text('Color', style: Fonts.heading.sm),
              Gap.md(),
              OverflowPadding(
                padding: EdgeInsets.symmetric(horizontal: -Spacing.md),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // TODO replace with toggle group
                  child: Row(
                    children: [
                      const Gap.md(),
                      ...[
                        Button(color: Colors.tailwind.violet, onTap: () {}, size: 22),
                        Button(color: Colors.tailwind.rose, onTap: () {}),
                        Button(color: Colors.tailwind.emerald, onTap: () {}),
                        Button(color: Colors.tailwind.amber, onTap: () {}),
                        Button(color: Colors.tailwind.sky, onTap: () {}),
                        Button(color: Colors.tailwind.orange, onTap: () {}),
                        Button(color: Colors.tailwind.stone, onTap: () {}),
                        Button(color: Colors.tailwind.slate, onTap: () {}),
                        Button(color: Colors.tailwind.green, onTap: () {}),
                        Button(color: Colors.tailwind.red, onTap: () {}),
                      ].withSeparator(const Gap.sm()),
                      const Gap.md(),
                    ],
                  ),
                ),
              ),
              Divider(),
              Text('Language', style: Fonts.heading.sm),
              Gap.md(),
              // TODO replace with Select
              Button(
                expanded: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: TextDirection.rtl,
                icon: IconsFill.caretDown.icon,
                label: 'English'.text,
                onTap: () {},
              ),
              Divider(),
              Text('UI Scale', style: Fonts.heading.sm),
              Gap.md(),
              // TODO replace with Select
              Button(
                expanded: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: TextDirection.rtl,
                icon: IconsFill.caretDown.icon,
                label: '1'.text,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
