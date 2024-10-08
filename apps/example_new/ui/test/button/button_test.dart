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
          GoldenTestScenario(
            name: 'Disabled',
            child: Button.filled(label: defaultLabel, icon: defaultIcon),
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
          GoldenTestScenario(
            name: 'Disabled',
            child: Button.outlined(label: defaultLabel, icon: defaultIcon),
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
          GoldenTestScenario(
            name: 'Disabled',
            child: Button.ghost(label: defaultLabel, icon: defaultIcon),
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
          GoldenTestScenario(
            name: 'Disabled',
            child: Button.link(label: defaultLabel, icon: defaultIcon),
          ),
        ],
      ),
    );
    goldenTest(
      'Filled button hovered',
      fileName: 'filled_button_hovered',
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
      'Outlined button hovered',
      fileName: 'outlined_button_hovered',
      whilePerforming: hover(find.byKey(hoveredButtonKey)),
      builder: () => GoldenTest(
        themes: [DefaultThemeLight()],
        children: [
          GoldenTestScenario(
            name: 'Not hovered',
            child: Button.outlined(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Hovered',
            child: Button.outlined(
              key: hoveredButtonKey,
              label: defaultLabel,
              onTap: defaultOnTap,
            ),
          ),
        ],
      ),
    );
    goldenTest(
      'Ghost button hovered',
      fileName: 'ghost_button_hovered',
      whilePerforming: hover(find.byKey(hoveredButtonKey)),
      builder: () => GoldenTest(
        themes: [DefaultThemeLight()],
        children: [
          GoldenTestScenario(
            name: 'Not hovered',
            child: Button.ghost(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Hovered',
            child: Button.ghost(
              key: hoveredButtonKey,
              label: defaultLabel,
              onTap: defaultOnTap,
            ),
          ),
        ],
      ),
    );
    goldenTest(
      'Link button hovered',
      fileName: 'link_button_hovered',
      whilePerforming: hover(find.byKey(hoveredButtonKey)),
      builder: () => GoldenTest(
        themes: [DefaultThemeLight()],
        children: [
          GoldenTestScenario(
            name: 'Not hovered',
            child: Button.link(label: defaultLabel, onTap: defaultOnTap),
          ),
          GoldenTestScenario(
            name: 'Hovered',
            child: Button.link(
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
