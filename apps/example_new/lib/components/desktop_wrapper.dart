import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:ui/ui.dart';

class DesktopWrapper extends StatelessWidget with ThemeValues {
  const DesktopWrapper({
    required this.child,
    super.key,
  });

  // ignore: avoid_unused_constructor_parameters
  factory DesktopWrapper.builder(BuildContext context, Widget? child) {
    return DesktopWrapper(
      child: child ?? const SizedBox.shrink(),
    );
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.whenGroup(
      child,
      web: child,
      desktop: WindowBorder(
        color: color.primary,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              color: color.surface,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        'Jolt',
                        style:
                            text.body.colored(color.background.as.foreground),
                      ),
                    ),
                  ),
                  Positioned.fill(child: MoveWindow()),
                  Align(
                    alignment: Platform.when(
                      Alignment.centerRight,
                      windows: Alignment.centerRight,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ThemeProvider.of(context)?.toggleTheme();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: color.surface.weaken(),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          // TODO replace with a dropdown with light dark and system
                          color.isDark ? IconsDuotone.moon : IconsDuotone.sun,
                          color: color.background.as.foreground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
