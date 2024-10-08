// ignore_for_file: avoid_redundant_argument_values

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
        children: () => [
          GoldenTestScenario(
            title: 'Unselected',
            builder: (_) => Toggle(
              icon: defaultIcon,
              type: ToggleType.filled,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            title: 'Selected',
            builder: (_) => Toggle(
              icon: defaultIcon,
              type: ToggleType.filled,
              initialValue: true,
              onChanged: (_) {},
            ),
          ),
        ],
      );
      goldenTest(
        'Outlined toggle',
        children: () => [
          GoldenTestScenario(
            title: 'Unselected',
            builder: (_) => Toggle(
              icon: defaultIcon,
              type: ToggleType.outlined,
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            title: 'Selected',
            builder: (_) => Toggle(
              icon: defaultIcon,
              type: ToggleType.outlined,
              initialValue: true,
              onChanged: (_) {},
            ),
          ),
        ],
      );
    },
  );
}
