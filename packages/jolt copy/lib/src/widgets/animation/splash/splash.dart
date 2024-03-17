import 'package:jolt_copy/jolt.dart';

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
      rootStyle: widgetStyle,
      inlineStyle: this.style?.call(context),
    );

    if (style == SplashStyle.none || style.splashFactory == null) {
      return child ?? const SizedBox.shrink();
    }

    return style.splashFactory!(child);
  }
}
