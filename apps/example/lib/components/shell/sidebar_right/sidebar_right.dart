import 'package:jolt/jolt.dart';

///
class SidebarRight extends StatelessWidget {
  ///
  const SidebarRight({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    Button colorButton(JoltColor color) {
      final selected = context.color.primary == color;
      final borderColor = selected
          ? context.color.background.isDark
              ? color.lighten(20)
              : color.darken(20)
          : null;
      return Button(
        phosphorIcon: PhosphorIcons.regular.dot,
        color: color,
        background: color,
        borderWidth: 3,
        borderColor: borderColor,
        onTap: () => context.jolt.setPrimaryColor(color),
      );
    }

    return Surface(
      background: context.color.surface.withOpacity(0.2),
      // width: 80,
      child: Column(
        children: [
          const Spacing.xl(),
          Button(
            phosphorIcon: PhosphorIcons.duotone.cloudSun,
            onTap: () => context.jolt.setTheme(
              ThemeMode.light,
              withHighContrast: false,
            ),
          ),
          const Spacing.sm(),
          Button(
            phosphorIcon: PhosphorIcons.duotone.sun,
            onTap: () => context.jolt.setTheme(
              ThemeMode.light,
              withHighContrast: true,
            ),
          ),
          const Spacing.sm(),
          Button(
            phosphorIcon: PhosphorIcons.duotone.cloudMoon,
            onTap: () => context.jolt.setTheme(
              ThemeMode.dark,
              withHighContrast: false,
            ),
          ),
          const Spacing.sm(),
          Button(
            phosphorIcon: PhosphorIcons.duotone.moon,
            onTap: () => context.jolt.setTheme(
              ThemeMode.dark,
              withHighContrast: true,
            ),
          ),
          const Spacing.sm(),
          Button(
            phosphorIcon: PhosphorIcons.duotone.gearSix,
            onTap: () => context.jolt.setTheme(
              ThemeMode.system,
            ),
          ),
          const Spacing.xxl(),
          colorButton(Colors.emerald),
          const Spacing.sm(),
          colorButton(Colors.violet),
        ],
      ),
    );
  }
}
