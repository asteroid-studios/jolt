import 'package:alchemist/alchemist.dart';
import 'package:ui/ui.dart';

const goldenSpacing = 24.0;

class GoldenTest extends StatelessWidget {
  const GoldenTest({
    required this.children,
    this.scenarioConstraints,
    this.columnWidthBuilder,
    this.columns,
    this.themes,
    super.key,
  });

  final List<GoldenTestScenario> children;
  final BoxConstraints? scenarioConstraints;
  final TableColumnWidth? Function(int)? columnWidthBuilder;
  final int? columns;
  final List<Theme>? themes;

  static Color get background => Colors.tailwind.sky.shade700;

  @override
  Widget build(BuildContext context) {
    final themes = this.themes ??
        <Theme>[
          DefaultThemeLight(),
          DefaultThemeDark(),
        ];

    return DefaultTextStyle(
      style: Fonts.body.copyWith(color: background.foreground),
      child: Padding(
        padding: const EdgeInsets.only(
          left: goldenSpacing,
          right: goldenSpacing,
          top: goldenSpacing,
        ),
        child: GoldenTestGroup(
          columnWidthBuilder: columnWidthBuilder,
          scenarioConstraints: scenarioConstraints,
          columns: columns ?? 1,
          children: children
              .map(
                (s) => GoldenTestScenario.builder(
                  name: s.name,
                  constraints: s.constraints,
                  builder: (context) {
                    final child = s.builder(context);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: goldenSpacing),
                      child: Row(
                        children: themes
                            .map(
                              (theme) => ThemeProvider(
                                theme: theme,
                                builder: (context) => Surface(
                                  padding: const EdgeInsets.all(goldenSpacing),
                                  color: context.color.background,
                                  child: child,
                                ),
                              ),
                            )
                            .toList()
                            .withSeparator(const Gap.sm()),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
