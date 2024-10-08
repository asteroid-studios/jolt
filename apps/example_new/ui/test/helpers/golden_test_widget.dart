import 'package:alchemist/alchemist.dart' as alchemist;
import 'package:alchemist/src/golden_test_scenario_constraints.dart' as c;
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:ui/ui.dart';

@isTest
Future<void> goldenTest(
  String name, {
  required List<Widget> Function() children,
  Future<Future<void> Function()?> Function(WidgetTester)? whilePerforming,
}) async {
  await alchemist.goldenTest(
    name,
    fileName: name.toSnakeCase(),
    whilePerforming: whilePerforming,
    builder: () => GoldenTest(
      name,
      children: children(),
    ),
  );
}

class GoldenTest extends StatelessWidget {
  const GoldenTest(
    this.name, {
    required this.children,
    this.scenarioConstraints,
    this.columnWidthBuilder,
    this.columns,
    super.key,
  });

  final String name;
  final List<Widget> children;
  final BoxConstraints? scenarioConstraints;
  final TableColumnWidth? Function(int)? columnWidthBuilder;
  final int? columns;

  static Color get background => Colors.tailwind.sky.shade800;
  static Color get borderColor => Colors.tailwind.sky.shade700;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Fonts.body.copyWith(color: background.foreground),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: borderColor)),
            ),
            child: alchemist.GoldenTestGroup(
              columnWidthBuilder: columnWidthBuilder,
              scenarioConstraints: scenarioConstraints,
              columns: columns ?? 2,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

///
class GoldenTestScenario extends StatelessWidget {
  ///
  const GoldenTestScenario({
    required this.title,
    required this.builder,
    this.subtitle,
    this.constraints,
    this.backgroundColor,
    this.themes,
    super.key,
  });

  ///
  final String title;

  ///
  final String? subtitle;

  ///
  final List<Theme>? themes;

  final Color Function(BuildContext context)? backgroundColor;

  ///
  final Widget Function(BuildContext context) builder;

  /// Constraints to apply to the widget built by [builder]
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final themes = this.themes ??
        <Theme>[
          DefaultThemeLight(),
          DefaultThemeDark(),
        ];

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          if (subtitle != null) const Gap.xxs(),
          if (subtitle != null) Text(subtitle!, style: const TextStyle(fontSize: 12)),
          const Gap.sm(),
          ConstrainedBox(
            constraints: constraints ?? c.GoldenTestScenarioConstraints.maybeOf(context) ?? const BoxConstraints(),
            child: Row(
              children: themes
                  .map(
                    (theme) => ThemeProvider(
                      theme: theme,
                      builder: (context) => Surface(
                        padding: const EdgeInsets.all(24),
                        color: backgroundColor?.call(context) ?? context.color.background,
                        child: Builder(builder: builder),
                      ),
                    ),
                  )
                  .toList()
                  .withSeparator(const Gap.sm()),
            ),
          ),
        ],
      ),
    );
  }
}

extension WidgetTesterX on WidgetTester {
  // TODO better way than using material.
  // Just using for navigation basically as seems easiest way to check taps
  Future<void> pumpWidgetInApp(Widget Function(BuildContext context) widget) async {
    await pumpWidget(
      material.MaterialApp(
        home: material.Scaffold(
          body: Builder(builder: widget),
        ),
      ),
    );
  }
}
