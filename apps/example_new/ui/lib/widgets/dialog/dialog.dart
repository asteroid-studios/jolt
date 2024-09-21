import 'package:ui/ui.dart';

export 'dialog_route.dart';

///
class Dialog<T> extends StatelessWidget with DialogRoute {
  ///
  const Dialog({
    this.title,
    this.content,
    this.child,
    this.onCancel,
    this.onConfirm,
    this.dismissible = true,
    this.width = 450,
    super.key,
  });

  ///
  final bool dismissible;

  ///
  final double width;

  ///
  final String? title;

  ///
  final String? content;

  ///
  final Widget? child;

  final T Function()? onCancel;
  final T Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              style: Fonts.heading.colored(Colors.surface.foreground),
            ),
          if (content != null)
            Text(
              content!,
              style: Fonts.body.colored(Colors.surface.foregroundLight),
            ),
          if (child != null) child!,
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // TODO add buttons
              GestureDetector(
                onTap: () {
                  final value = onCancel?.call();
                  Navigator.of(context).pop(value);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.outline,
                    ),
                    // color: Colors.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Cancel',
                    style: Fonts.body.colored(Colors.surface.foreground),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  final value = onConfirm?.call();
                  // Navigator.of(context).pop(value);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.error,
                    ),
                    color: Colors.error,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Delete',
                    style: Fonts.body.colored(Colors.error.foreground),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
