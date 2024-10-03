import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ui/ui.dart';

class DocsPage extends StatelessWidget {
  const DocsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO bug  trying to create an already created view
    // TODO make it so when clicking on the bottom nav button again it returns to widgets screen.
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri("https://flutterjolt.dev/widgets")),
    );
  }
}
