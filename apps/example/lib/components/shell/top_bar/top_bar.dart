import 'package:jolt/jolt.dart';

import 'package:example/components/router/routes/routes.dart';
import 'package:example/theming/typography.dart';

///
class TopBar extends StatelessWidget {
  ///
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.surface,
      child: Padding(
        padding: EdgeInsets.all(context.sizing.md),
        child: Row(
          children: [
            Surface.focusable(
              onPressed: () => DashboardRouteData().go(context),
              builder: (context, state) {
                return Text(
                  'Jolt',
                  style: context.style.heading,
                );
              },
            ),
            const Expanded(child: SizedBox()),
            Surface.focusable(
              onPressed: () => DashboardRouteData().go(context),
              background: context.color.background,
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
              onPressed: () => UsersRouteData().go(context),
              background: context.color.background,
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
      ),
    );
  }
}
