import 'package:ui/ui.dart';

export 'bottom_sheet_route.dart';

///
class BottomSheet extends StatelessWidget with BottomSheetRoute {
  ///
  const BottomSheet({this.title, super.key});

  ///
  final String? title;

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
            title ?? 'Bottom sheet',
            style: Fonts.heading.sm.colored(Colors.surface.as.foreground),
          ),
        ),
      ],
    );
  }
}
