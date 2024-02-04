import 'package:ui/ui.dart';

///
class UsersPage extends StatelessWidget {
  ///
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold.scrollView(
      windowTitle: 'Users',
      children: [
        Center(
          child: Text('users'),
        ),
      ],
    );
  }
}
