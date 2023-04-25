import 'package:jolt/jolt.dart';

///
class Themes extends StatelessWidget {
  ///
  const Themes({
    required this.theme,
    required this.child,
    this.widgetTheme,
    this.scaling = const ScalingData(),
    super.key,
  });

  ///
  final WidgetThemeData Function(ThemeData)? widgetTheme;

  ///
  final ScalingData scaling;

  ///
  final ThemeData theme;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaling(
      data: scaling,
      child: MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaleFactor:
              context.mediaQuery.textScaleFactor * scaling.textScale,
        ),
        child: Theme(
          data: theme,
          child: Builder(
            builder: (context) {
              // Set the default color for text and icons to be either:
              // - The default color from the typography class
              // - The darkest neutral color from the color scheme
              final defaultColor =
                  context.style.body.color ?? context.color.surface.highlight;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                // TODO move this into my scaffold thing I end up making
                color: theme.colorScheme.background,
                child: WidgetTheme(
                  data: widgetTheme != null
                      ? widgetTheme!(context.theme)
                      : const WidgetThemeData(),
                  child: DefaultTextStyle(
                    style: context.style.body.copyWith(color: defaultColor),
                    child: IconTheme(
                      data: IconThemeData(
                        color: defaultColor,
                        size: (context.style.body.fontSize ?? 16) *
                            context.scaling.textScale,
                      ),
                      child: DefaultSelectionStyle(
                        cursorColor: context.color.primary,
                        selectionColor: context.color.primary.withOpacity(0.3),
                        child: child,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
