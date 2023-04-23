import 'package:jolt/jolt.dart';

///
class Footer extends StatelessWidget {
  ///
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.surface,
      child: Row(
        children: [
          Text('© 2021 Jolt'),
        ],
      ),
    );
  }
}
