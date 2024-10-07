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

    ToggleStyle style(context, toggle) {
      return ToggleStyle(
        selectedColor: Colors.surface,
      );
    }

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (context.breakpoint.isMobile)
          Row(
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
            ].withExpanded().withSeparator(const Gap.sm()),
          ),
        Expanded(
          child: Row(
            children: [
              if (!showDocs.value || !context.breakpoint.isMobile)
                Expanded(
                  flex: 2,
                  child: child,
                ),
              if (showDocs.value || !context.breakpoint.isMobile)
                Expanded(
                  child: InAppWebView(
                    // TODO keep an eye on https://github.com/flutter/flutter/issues/110381
                    keepAlive: InAppWebViewKeepAlive(),
                    initialUrlRequest: URLRequest(
                      url: WebUri(url),
                    ),
                    onWebViewCreated: (controller) => webController.value = controller,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
