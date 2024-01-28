import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:flutter_highlighting/themes/paraiso-dark.dart';
import 'package:flutter_highlighting/themes/paraiso-light.dart';
import 'package:ui/ui.dart';

///
class WidgetRender extends StatelessWidget {
  ///
  const WidgetRender({
    required this.title,
    required this.code,
    required this.child,
    this.height,
    super.key,
  });

  ///
  final Widget child;

  ///
  final String title;

  ///
  final String code;

  ///
  final double? height;

  @override
  Widget build(BuildContext context) {
    final childWidget = Padding(
      padding: EdgeInsets.all(context.spacing.xl),
      child: Center(child: child),
    );

    final codeTheme = Map<String, TextStyle>.from(
      context.color.isDark ? paraisoDarkTheme : paraisoLightTheme,
    );
    codeTheme['root'] = TextStyle(backgroundColor: context.color.background);
    final codeWidget = HighlightView(
      code,
      textStyle: context.style.code,
      languageId: 'dart',
      theme: codeTheme,
    );

    return Surface(
      style: SurfaceStyle(
        margin: EdgeInsets.only(bottom: context.spacing.md),
        borderColor: context.color.surface,
        padding: EdgeInsets.zero,
        color: context.color.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Surface(
            style: SurfaceStyle(
              border: const Border(),
              padding: EdgeInsets.symmetric(
                vertical: context.spacing.xs,
                horizontal: context.spacing.xl,
              ),
              color: context.color.surface.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topLeft: context.borderRadius.sm.topLeft,
                topRight: context.borderRadius.sm.topLeft,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                  ).withColor(context.color.neutral.s500),
                ),
                Button(
                  requestFocusOnPress: false,
                  background: context.color.background,
                  onPressed: () {
                    // TODO Copy widget code to clipboard
                    // TODO Show toast
                  },
                  icon: Icons.copy,
                ),
              ],
            ),
          ),
          Flexible(
            // TODO this is actually helpful, maybe add to the docs
            // TODO maybe create a helper called ResetSurfaceStyle
            // TODO Don't think this really works anymore
            child: DefaultStyle(
              style: const SurfaceStyle(),
              child: Padding(
                padding: EdgeInsets.all(context.spacing.xl),
                child: context.view.isMobileOrSmaller
                    ? Column(
                        children: [
                          childWidget,
                          codeWidget,
                          const Spacing.xl(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(child: childWidget),
                          Expanded(flex: 2, child: codeWidget),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
