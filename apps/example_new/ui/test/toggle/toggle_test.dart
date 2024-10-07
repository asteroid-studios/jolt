// ignore_for_file: avoid_redundant_argument_values

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../helpers/golden_test_widget.dart';

Widget get defaultIcon => IconsBold.textAUnderline.icon;

void main() {
  group(
    'Toggle tests',
    () {
      goldenTest(
        'Filled toggle',
        fileName: 'toggle_filled',
        builder: () => GoldenTest(
          children: [
            GoldenTestScenario(
              name: 'Unselected',
              child: Toggle(
                icon: defaultIcon,
                type: ToggleType.filled,
                onChanged: (_) {},
              ),
            ),
            GoldenTestScenario(
              name: 'Selected',
              child: Toggle(
                icon: defaultIcon,
                type: ToggleType.filled,
                initialValue: true,
                onChanged: (_) {},
              ),
            ),
          ],
        ),
      );
      goldenTest(
        'Outlined toggle',
        fileName: 'toggle_outlined',
        builder: () => GoldenTest(
          children: [
            GoldenTestScenario(
              name: 'Unselected',
              child: Toggle(
                icon: defaultIcon,
                type: ToggleType.outlined,
                onChanged: (_) {},
              ),
            ),
            GoldenTestScenario(
              name: 'Selected',
              child: Toggle(
                icon: defaultIcon,
                type: ToggleType.outlined,
                initialValue: true,
                onChanged: (_) {},
              ),
            ),
          ],
        ),
      );
    },
  );
}
