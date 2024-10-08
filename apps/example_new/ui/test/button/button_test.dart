import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../helpers/golden_test_widget.dart';

Text get defaultLabel => 'Complete'.text;
Icon get defaultIcon => IconsBold.check.icon;
void Function() get defaultOnTap => () {};
const hoveredButtonKey = Key('hovered');

void main() {
  group('Button tests', () {
    testWidgets('onTap button method', (tester) async {
      const dialogKey = Key('dialog');
      await tester.pumpWidgetInApp(
        (context) => Button(
          label: defaultLabel,
          icon: defaultIcon,
          onTap: () => showGeneralDialog<void>(
            context: context,
            pageBuilder: (context, _, __) => Container(key: dialogKey),
          ),
        ),
      );
      final button = find.byType(Button);
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(find.byKey(dialogKey), findsOneWidget);
    });
    goldenTest(
      'Filled button',
      children: () => [
        GoldenTestScenario(
          title: 'Label',
          builder: (_) => Button.filled(label: defaultLabel, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Icon',
          builder: (_) => Button.filled(icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Label and icon',
          builder: (_) => Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Empty',
          builder: (_) => Button.filled(onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Disabled',
          builder: (_) => Button.filled(label: defaultLabel, icon: defaultIcon),
        ),
        GoldenTestScenario(
          title: 'Hovered',
          builder: (_) => MockInteraction(
            state: const InteractionState(hovered: true),
            child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true),
            child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Hovered and focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true, hovered: true),
            child: Button.filled(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
      ],
    );
    goldenTest(
      'Outlined button',
      children: () => [
        GoldenTestScenario(
          title: 'Label',
          builder: (_) => Button.outlined(label: defaultLabel, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Icon',
          builder: (_) => Button.outlined(icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Label and icon',
          builder: (_) => Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Empty',
          builder: (_) => Button.outlined(onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Disabled',
          builder: (_) => Button.outlined(label: defaultLabel, icon: defaultIcon),
        ),
        GoldenTestScenario(
          title: 'Hovered',
          builder: (_) => MockInteraction(
            state: const InteractionState(hovered: true),
            child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true),
            child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Hovered and focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true, hovered: true),
            child: Button.outlined(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
      ],
    );
    goldenTest(
      'Ghost button',
      children: () => [
        GoldenTestScenario(
          title: 'Label',
          builder: (_) => Button.ghost(label: defaultLabel, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Icon',
          builder: (_) => Button.ghost(icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Label and icon',
          builder: (_) => Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Empty',
          builder: (_) => Button.ghost(onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Disabled',
          builder: (_) => Button.ghost(label: defaultLabel, icon: defaultIcon),
        ),
        GoldenTestScenario(
          title: 'Hovered',
          builder: (_) => MockInteraction(
            state: const InteractionState(hovered: true),
            child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true),
            child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Hovered and focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true, hovered: true),
            child: Button.ghost(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
      ],
    );
    goldenTest(
      'Link button',
      children: () => [
        GoldenTestScenario(
          title: 'Label',
          builder: (_) => Button.link(label: defaultLabel, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Icon',
          builder: (_) => Button.link(icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Label and icon',
          builder: (_) => Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Empty',
          builder: (_) => Button.link(onTap: defaultOnTap),
        ),
        GoldenTestScenario(
          title: 'Disabled',
          builder: (_) => Button.link(label: defaultLabel, icon: defaultIcon),
        ),
        GoldenTestScenario(
          title: 'Hovered',
          builder: (_) => MockInteraction(
            state: const InteractionState(hovered: true),
            child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true),
            child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
        GoldenTestScenario(
          title: 'Hovered and focused',
          builder: (_) => MockInteraction(
            state: const InteractionState(focused: true, hovered: true),
            child: Button.link(label: defaultLabel, icon: defaultIcon, onTap: defaultOnTap),
          ),
        ),
      ],
    );
    goldenTest(
      'Expanded button',
      children: () => [
        GoldenTestScenario(
          title: 'Not expanded',
          builder: (_) => SizedBox(
            width: 200,
            child: Center(
              child: Button.filled(label: defaultLabel, onTap: defaultOnTap),
            ),
          ),
        ),
        GoldenTestScenario(
          title: 'Expanded',
          builder: (_) => SizedBox(
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
    );
    goldenTest(
      'Custom styling',
      children: () {
        ButtonStyle inheritedStyle(BuildContext context) => ButtonStyle(
              surfaceStyle: SurfaceStyle(
                border: [SurfaceBorder.all(color: context.color.primary, width: 2)],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
            );
        ButtonStyle inlineStyle(BuildContext context, Button widget) => ButtonStyle(
              surfaceStyle: SurfaceStyle(
                border: [SurfaceBorder.all(color: context.color.tertiary, width: 2)],
                color: Colors.primary,
              ),
            );
        return [
          GoldenTestScenario(
            title: 'Inherited style',
            builder: (_) => InheritedStyle(
              style: inheritedStyle,
              child: Button(
                label: defaultLabel,
                onTap: defaultOnTap,
              ),
            ),
          ),
          GoldenTestScenario(
            title: 'Inline style',
            builder: (_) => Button(
              label: defaultLabel,
              onTap: defaultOnTap,
              style: inlineStyle,
            ),
          ),
          // Inline styles override and combine with inherited styles.
          GoldenTestScenario(
            title: 'Inherited and inline style',
            builder: (_) => InheritedStyle(
              style: inheritedStyle,
              child: Button(
                label: defaultLabel,
                onTap: defaultOnTap,
                style: inlineStyle,
              ),
            ),
          ),
        ];
      },
    );
    goldenTest(
      'Colored buttons',
      children: () => [
        GoldenTestScenario(
          title: 'Background',
          backgroundColor: (context) => context.color.surface,
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.background,
          ),
        ),
        GoldenTestScenario(
          title: 'Surface',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.surface,
          ),
        ),
        GoldenTestScenario(
          title: 'Primary',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.primary,
          ),
        ),
        GoldenTestScenario(
          title: 'Secondary',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.secondary,
          ),
        ),
        GoldenTestScenario(
          title: 'Tertiary',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.tertiary,
          ),
        ),
        GoldenTestScenario(
          title: 'Error',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.error,
          ),
        ),
        GoldenTestScenario(
          title: 'Warning',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.warning,
          ),
        ),
        GoldenTestScenario(
          title: 'Success',
          builder: (context) => Button.filled(
            label: defaultLabel,
            onTap: defaultOnTap,
            color: context.color.success,
          ),
        ),
      ],
    );
  });
}
