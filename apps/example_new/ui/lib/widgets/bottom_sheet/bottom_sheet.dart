import 'package:ui/ui.dart';

export 'bottom_sheet_route.dart';

///
class BottomSheet extends StatelessWidget with ThemeValues, BottomSheetRoute {
  ///
  const BottomSheet({this.title, super.key});

  ///
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(top: 24),
      child: Dismissible(
        key: const Key('JoltBottomSheet'),
        direction: DismissDirection.down,
        onDismissed: (direction) => Navigator.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 450,
          decoration: BoxDecoration(
            color: color.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
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
                  title ?? 'Bottom sheet',
                  style: text.heading.colored(color.surface.as.foreground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
