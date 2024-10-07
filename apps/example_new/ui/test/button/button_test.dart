import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../helpers/golden_test_widget.dart';
import '../helpers/hover_widget.dart';

Text get defaultLabel => 'Complete'.text;
Icon get defaultIcon => IconsBold.check.icon;
void Function() get defaultOnTap => () {};
const hoveredButtonKey = Key('hovered');

void main() {
  group('Button tests', () {
    goldenTest(
      'Filled button',
      fileName: 'filled_button',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Label',
            child: Button.filled(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: Button.filled(icon: defaultIcon, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Label and icon',
            child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ],
      ),
    );
    goldenTest(
      'Outlined button',
      fileName: 'outlined_button',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Label',
            child: Button.outlined(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: Button.outlined(icon: defaultIcon, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Label and icon',
            child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ],
      ),
    );
    goldenTest(
      'Ghost button',
      fileName: 'ghost_button',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Label',
            child: Button.ghost(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: Button.ghost(icon: defaultIcon, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Label and icon',
            child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ],
      ),
    );
    goldenTest(
      'Link button',
      fileName: 'link_button',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Label',
            child: Button.link(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: Button.link(icon: defaultIcon, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Label and icon',
            child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ],
      ),
    );
    goldenTest(
      'Hovered light theme',
      fileName: 'hovered_light_button',
      whilePerforming: hover(find.byKey(hoveredButtonKey)),
      builder: () => GoldenTest(
        themes: [DefaultThemeLight()],
        children: [
          GoldenTestScenario(
            name: 'Not hovered',
            child: Button.filled(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Hovered',
            child: Button.filled(
              key: hoveredButtonKey,
              label: defaultLabel,
              onTap: defaultOnTap,
            ),
          ),
        ],
      ),
    );
    goldenTest(
      'Hovered dark theme',
      fileName: 'hovered_dark_button',
      whilePerforming: hover(find.byKey(hoveredButtonKey)),
      builder: () => GoldenTest(
        themes: [DefaultThemeDark()],
        children: [
          GoldenTestScenario(
            name: 'Not hovered',
            child: Button.filled(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Hovered',
            child: Button.filled(
              key: hoveredButtonKey,
              label: defaultLabel,
              onTap: defaultOnTap,
            ),
          ),
        ],
      ),
    );
  });
}
