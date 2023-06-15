import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
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
    super.key,
  });

  ///
  final Widget child;

  ///
  final String title;

  ///
  final String code;

  @override
  Widget build(BuildContext context) {
    return Surface(
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
          Expanded(
            child: Row(
              spacing: context.sizing.md,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(context.sizing.xl),
                    child: Center(child: child),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DefaultTextStyle(
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontFamily: 'FiraCode',
                        ),
                    child: MarkdownWidget(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      data: '```\n$code',
                      config: MarkdownConfig(
                        configs: [
                          PreConfig(
                            // textStyle:
                            //     DefaultTextStyle.of(context).style.copyWith(
                            //           fontWeight: FontWeight.w900,
                            //         ),
                            decoration: BoxDecoration(
                              color: context.color.background,
                              borderRadius: context.borderRadius.md,
                            ),
                            theme: context.color.isDark
                                ? paraisoDarkTheme
                                : paraisoLightTheme,
                          ),
                          // Config
                          // CodeConfig(
                          //   style: TextStyle(
                          //     fontFamily: 'FiraCode',
                          //     fontWeight: FontWeight.w900,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
