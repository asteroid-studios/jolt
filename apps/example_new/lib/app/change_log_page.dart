import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ui/ui.dart';

class ChangeLogPage extends StatelessWidget {
  const ChangeLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO show web view of change log
    // TODO make it so when clicking on the bottom nav button again it returns to change log screen.
    // Refresh every time open tab
    return InAppWebView(
      // TODO replace with jolt when published
      initialUrlRequest: URLRequest(url: WebUri("https://pub.dev/packages/go_router/changelog")),
    );
  }
}
