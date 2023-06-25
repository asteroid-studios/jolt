import 'package:jolt/jolt.dart';

///
extension TypographyWidgetX on Widget {
  /// Wrap the widget with a passed TextStyle.
  Widget style(TextStyle style) => DefaultSymbolStyle(
        style: (_) => style,
        child: this,
      );

  /// Return a Text Widget with style of heroLarge.
  Widget styleHeroLarge() => DefaultSymbolStyle(
        style: (context) => context.style.heroLarge,
        child: this,
      );

  /// Return a Text Widget with style of hero.
  Widget styleHero() => DefaultSymbolStyle(
        style: (context) => context.style.hero,
        child: this,
      );

  /// Return a Text Widget with style of heroSmall.
  Widget styleHeroSmall() => DefaultSymbolStyle(
        style: (context) => context.style.heroSmall,
        child: this,
      );

  /// Return a Text Widget with style of displayLarge.
  Widget styleDisplayLarge() => DefaultSymbolStyle(
        style: (context) => context.style.displayLarge,
        child: this,
      );

  /// Return a Text Widget with style of display.
  Widget styleDisplay() => DefaultSymbolStyle(
        style: (context) => context.style.display,
        child: this,
      );

  /// Return a Text Widget with style of displaySmall.
  Widget styleDisplaySmall() => DefaultSymbolStyle(
        style: (context) => context.style.displaySmall,
        child: this,
      );

  /// Return a Text Widget with style of headingLarge.
  Widget styleHeadingLarge() => DefaultSymbolStyle(
        style: (context) => context.style.headingLarge,
        child: this,
      );

  /// Return a Text Widget with style of heading.
  Widget styleHeading() => DefaultSymbolStyle(
        style: (context) => context.style.heading,
        child: this,
      );

  /// Return a Text Widget with style of headingSmall.
  Widget styleHeadingSmall() => DefaultSymbolStyle(
        style: (context) => context.style.headingSmall,
        child: this,
      );

  /// Return a Text Widget with style of bodyLarge.
  Widget styleBodyLarge() => DefaultSymbolStyle(
        style: (context) => context.style.bodyLarge,
        child: this,
      );

  /// Return a Text Widget with style of body.
  Widget styleBody() => DefaultSymbolStyle(
        style: (context) => context.style.body,
        child: this,
      );

  /// Return a Text Widget with style of bodySmall.
  Widget styleBodySmall() => DefaultSymbolStyle(
        style: (context) => context.style.bodySmall,
        child: this,
      );

  /// Return a Text Widget with style of labelLarge.
  Widget styleLabelLarge() => DefaultSymbolStyle(
        style: (context) => context.style.labelLarge,
        child: this,
      );

  /// Return a Text Widget with style of label.
  Widget styleLabel() => DefaultSymbolStyle(
        style: (context) => context.style.label,
        child: this,
      );

  /// Return a Text Widget with style of labelSmall.
  Widget styleLabelSmall() => DefaultSymbolStyle(
        style: (context) => context.style.labelSmall,
        child: this,
      );

  /// Wrap the widget with a passed foreground color.
  Widget color(Color color) => DefaultSymbolStyle(
        style: (_) => TextStyle(color: color),
        child: this,
      );

  /// Wrap the widget with the foreground color of the inherited surface.
  Widget colorForeground() => DefaultSymbolStyle(
        style: (context) => TextStyle(
          color: context.inherited.surfaceStyle.background?.foreground,
        ),
        child: this,
      );

  /// Wrap the widget with the light foreground color of the inherited surface.
  Widget colorForegroundLight() => DefaultSymbolStyle(
        style: (context) => TextStyle(
          color: context.inherited.surfaceStyle.background?.foregroundLight,
        ),
        child: this,
      );

  /// Wrap the widget with the primary color.
  Widget colorPrimary() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.primary),
        child: this,
      );

  /// Wrap the widget with the secondary color.
  Widget colorSecondary() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.secondary),
        child: this,
      );

  /// Wrap the widget with the tertiary color.
  Widget colorTertiary() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.tertiary),
        child: this,
      );

  /// Wrap the widget with the success color.
  Widget colorSuccess() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.success),
        child: this,
      );

  /// Wrap the widget with the warning color.
  Widget colorWarning() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.warning),
        child: this,
      );

  /// Wrap the widget with the error color.
  Widget colorError() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.error),
        child: this,
      );

  /// Wrap the widget with the info color.
  Widget colorInfo() => DefaultSymbolStyle(
        style: (_) => TextStyle(color: _.color.info),
        child: this,
      );
}
