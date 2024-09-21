import 'package:ui/ui.dart';

// ignore_for_file: public_member_api_docs
// -----------------------------------------------
// Later on this will be way less code with Macros
// -----------------------------------------------
class ButtonStyle {
  const ButtonStyle({
    this.color,
    this.foregroundColor,
    this.borderRadius,
    this.border,
  });

  final Color? color;
  final Color? foregroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  /// Default style for all Buttons
  static MergedButtonStyle defaultStyle(BuildContext context) {
    return MergedButtonStyle(
        // color: Colors.primary,
        // borderRadius: BorderRadius.circular(8),
        );
  }

  static MergedButtonStyle resolve(
    BuildContext context,
    StyleResolver<ButtonStyle>? inlineStyle,
  ) =>
      defaultStyle(context).merge(InheritedStyle.maybeOf<ButtonStyle>(context)).merge(inlineStyle?.call(context));
}

class MergedButtonStyle {
  const MergedButtonStyle({
    this.color,
    this.borderRadius,
    this.border,
    this.foregroundColor,
  });

  final Color? color;
  final Color? foregroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  MergedButtonStyle merge(ButtonStyle? style) {
    return MergedButtonStyle(
      color: style?.color ?? color,
      foregroundColor: style?.foregroundColor ?? foregroundColor,
      border: style?.border ?? border,
      borderRadius: style?.borderRadius ?? borderRadius,
    );
  }
}
