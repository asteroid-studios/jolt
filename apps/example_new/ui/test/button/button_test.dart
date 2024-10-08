import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../helpers/golden_test_widget.dart';

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
          GoldenTestScenario(
            name: 'Hovered',
            child: MockInteraction(
              state: const InteractionState(hovered: true),
              child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Focused',
            child: MockInteraction(
              state: const InteractionState(focused: true),
              child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Hovered and focused',
            child: MockInteraction(
              state: const InteractionState(focused: true, hovered: true),
              child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
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
          GoldenTestScenario(
            name: 'Hovered',
            child: MockInteraction(
              state: const InteractionState(hovered: true),
              child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Focused',
            child: MockInteraction(
              state: const InteractionState(focused: true),
              child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Hovered and focused',
            child: MockInteraction(
              state: const InteractionState(focused: true, hovered: true),
              child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
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
          GoldenTestScenario(
            name: 'Hovered',
            child: MockInteraction(
              state: const InteractionState(hovered: true),
              child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Focused',
            child: MockInteraction(
              state: const InteractionState(focused: true),
              child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Hovered and focused',
            child: MockInteraction(
              state: const InteractionState(focused: true, hovered: true),
              child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
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
          GoldenTestScenario(
            name: 'Hovered',
            child: MockInteraction(
              state: const InteractionState(hovered: true),
              child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Focused',
            child: MockInteraction(
              state: const InteractionState(focused: true),
              child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
          GoldenTestScenario(
            name: 'Hovered and focused',
            child: MockInteraction(
              state: const InteractionState(focused: true, hovered: true),
              child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
            ),
          ),
        ],
      ),
    );
    goldenTest(
      'Expanded button',
      fileName: 'expanded_button',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Not expanded',
            child: SizedBox(
              width: 200,
              child: Center(
                child: Button.filled(label: defaultLabel, onTap: defaultOnTap),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Expanded',
            child: SizedBox(
              width: 200,
              child: Center(
                child: Button.filled(
                  label: defaultLabel,
                  onTap: defaultOnTap,
                  expanded: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    goldenTest(
      'Colored buttons',
      fileName: 'colored_buttons',
      builder: () => GoldenTest(
        children: [
          GoldenTestScenario(
            name: 'Surface',
            child: Builder(
              builder: (context) => Button.filled(
                label: defaultLabel,
                onTap: defaultOnTap,
                color: context.color.surface,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Primary',
            child: Builder(
              builder: (context) {
                return Button.filled(
                  label: defaultLabel,
                  onTap: defaultOnTap,
                  color: context.color.primary,
                );
              },
            ),
          ),
          GoldenTestScenario(
            name: 'Secondary',
            child: Builder(
              builder: (context) {
                return Button.filled(
                  label: defaultLabel,
                  onTap: defaultOnTap,
                  color: context.color.secondary,
                );
              },
            ),
          ),
          GoldenTestScenario(
            name: 'Tertiary',
            child: Builder(
              builder: (context) => Button.filled(
                label: defaultLabel,
                onTap: defaultOnTap,
                color: context.color.tertiary,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Error',
            child: Builder(
              builder: (context) => Button.filled(
                label: defaultLabel,
                onTap: defaultOnTap,
                color: context.color.error,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Warning',
            child: Builder(
              builder: (context) {
                return Button.filled(
                  label: defaultLabel,
                  onTap: defaultOnTap,
                  color: context.color.warning,
                );
              },
            ),
          ),
          GoldenTestScenario(
            name: 'Success',
            child: Builder(
              builder: (context) {
                return Button.filled(
                  label: defaultLabel,
                  onTap: defaultOnTap,
                  color: context.color.success,
                );
              },
            ),
          ),
        ],
      ),
    );
  });
}
