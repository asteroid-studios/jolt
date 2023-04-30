import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:jolt/jolt.dart';

const String _exampleCode =
    "class MyHomePage extends StatefulWidget { MyHomePage({Key key, this.title}) : super(key: key); final String title; @override _MyHomePageState createState() => _MyHomePageState();}";

///
class UsersPage extends StatelessWidget {
  ///
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: 'Users',
      content: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('code_snippets/button.dart'),
          builder: (context, snapshot) {
            print(snapshot.error);
            if (snapshot.data == null) return SizedBox();
            return SyntaxView(
              code: snapshot.data!, // Code text
              syntax: Syntax.DART, // Language
              syntaxTheme: SyntaxTheme.vscodeDark(), // Theme
              fontSize: 12.0, // Font size
              withZoom: false, // Enable/Disable zoom icon controls
              withLinesCount: true, // Enable/Disable line number
              expanded: true, // Enable/Disable container expansion
            );
          },
        ),
      ),
    );
  }
}
