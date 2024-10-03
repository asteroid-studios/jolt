import 'package:example_new/app/app_page.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

// class AppGoRouter extends GoRouter {
//   AppGoRouter();
// }

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AppPage(),
    ),
  ],
);

void test(BuildContext context) {
  // context.go();
}
