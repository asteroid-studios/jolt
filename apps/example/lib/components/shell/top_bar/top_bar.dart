import 'package:ui/ui.dart';

import 'package:example/components/shell/sidebar_left/sidebar_left.dart';
import 'package:example/utils/assets/assets.dart';
import 'package:example/utils/router/router.dart';
import 'package:example/utils/translation/app_translations.dart';

///
class TopBar extends StatelessWidget {
  ///
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Surface(
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.symmetric(
        horizontal: context.sizing.md,
        vertical: context.sizing.sm,
      ),
      background: context.color.surface,
      backgroundDark: context.color.background,
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
              onTap: () {
                showSideBar();
              },
              tooltip: 'Show Mobile Menu',
              icon: Icons.sidebar,
              iconSize: 20,
            ),
            const Spacing.sm(),
            Button(
              onTap: () {},
              tooltip: 'Hide SideBar',
              iconWidget: Icons.sidebar.icon(
                size: 20,
                flipHorizontal: true,
                color: context.color.surface.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
