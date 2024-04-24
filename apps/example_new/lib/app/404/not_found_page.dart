import 'package:example_new/utils/router/router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404 - Not Found',
            style: Fonts.display,
          ),
          const Gap.sm(),
          GestureDetector(
            onTap: () {
              context.router.replaceAll([const AppRoute()]);
            },
            child: Text(
              'HOME',
              style: Fonts.heading,
            ),
          ),
        ],
      ),
    );
  }
}
