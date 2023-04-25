import 'package:jolt/jolt.dart';

import 'package:example/components/router/routes/routes.dart';
import 'package:example/theming/typography.dart';

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
        vertical: context.sizing.md,
      ),
      background: context.color.surface.withOpacity(0.2),
      child: Row(
        children: [
          Surface.focusable(
            background: Colors.transparent,
            onTap: () => DashboardRouteData().go(context),
            builder: (context, state) {
              return Text(
                'Jolt',
                style: context.style.heading,
              );
            },
          ),
          const Expanded(child: SizedBox()),
          Surface.focusable(
            onTap: () => DashboardRouteData().go(context),
            background: context.color.surface,
            padding: EdgeInsets.symmetric(
              horizontal: context.sizing.sm,
              vertical: context.sizing.xs,
            ),
            builder: (context, state) {
              return JoltText(
                'Dashboard',
                style: context.style.button,
              );
            },
          ),
          const Spacing.md(),
          Surface.focusable(
            onTap: () => UsersRouteData().go(context),
            background: context.color.surface,
            padding: EdgeInsets.symmetric(
              horizontal: context.sizing.sm,
              vertical: context.sizing.xs,
            ),
            builder: (context, state) {
              return JoltText(
                'Users',
                style: context.style.button,
              );
            },
          ),
        ],
      ),
    );
  }
}
