import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class SplashStyle {
  /// Defaults to Theme.transitionDuration
  final Duration? duration;

  /// Defaults to 0.1
  final double? maximumOpacity;

  ///
  final Color? color;

  /// Defaults to 1
  final double? scale;

  /// Override the offset, defaults to where the user tapped
  final Offset? offset;

  ///
  static SplashStyle defaultStyle(BuildContext context, SplashState splash) {
    final background = Surface.of(context).color;
    final isDark = background?.isDark ?? false;
    return SplashStyle(
      color: background?.foreground,
      maximumOpacity: isDark ? 0.1 : 0.05,
    );
  }

  ///
  static SplashStyle centered(BuildContext context, SplashState splash) {
    return SplashStyle(
      offset: Offset(splash.size.width / 2, splash.size.height / 2),
    );
  }
}
