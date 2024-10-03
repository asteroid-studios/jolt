import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ui/ui.dart';

class DesktopWindowBar extends StatelessWidget {
  const DesktopWindowBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Platform.isDesktop) return const SizedBox.shrink();

    return Surface(
      height: 28,
      child: Stack(
        children: [
          Center(
            child: Text(
              'Jolt',
              style: Fonts.label.lg.w700,
            ),
          ),
          Positioned.fill(
            child: MoveWindow(),
          ),
        ],
      ),
    );
  }
}
