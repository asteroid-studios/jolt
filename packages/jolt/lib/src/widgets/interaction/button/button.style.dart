import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jolt/jolt.dart';

part 'button.style.freezed.dart';

///
@freezed
class ButtonStyle with _$ButtonStyle implements Style<ButtonStyle> {
  ///
  const factory ButtonStyle({
    /// The style of the button surface
    SurfaceStyle? surfaceStyle,

    /// The style of the button text
    ///
    /// Also determines the size icons
    TextStyle? textStyle,

    /// The spacing between a button icon and label
    double? spacing,

    /// The indicator widget to show when the button is busy
    Widget? indicator,
  }) = _ButtonStyle;

  // TODO add indicator none

  // TODO add interaction style. for example request focus on press default.

  const ButtonStyle._();

  @override
  ButtonStyle merge(ButtonStyle? style) {
    return copyWith(
      surfaceStyle:
          surfaceStyle?.merge(style?.surfaceStyle) ?? style?.surfaceStyle,
      textStyle: style?.textStyle ?? textStyle,
      spacing: style?.spacing ?? spacing,
      indicator: style?.indicator ?? indicator,
    );
  }
}
