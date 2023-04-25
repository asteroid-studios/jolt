import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:jolt/jolt.dart';

///
class DesktopTopbar extends StatelessWidget {
  ///
  const DesktopTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Surface(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      background: context.color.primary.s800.withOpacity(0.1),
      child: Stack(
        children: [
          Positioned.fill(child: MoveWindow()),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sizing.md,
                vertical: context.sizing.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    onTap: () {},
                    background: context.color.primary.withOpacity(0.05),
                    phosphorIcon: PhosphorIcons.duotone.screencast,
                  ),
                  const Spacing.md(),
                  Button(
                    onTap: () {},
                    background: context.color.primary.withOpacity(0.05),
                    phosphorIcon: PhosphorIcons.duotone.camera,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
