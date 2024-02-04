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
        // border: BorderColor(selected ? context.color.primary : null),
        onPressed: () => context.jolt.setTheme(
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
        color: color,
        // border: BorderColor(borderColor),
        // borderRadius: context.borderRadius.xl,
        onPressed: () => context.jolt.setPrimaryColor(color),
      );
    }

    Button sizeButton(
      double sizeMultiplier,
      IconData icon,
    ) {
      final selected = context.scaling.symbolScale == sizeMultiplier;

      return Button(
        icon: icon,
        // border: BorderColor(selected ? context.color.primary : null),
        // iconScale: sizeMultiplier,
        onPressed: () =>
            context.jolt.setSymbolScaleFactorMultiplier(sizeMultiplier),
      );
    }

    Button spacingButton(
      double sizeMultiplier,
      IconData icon,
    ) {
      final selected = context.scaling.spacingScale == sizeMultiplier;

      return Button(
        icon: icon,
        // border: BorderColor(selected ? context.color.primary : null),
        // iconScale: sizeMultiplier,
        onPressed: () =>
            context.jolt.setSpacingScaleFactorMultiplier(sizeMultiplier),
      );
    }

    Button localeButton(
      Locale locale,
    ) {
      final selected = context.jolt.value.locale == locale;
      return Button(
        style: (context) => ButtonStyle(
          surfaceStyle: SurfaceStyle(
            padding: EdgeInsets.all(context.spacing.xs),
          ),
        ),
        icon: Icons.translate,
        // iconSize: context.style.body.fontSize,
        label: locale.languageCode.characters.first,
        textStyle: context.style.button.copyWith(
          fontSize: context.style.label.fontSize,
        ),
        axis: Axis.vertical,
        color: selected ? context.color.primary : null,
        onPressed: () => context.jolt.setLocale(locale),
      );
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: context.color.background,
        border: Border(left: BorderSide(color: context.color.surface)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(context.spacing.md),
                child: Column(
                  children: [
                    themeButton(
                      Icons.cloudSun,
                      ThemeMode.light,
                      'Use light theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.sun,
                      ThemeMode.light,
                      'Use light theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.cloudMoon,
                      ThemeMode.dark,
                      'Use dark theme',
                      withHighContrast: false,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.moon,
                      ThemeMode.dark,
                      'Use dark theme with high contrast',
                      withHighContrast: true,
                    ),
                    const Spacing.sm(),
                    themeButton(
                      Icons.gearSix,
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
                      Icons.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1,
                      Icons.textT,
                    ),
                    const Spacing.sm(),
                    sizeButton(
                      1.2,
                      Icons.textT,
                    ),
                    const Spacing.xxl(),
                    spacingButton(
                      0.8,
                      Icons.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1,
                      Icons.alignCenterHorizontal,
                    ),
                    const Spacing.sm(),
                    spacingButton(
                      1.2,
                      Icons.alignCenterHorizontal,
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
