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
      margin: EdgeInsets.only(bottom: context.spacing.md),
      padding: EdgeInsets.zero,
      background: context.color.transparent,
      borderColor: context.color.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Surface(
            borderWidth: 0,
            padding: EdgeInsets.symmetric(
              vertical: context.spacing.xs,
              horizontal: context.spacing.xl,
            ),
            background: context.color.surface.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: context.borderRadius.sm.topLeft,
              topRight: context.borderRadius.sm.topLeft,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    color: context.color.neutral.s500,
                  ),
                ),
                Button(
                  requestFocusOnPress: false,
                  background: context.color.background,
                  onTap: () {
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
            child: DefaultSurfaceStyle(
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
