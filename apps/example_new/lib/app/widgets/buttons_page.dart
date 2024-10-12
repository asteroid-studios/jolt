import 'package:example_new/utils/macros/route_macro.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: 'button')
class ButtonsPage extends HookWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {}

    return Scaffold(
      topBar: Surface(
        padding: EdgeInsets.all(Spacing.sm),
        style: (context, widget) => SurfaceStyle(
          color: Colors.background.withOpacity(0.9),
          borderRadius: BorderRadius.circular(0),
          blur: 5,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Buttons',
                style: Fonts.heading,
              ),
            ),
            Button(
              label: 'back'.text,
              onTap: () => context.pop(),
            ),
          ],
        ),
      ),
      builder: (context) => ScrollArea.fill(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button.filled(
                label: 'Filled'.text,
                onTap: onTap,
              ),
              Button.filled(
                icon: Icons.check.icon,
                label: 'Filled'.text,
                onTap: onTap,
              ),
              Button.filled(
                icon: Icons.check.icon,
                onTap: onTap,
              ),
              Button.outlined(
                label: 'Outlined'.text,
                onTap: onTap,
              ),
              Button.ghost(
                label: 'Ghost'.text,
                onTap: onTap,
              ),
              Button.link(
                label: 'Link'.text,
                onTap: onTap,
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
            ].withSeparator(const Gap.sm()),
          ),
        ),
      ),
    );
  }
}
