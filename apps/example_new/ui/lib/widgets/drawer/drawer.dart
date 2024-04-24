import 'package:ui/ui.dart';

export 'drawer_route.dart';

///
class Drawer extends StatelessWidget with DrawerRoute {
  ///
  const Drawer({
    this.crossAxisSize = 450,
    this.alignment = DrawerAlignment.right,
    this.title,
    super.key,
  });

  ///
  @override
  final DrawerAlignment alignment;

  ///
  @override
  final double? crossAxisSize;

  ///
  final String? title;

  // TODO make so on mobile is full width and no corners

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            context.show(Drawer());
          },
          child: Text(
            'Drawer',
            style: Fonts.heading.colored(Colors.background.as.foreground),
          ),
        ),
      ],
    );
  }
}
