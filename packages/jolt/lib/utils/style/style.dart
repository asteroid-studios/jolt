import 'package:jolt/jolt.dart';

///
extension StyleWidgetX on Widget {
  ///
  InheritedStyle<T> withStyle<T>(InheritedStyleResolver<T> style) =>
      InheritedStyle<T>(
        style: style,
        child: this,
      );
}
