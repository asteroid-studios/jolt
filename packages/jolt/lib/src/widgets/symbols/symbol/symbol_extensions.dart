import 'package:jolt/jolt.dart';

///
extension TypographyWidgetX on Widget {
  /// Wrap the widget with a passed TextStyle.
  Widget withStyle(TextStyle style) => DefaultSymbolStyle.important(
        style: (_) => style,
        child: this,
      );

  /// Return a Text Widget with style of heroLarge.
  Widget withStyleHeroLarge() => DefaultSymbolStyle.important(
        style: (context) => context.style.heroLarge,
        child: this,
      );

  /// Return a Text Widget with style of hero.
  Widget withStyleHero() => DefaultSymbolStyle.important(
        style: (context) => context.style.hero,
        child: this,
      );

  /// Return a Text Widget with style of heroSmall.
  Widget withStyleHeroSmall() => DefaultSymbolStyle.important(
        style: (context) => context.style.heroSmall,
        child: this,
      );

  /// Return a Text Widget with style of displayLarge.
  Widget withStyleDisplayLarge() => DefaultSymbolStyle.important(
        style: (context) => context.style.displayLarge,
        child: this,
      );

  /// Return a Text Widget with style of display.
  Widget withStyleDisplay() => DefaultSymbolStyle.important(
        style: (context) => context.style.display,
        child: this,
      );

  /// Return a Text Widget with style of displaySmall.
  Widget withStyleDisplaySmall() => DefaultSymbolStyle.important(
        style: (context) => context.style.displaySmall,
        child: this,
      );

  /// Return a Text Widget with style of headingLarge.
  Widget withStyleHeadingLarge() => DefaultSymbolStyle.important(
        style: (context) => context.style.headingLarge,
        child: this,
      );

  /// Return a Text Widget with style of heading.
  Widget withStyleHeading() => DefaultSymbolStyle.important(
        style: (context) => context.style.heading,
        child: this,
      );

  /// Return a Text Widget with style of headingSmall.
  Widget withStyleHeadingSmall() => DefaultSymbolStyle.important(
        style: (context) => context.style.headingSmall,
        child: this,
      );

  /// Return a Text Widget with style of bodyLarge.
  Widget withStyleBodyLarge() => DefaultSymbolStyle.important(
        style: (context) => context.style.bodyLarge,
        child: this,
      );

  /// Return a Text Widget with style of body.
  Widget withStyleBody() => DefaultSymbolStyle.important(
        style: (context) => context.style.body,
        child: this,
      );

  /// Return a Text Widget with style of bodySmall.
  Widget withStyleBodySmall() => DefaultSymbolStyle.important(
        style: (context) => context.style.bodySmall,
        child: this,
      );

  /// Return a Text Widget with style of labelLarge.
  Widget withStyleLabelLarge() => DefaultSymbolStyle.important(
        style: (context) => context.style.labelLarge,
        child: this,
      );

  /// Return a Text Widget with style of label.
  Widget withStyleLabel() => DefaultSymbolStyle.important(
        style: (context) => context.style.label,
        child: this,
      );

  /// Return a Text Widget with style of labelSmall.
  Widget withStyleLabelSmall() => DefaultSymbolStyle.important(
        style: (context) => context.style.labelSmall,
        child: this,
      );

  /// Wrap the widget with a passed foreground color.
  Widget withColor(Color color) => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: color),
        child: this,
      );

  /// Wrap the widget with the foreground color of the inherited surface.
  Widget withColorForeground() => DefaultSymbolStyle.important(
        style: (context) => TextStyle(
          color: context.inherited.surfaceStyle.background?.foreground,
        ),
        child: this,
      );

  /// Wrap the widget with the light foreground color of the inherited surface.
  Widget withColorForegroundLight() => DefaultSymbolStyle.important(
        style: (context) => TextStyle(
          color: context.inherited.surfaceStyle.background?.foregroundLight ??
              context.color.background.foregroundLight,
        ),
        child: this,
      );

  /// Wrap the widget with the primary color.
  Widget withColorPrimary() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.primary),
        child: this,
      );

  /// Wrap the widget with the secondary color.
  Widget withColorSecondary() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.secondary),
        child: this,
      );

  /// Wrap the widget with the tertiary color.
  Widget withColorTertiary() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.tertiary),
        child: this,
      );

  /// Wrap the widget with the success color.
  Widget withColorSuccess() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.success),
        child: this,
      );

  /// Wrap the widget with the warning color.
  Widget withColorWarning() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.warning),
        child: this,
      );

  /// Wrap the widget with the error color.
  Widget withColorError() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.error),
        child: this,
      );

  /// Wrap the widget with the info color.
  Widget withColorInfo() => DefaultSymbolStyle.important(
        style: (_) => TextStyle(color: _.color.info),
        child: this,
      );
}
