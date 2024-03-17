import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt_copy/jolt.dart';

part 'splash.style.freezed.dart';

///
typedef SplashFactory = Widget Function(Widget? child);

///
@freezed
class SplashStyle with _$SplashStyle implements Style<SplashStyle> {
  /// Defines the style of a [Splash] widget
  const factory SplashStyle({
    SplashFactory? splashFactory,
  }) = _SplashStyle;

  const SplashStyle._();

  ///
  static SplashStyle none =
      SplashStyle(splashFactory: (_) => _ ?? const SizedBox.shrink());

  @override
  SplashStyle merge(SplashStyle? style) {
    return copyWith(splashFactory: style?.splashFactory ?? splashFactory);
  }
}
