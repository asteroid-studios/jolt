import 'package:ui/ui.dart';

// TODO use a better implementation using CustomMultiChildLayout
// https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html
///
class Scaffold extends StatelessWidget with ThemeValues {
  ///
  const Scaffold({
    required this.content,
    this.bottomBar,
    this.sidebarLeft,
    this.sidebarRight,
    super.key,
  });

  ///
  final Widget content;

  ///
  final Widget? sidebarLeft;

  ///
  final Widget? sidebarRight;

  ///
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: color.background,
      child: Row(
        children: [
          if (sidebarLeft != null) sidebarLeft!,
          Expanded(
            child: Stack(
              children: [
                ScrollAreaPadding(
                  padding: VerticalInsets(
                    bottom: 100,
                  ),
                  child: content,
                ),
                if (bottomBar != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: bottomBar,
                  ),
              ],
            ),
          ),
          if (sidebarRight != null) sidebarRight!,
        ],
      ),
    );
  }
}
