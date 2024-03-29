import 'package:ui/ui.dart';

///
class Footer extends StatelessWidget {
  ///
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing.md),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: context.color.surface.s100,
            width: 2,
          ),
        ),
        color: context.color.background,
      ),
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Row(
          children: const [
            Text('© 2023 Jolt'),
          ],
        ),
      ),
    );
  }
}
