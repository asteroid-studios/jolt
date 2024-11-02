import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

class HomeShell extends HookWidget {
  const HomeShell(
    this.state,
    this.child, {
    super.key,
  });

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final webController = useState<InAppWebViewController?>(null);
    final showDocs = useState(false);
    // TODO: this is a hack until I fix docs to match routes
    final url = 'https://flutterjolt.dev/widgets${state.fullPath}'.replaceAll('/button', '/interaction/button');

    ToggleStyle style(context, toggle) => ToggleStyle(selectedColor: Colors.background);

    useEffect(
      () {
        webController.value?.loadUrl(
          urlRequest: URLRequest(
            url: WebUri(url),
          ),
        );
        return null;
      },
      [state.fullPath],
    );

    useEffect(
      () {
        return () => webController.value?.dispose();
      },
      [],
    );

    return ScrollStack(
      end: AnimatedSwitcher(
        duration: Duration.zero,
        child: context.breakpoint.isMobile && state.fullPath != '/'
            ? Surface(
                padding: const EdgeInsets.all(3),
                margin: EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xs),
                style: (context, widget) => SurfaceStyle(
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 24,
                      spreadRadius: 32,
                      offset: const Offset(0, 32),
                      color: Colors.background.withOpacity(0.95),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // TODO make toggle group instead
                    Toggle(
                      initialValue: true,
                      expanded: true,
                      type: ToggleType.ghost,
                      style: style,
                      label: 'Widgets'.text,
                      onChanged: (p0) {
                        showDocs.value = false;
                      },
                    ),
                    Toggle(
                      expanded: true,
                      type: ToggleType.ghost,
                      style: style,
                      label: 'Docs'.text,
                      onChanged: (p0) {
                        showDocs.value = true;
                      },
                    ),
                  ].withExpanded(),
                ),
              )
            : SizedBox(),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration.zero,
            width: (!showDocs.value || !context.breakpoint.isMobile) ? context.mediaQuery.size.width : 0,
            child: child,
          ),
          Expanded(
            child: Container(
              decoration: context.breakpoint.isMobile
                  ? null
                  : BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.outline)),
                    ),
              child: Column(
                children: [
                  Gap(context.mediaQuery.viewPadding.top),
                  Expanded(
                    child: InAppWebView(
                      // TODO keep an eye on https://github.com/flutter/flutter/issues/110381
                      keepAlive: InAppWebViewKeepAlive(),
                      initialUrlRequest: URLRequest(url: WebUri(url)),
                      onWebViewCreated: (controller) => webController.value = controller,
                    ),
                  ),
                  Gap.scrollEnd(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
