import 'package:jolt/jolt.dart';

///
class Footer extends StatelessWidget {
  ///
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sizing.md),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.color.surface.s100,
            width: context.dimensions.borderWidth,
          ),
        ),
        color: context.color.background,
      ),
      child: Row(
        children: const [
          Text('© 2023 Jolt'),
        ],
      ),
    );
  }
}
