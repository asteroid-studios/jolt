import 'package:jolt/jolt.dart';

///
class SidebarRight extends StatelessWidget {
  ///
  const SidebarRight({super.key});

  @override
  Widget build(BuildContext context) {
    Button themeButton(
      IconData icon,
      ThemeMode mode,
      String tooltip, {
      bool? withHighContrast,
    }) {
      final selected = context.jolt.themeMode == mode &&
          (withHighContrast == null ||
              context.jolt.highContrast == withHighContrast);
      return Button(
        icon: icon,
        tooltip: tooltip,
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
        borderRadius: context.borderRadius.xl,
        onTap: () => context.jolt.setPrimaryColor(color),
      );
    }

    Button sizeButton(
      double sizeMultiplier,
      IconData icon,
    ) {
      final selected = context.scaling.textScale == sizeMultiplier;
      final defaultIconSize = context.widgetTheme.button.labelStyle?.fontSize ??
          context.style.body.fontSize ??
          16;
      return Button(
        icon: icon,
        borderColor: selected ? context.color.primary : null,
        iconSize: defaultIconSize * sizeMultiplier,
        onTap: () => context.jolt.setTextScaleFactorMultiplier(sizeMultiplier),
      );
    }

    Button spacingButton(
      double sizeMultiplier,
      IconData icon,
    ) {
      final selected = context.scaling.spacingScale == sizeMultiplier;
      final defaultIconSize = context.widgetTheme.button.labelStyle?.fontSize ??
          context.style.body.fontSize ??
          16;
      return Button(
        icon: icon,
        borderColor: selected ? context.color.primary : null,
        iconSize: defaultIconSize * sizeMultiplier,
        onTap: () =>
            context.jolt.setSpacingScaleFactorMultiplier(sizeMultiplier),
      );
    }

    return Surface(
      borderColor: Colors.transparent,
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.zero,
      background: context.color.surface.withOpacity(0.2),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(context.sizing.md),
                child: Column(
                  children: [
                    themeButton(
                      Icons.duotone.cloudSun,
                      ThemeMode.light,
                      'Use light theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.duotone.sun,
                      ThemeMode.light,
                      'Use light theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.duotone.cloudMoon,
                      ThemeMode.dark,
                      'Use dark theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.duotone.moon,
                      ThemeMode.dark,
                      'Use dark theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.duotone.gearSix,
                      ThemeMode.system,
                      'Use system theme',
                    ),
                    const Spacing.xxl(),
                    colorButton(
                      Colors.emerald,
                    ),
                    const Spacing.sm(),
                    colorButton(
                      Colors.violet,
                    ),
                    const Spacing.xxl(),
                    sizeButton(
                      0.8,
                      Icons.duotone.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1,
                      Icons.duotone.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1.2,
                      Icons.duotone.textT,
                    ),
                    const Spacing.xxl(),
                    spacingButton(
                      0.8,
                      Icons.duotone.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1,
                      Icons.duotone.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1.2,
                      Icons.duotone.alignCenterHorizontal,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
