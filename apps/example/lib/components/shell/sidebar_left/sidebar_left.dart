import 'package:go_router/go_router.dart';
import 'package:jolt/jolt.dart';

import 'package:example/routing/routes.dart';
import 'package:example/translation/app_translations.dart';

///
class SidebarLeft extends StatelessWidget {
  ///
  const SidebarLeft({super.key});

  @override
  Widget build(BuildContext context) {
    Button routeButton(
      void Function() onTap,
      IconData icon,
      String label,
      String location,
    ) {
      final selected = GoRouter.of(context).location == location;

      return Button(
        width: double.infinity,
        horizontalSpacing: context.sizing.md,
        onTap: onTap,
        background: selected ? context.color.primary : null,
        label: label,
        icon: icon,
      );
    }

    return Surface(
      borderColor: Colors.transparent,
      borderRadius: BorderRadius.zero,
      background: context.color.surface.withOpacity(0.3),
      width: 280,
      child: Column(
        children: [
          routeButton(
            () => DashboardRouteData().go(context),
            Icons.duotone.squaresFour,
            context.translations.app.dashboard,
            DashboardRouteData().location,
          ),
          const Spacing.md(),
          routeButton(
            () => UsersRouteData().go(context),
            Icons.duotone.users,
            context.translations.app.users,
            UsersRouteData().location,
          ),
        ],
      ),
    );
  }
}
