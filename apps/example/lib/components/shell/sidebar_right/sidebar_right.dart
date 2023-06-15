import 'package:ui/ui.dart';

///
class SideBarRight extends StatelessWidget {
  ///
  const SideBarRight({super.key});

  @override
  Widget build(BuildContext context) {
    Button themeButton(
      IconData icon,
      ThemeMode mode,
      String tooltip, {
      bool? withHighContrast,
    }) {
      final selected = context.jolt.value.themeMode == mode &&
          (withHighContrast == null ||
              context.jolt.value.highContrast == withHighContrast);
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

    Button localeButton(
      Locale locale,
    ) {
      final selected = context.jolt.value.locale == locale;
      return Button(
        padding: EdgeInsets.all(context.sizing.xs),
        icon: IconsDuotone.translate,
        iconSize: context.style.body.fontSize,
        label: locale.languageCode.characters.first,
        labelStyle: context.style.button.copyWith(
          fontSize: context.style.label.fontSize,
        ),
        verticalButton: true,
        background: selected ? context.color.primary : null,
        onTap: () => context.jolt.setLocale(locale),
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
                      IconsDuotone.cloudSun,
                      ThemeMode.light,
                      'Use light theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      IconsDuotone.sun,
                      ThemeMode.light,
                      'Use light theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      IconsDuotone.cloudMoon,
                      ThemeMode.dark,
                      'Use dark theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      IconsDuotone.moon,
                      ThemeMode.dark,
                      'Use dark theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      IconsDuotone.gearSix,
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
                      IconsDuotone.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1,
                      IconsDuotone.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1.2,
                      IconsDuotone.textT,
                    ),
                    const Spacing.xxl(),
                    spacingButton(
                      0.8,
                      IconsDuotone.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1,
                      IconsDuotone.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1.2,
                      IconsDuotone.alignCenterHorizontal,
                    ),
                    const Spacing.xxl(),
                    // localeButton(const Locale('fr', 'FR')),
                    // const Spacing.sm(),
                    // localeButton(const Locale('en', 'US')),
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
