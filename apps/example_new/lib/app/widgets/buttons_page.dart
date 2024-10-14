import 'package:example_new/utils/macros/route_macro.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'buttons')
class ButtonsPage extends HookWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {}

    final divider = Surface(
      width: double.infinity,
      height: 1,
      color: Colors.outline,
      margin: EdgeInsets.symmetric(vertical: Spacing.lg),
    );

    return Scaffold(
      topBar: const TempAppBar(title: 'Button'),
      builder: (context) => ScrollArea.fill(
        child: Padding(
          padding: EdgeInsets.only(
            left: Spacing.md,
            right: Spacing.md,
            bottom: Spacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filled', style: Fonts.heading.sm),
              Gap.sm(),
              Wrap(
                spacing: Spacing.sm,
                runSpacing: Spacing.sm,
                children: [
                  Button.filled(
                    label: 'Filled'.text,
                    onTap: onTap,
                  ),
                  Button.filled(
                    icon: Icons.check.icon,
                    label: 'Filled + icon'.text,
                    onTap: onTap,
                  ),
                  Button.filled(
                    icon: Icons.check.icon,
                    onTap: onTap,
                  ),
                  Button.filled(
                    label: 'Disabled'.text,
                  ),
                  MockInteraction(
                    state: const InteractionState(hovered: true),
                    child: Button.filled(
                      label: 'Filled Hovered'.text,
                      onTap: onTap,
                    ),
                  ),
                  Button(
                    color: Colors.primary,
                    label: 'Primary'.text,
                    onTap: onTap,
                  ),
                  Button(
                    color: Colors.secondary,
                    label: 'Secondary'.text,
                    onTap: onTap,
                  ),
                  Button(
                    color: Colors.tertiary,
                    label: 'Tertiary'.text,
                    onTap: onTap,
                  ),
                  Button(
                    color: Colors.success,
                    label: 'Success'.text,
                    onTap: onTap,
                  ),
                  Button(
                    color: Colors.error,
                    label: 'Error'.text,
                    onTap: onTap,
                  ),
                  Button(
                    color: Colors.warning,
                    label: 'Warning'.text,
                    onTap: onTap,
                  ),
                ],
              ),
              divider,
              Text('Outlined', style: Fonts.heading.sm),
              Gap.sm(),
              Wrap(
                spacing: Spacing.sm,
                runSpacing: Spacing.sm,
                children: [
                  Button.outlined(
                    label: 'Outlined'.text,
                    onTap: onTap,
                  ),
                  Button.outlined(
                    icon: Icons.check.icon,
                    label: 'Outlined + icon'.text,
                    onTap: onTap,
                  ),
                  Button.outlined(
                    icon: Icons.check.icon,
                    onTap: onTap,
                  ),
                  Button.outlined(
                    label: 'Disabled'.text,
                  ),
                  MockInteraction(
                    state: const InteractionState(hovered: true),
                    child: Button.outlined(
                      label: 'Outlined Hovered'.text,
                      onTap: onTap,
                    ),
                  ),
                ],
              ),
              divider,
              Text('Ghost', style: Fonts.heading.sm),
              Gap.sm(),
              Surface(
                borderRadius: BorderRadius.circular(16),
                width: double.infinity,
                padding: EdgeInsets.all(Spacing.md),
                child: Wrap(
                  spacing: Spacing.sm,
                  runSpacing: Spacing.sm,
                  children: [
                    Button.ghost(
                      label: 'Ghost'.text,
                      onTap: onTap,
                    ),
                    Button.ghost(
                      icon: Icons.check.icon,
                      label: 'Ghost + icon'.text,
                      onTap: onTap,
                    ),
                    Button.ghost(
                      icon: Icons.check.icon,
                      onTap: onTap,
                    ),
                    Button.ghost(
                      label: 'Disabled'.text,
                    ),
                    MockInteraction(
                      state: const InteractionState(hovered: true),
                      child: Button.ghost(
                        label: 'Ghost Hovered'.text,
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ),
              divider,
              Text('Link', style: Fonts.heading.sm),
              Gap.sm(),
              Surface(
                borderRadius: BorderRadius.circular(16),
                width: double.infinity,
                padding: EdgeInsets.all(Spacing.md),
                child: Wrap(
                  spacing: Spacing.sm,
                  runSpacing: Spacing.sm,
                  children: [
                    Button.link(
                      label: 'Link'.text,
                      onTap: onTap,
                    ),
                    Button.link(
                      icon: Icons.check.icon,
                      label: 'Link + icon'.text,
                      onTap: onTap,
                    ),
                    Button.link(
                      label: 'Link Disabled'.text,
                    ),
                    MockInteraction(
                      state: const InteractionState(hovered: true),
                      child: Button.link(
                        label: 'Link Hovered'.text,
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
