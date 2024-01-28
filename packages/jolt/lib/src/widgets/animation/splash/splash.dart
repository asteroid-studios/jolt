import 'package:jolt/jolt.dart';
import 'package:jolt/src/widgets/animation/splash/splash.style.dart';
import 'package:jolt/src/widgets/animation/splash/splash_factories/splash_tap_factory.dart';

///
class Splash extends StatelessWidget {
  ///
  const Splash({
    this.child,
    this.style,
    super.key,
  });

  ///
  final StyleResolver<SplashStyle>? style;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final widgetStyle =
        SplashStyle(splashFactory: (child) => SplashTapFactory(child: child));

    // Merge and resolve all splash styles.
    final style = Style.resolveAll(
      context,
      widgetStyle: widgetStyle,
      style: this.style?.call(context),
    );

    // TODO instead, only add splash style as part of button. So none by default

    if (style == SplashStyle.none || style.splashFactory == null) {
      return child ?? const SizedBox.shrink();
    }

    return style.splashFactory!(child);
  }
}
