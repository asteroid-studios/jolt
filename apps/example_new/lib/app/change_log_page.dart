import 'package:example_new/utils/macros/route_macro.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ui/ui.dart';

@TypeSafeRoute(path: '/changelogs')
class ChangeLogPage extends StatelessWidget {
  const ChangeLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO could also fetch change log from Github and display as markdown
    // TODO show web view of change log
    // TODO make it so when clicking on the bottom nav button again it returns to change log screen.
    // Refresh every time open tab
    return Scaffold(
      topBar: TempAppBar(title: 'Change Log', showBack: false),
      builder: (context) {
        return Column(
          children: [
            Gap.scrollStart(),
            Expanded(
              child: InAppWebView(
                initialSettings: InAppWebViewSettings(horizontalScrollBarEnabled: false, disallowOverScroll: true),
                // TODO replace with jolt when published
                initialUrlRequest: URLRequest(url: WebUri('https://pub.dev/packages/go_router/changelog')),
              ),
            ),
            Gap.scrollEnd(),
          ],
        );
      },
    );
  }
}
