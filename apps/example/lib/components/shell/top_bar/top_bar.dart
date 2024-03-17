import 'package:ui_copy/ui.dart';

import 'package:example/components/shell/sidebar_left/sidebar_left.dart';
import 'package:example/utils/assets/assets.dart';
import 'package:example/utils/router/router.dart';

///
class TopBar extends StatelessWidget {
  ///
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Surface(
      style: (context) => SurfaceStyle(
        border: Border.all(width: 0),
        borderRadius: BorderRadius.zero,
        color: context.color.surface,
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.md,
          vertical: context.spacing.sm,
        ),
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Row(
          children: [
            Interaction(
              onTap: () {
                context.navigateTo(const DashboardRoute());
              },
              builder: (context, state) {
                return AnimatedScale(
                  duration: context.durations.short,
                  scale: state.isHovered ? 1.05 : 1,
                  child: Image.asset(
                    context.color.isDark
                        ? Assets.iconsLogoDarkPng
                        : Assets.iconsLogoLightPng,
                    height: 35,
                  ),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            Button(
              onPressed: () {
                showSideBar();
              },
              tooltip: 'Show Mobile Menu',
              icon: Icons.sidebar,
              // iconSize: 20,
            ),
            const Spacing.sm(),
            Button(
              onPressed: () {},
              tooltip: 'Hide SideBar',
              // iconWidget: Icons.sidebar.asIcon(
              //   size: 20,
              //   flipHorizontal: true,
              //   // color: context.color.surface.foreground,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
