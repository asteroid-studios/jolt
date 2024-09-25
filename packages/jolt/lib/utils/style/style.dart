import 'package:jolt/jolt.dart';

///
extension StyleWidgetX on Widget {
  ///
  InheritedStyle<T, W> withStyle<T, W>(StyleResolver<T, W> style) =>
      InheritedStyle<T, W>(
        style: style,
        child: this,
      );
}
