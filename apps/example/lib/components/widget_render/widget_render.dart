import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/paraiso-dark.dart';
import 'package:flutter_highlight/themes/paraiso-light.dart';
import 'package:markdown_widget/markdown_widget.dart';
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
      padding: EdgeInsets.all(context.sizing.xl),
      child: Center(child: child),
    );

    final codeTheme = Map<String, TextStyle>.from(
      context.color.isDark ? paraisoDarkTheme : paraisoLightTheme,
    );
    codeTheme['root'] = TextStyle(backgroundColor: context.color.background);
    final codeWidget = HighlightView(
      code,
      textStyle: DefaultTextStyle.of(context).style.copyWith(
            fontFamily: 'FiraCode',
          ),
      language: 'dart',
      theme: codeTheme,
    );

    return Surface(
      // height: height,
      margin: EdgeInsets.only(bottom: context.sizing.md),
      padding: EdgeInsets.zero,
      background: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Surface(
            borderWidth: 0,
            padding: EdgeInsets.symmetric(
              vertical: context.sizing.xs,
              horizontal: context.sizing.xl,
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
            child: Padding(
              padding: EdgeInsets.all(context.sizing.xl),
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
        ],
      ),
    );
  }
}
