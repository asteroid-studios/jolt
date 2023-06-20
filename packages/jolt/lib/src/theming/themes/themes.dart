import 'package:jolt/jolt.dart';

///
class Themes extends StatelessWidget {
  ///
  const Themes({
    required this.child,
    this.theme,
    this.widgetTheme,
    this.scaling,
    super.key,
  });

  ///
  final WidgetThemeData Function(ThemeData, ScalingData)? widgetTheme;

  ///
  final ScalingData? scaling;

  ///
  final ThemeData? theme;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? context.theme;
    final scaling = this.scaling ?? Scaling.of(context);
    return Scaling(
      data: scaling,
      child: MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaleFactor:
              MediaQueryData.fromView(context.view.value).textScaleFactor *
                  scaling.textScale,
        ),
        child: Theme(
          data: theme,
          child: Builder(
            builder: (context) {
              // Set the default color for text and icons to be either:
              // - The default color from the typography class
              // - The default surface foreground color
              final defaultColor =
                  context.style.body.color ?? context.color.surface.foreground;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: theme.colorScheme.background,
                child: InheritedSurface(
                  background: theme.colorScheme.background,
                  child: WidgetTheme(
                    data: widgetTheme?.call(
                          theme,
                          scaling,
                        ) ??
                        context.widgetTheme,
                    child: SymbolTheme(
                      style: context.style.body.copyWith(color: defaultColor),
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
