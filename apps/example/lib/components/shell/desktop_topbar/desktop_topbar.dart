import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ui/ui.dart';

///
class DesktopTopbar extends StatelessWidget {
  ///
  const DesktopTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Surface(
      style: const SurfaceStyle(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.zero,
      ),
      // background: context.color.primary.withOpacity(0.1).s800,
      child: Stack(
        children: [
          Positioned.fill(child: MoveWindow()),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.md,
                vertical: context.spacing.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    onPressed: () {},
                    tooltip: 'Cast',
                    background: context.color.primary.withOpacity(0.05),
                    icon: IconsDuotone.screencast,
                  ),
                  const Spacing.md(),
                  Button(
                    onPressed: () {},
                    background: context.color.primary.withOpacity(0.05),
                    icon: IconsDuotone.camera,
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
