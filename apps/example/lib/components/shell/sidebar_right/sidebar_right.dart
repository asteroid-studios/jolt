import 'package:jolt/jolt.dart';

///
class SidebarRight extends StatelessWidget {
  ///
  const SidebarRight({super.key});

  @override
  Widget build(BuildContext context) {
    Button themeButton(
      PhosphorIconData icon,
      ThemeMode mode, {
      bool? withHighContrast,
    }) {
      final selected = context.jolt.themeMode == mode &&
          (withHighContrast == null ||
              context.jolt.highContrast == withHighContrast);
      return Button(
        phosphorIcon: icon,
        borderColor: selected ? context.color.primary : null,
        onTap: () => context.jolt.setTheme(
          mode,
          withHighContrast: withHighContrast,
        ),
      );
    }

    ///
    Button colorButton(JoltColor color) {
      final selected = context.color.primary == color;
      final borderColor = selected
          ? context.color.background.isDark
              ? color.lighten()
              : color.darken()
          : null;
      return Button(
        background: color,
        borderColor: borderColor,
        borderRadius: context.borderRadius.lg,
        onTap: () => context.jolt.setPrimaryColor(color),
      );
    }

    return Surface(
      borderColor: Colors.transparent,
      borderRadius: BorderRadius.zero,
      background: context.color.surface.withOpacity(0.2),
      child: Column(
        children: [
          const Spacing.xl(),
          themeButton(
            PhosphorIcons.duotone.cloudSun,
            ThemeMode.light,
            withHighContrast: false,
          ),
          const Spacing.sm(),
          themeButton(
            PhosphorIcons.duotone.sun,
            ThemeMode.light,
            withHighContrast: true,
          ),
          const Spacing.sm(),
          themeButton(
            PhosphorIcons.duotone.cloudMoon,
            ThemeMode.dark,
            withHighContrast: false,
          ),
          const Spacing.sm(),
          themeButton(
            PhosphorIcons.duotone.moon,
            ThemeMode.dark,
            withHighContrast: true,
          ),
          const Spacing.sm(),
          themeButton(
            PhosphorIcons.duotone.gearSix,
            ThemeMode.system,
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
