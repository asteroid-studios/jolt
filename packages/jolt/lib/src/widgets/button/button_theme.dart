import 'package:jolt/jolt.dart';

///
class ButtonTheme extends SurfaceTheme {
  ///
  const ButtonTheme({
    super.borderRadius,
    super.horizontalPadding,
    super.verticalPadding,
    super.background,
    super.backgroundOnFocus,
    super.backgroundOnHover,
    super.borderColor,
    super.borderColorOnFocus,
    this.horizontalSpacing,
    this.labelStyle,
    this.smallButtonTheme,
    this.largeButtonTheme,
  });

  ///
  ButtonTheme.from(
    SurfaceTheme surface,
  )   : horizontalSpacing = null,
        labelStyle = null,
        smallButtonTheme = null,
        largeButtonTheme = null,
        super(
          borderRadius: surface.borderRadius,
          horizontalPadding: surface.horizontalPadding,
          verticalPadding: surface.verticalPadding,
          background: surface.background,
          backgroundOnFocus: surface.backgroundOnFocus,
          backgroundOnHover: surface.backgroundOnHover,
          borderColor: surface.borderColor,
          borderColorOnFocus: surface.borderColorOnFocus,
        );

  /// The spacing between a button icon and label
  final double? horizontalSpacing;

  /// The text style of the button label
  final TextStyle? labelStyle;

  /// A style for a small button
  final ButtonTheme? smallButtonTheme;

  /// A style for a large button
  final ButtonTheme? largeButtonTheme;

  ///
  ButtonTheme copyWith({
    BorderRadius? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    Color? background,
    Color? backgroundOnFocus,
    Color? backgroundOnHover,
    Color? borderColor,
    Color? borderColorOnFocus,
    double? horizontalSpacing,
    TextStyle? labelStyle,
    ButtonTheme? smallButtonTheme,
    ButtonTheme? largeButtonTheme,
  }) {
    return ButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      background: background ?? this.background,
      backgroundOnFocus: backgroundOnFocus ?? this.backgroundOnFocus,
      backgroundOnHover: backgroundOnHover ?? this.backgroundOnHover,
      borderColor: borderColor ?? this.borderColor,
      borderColorOnFocus: borderColorOnFocus ?? this.borderColorOnFocus,
      horizontalSpacing: horizontalSpacing ?? this.horizontalSpacing,
      labelStyle: labelStyle ?? this.labelStyle,
      smallButtonTheme: smallButtonTheme ?? this.smallButtonTheme,
      largeButtonTheme: largeButtonTheme ?? this.largeButtonTheme,
    );
  }
}
