import 'package:jolt/jolt.dart';

///
Widget flightShuttleFadeBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return Stack(
    children: [
      Positioned.fill(
        child: FadeTransition(
          opacity: animation,
          child: fromHeroContext.widget,
        ),
      ),
      Positioned.fill(
        child: FadeTransition(
          opacity: animation,
          child: toHeroContext.widget,
        ),
      ),
    ],
  );
}
