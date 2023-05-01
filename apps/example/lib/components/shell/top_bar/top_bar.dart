import 'package:jolt/jolt.dart';

import 'package:example/routing/routes.dart';
import 'package:example/translation/app_translations.dart';

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
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Row(
          children: [
            Surface.focusable(
              background: Colors.transparent,
              onTap: () => DashboardRouteData().go(context),
              builder: (context, state) {
                return Text(
                  context.translations.app.title,
                  style: context.style.heading,
                );
              },
            ),
            const Expanded(child: SizedBox()),
            Button(
              onTap: () => DashboardRouteData().go(context),
              icon: Icons.duotone.squaresFour,
            ),
            const Spacing.md(),
            Button(
              onTap: () => UsersRouteData().go(context),
              icon: Icons.duotone.users,
            ),
          ],
        ),
      ),
    );
  }
}
