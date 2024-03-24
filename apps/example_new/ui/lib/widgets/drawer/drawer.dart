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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     blurRadius: 30,
        //     offset: Offset(-4, 0),
        //   ),
        // ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(8),
        //   bottomLeft: Radius.circular(8),
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              context.show(Drawer());
            },
            child: Text(
              'Drawer',
              style: context.text.heading.colored(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
