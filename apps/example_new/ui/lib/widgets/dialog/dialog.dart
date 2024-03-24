import 'package:ui/ui.dart';

export 'dialog_route.dart';

///
class Dialog<T> extends StatelessWidget with ThemeValues, DialogRoute {
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
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(24),
      width: width,
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              style: context.text.heading.colored(color.surface.as.foreground),
            ),
          if (content != null)
            Text(
              content!,
              style:
                  context.text.body.colored(color.surface.as.foregroundLight),
            ),
          if (child != null) child!,
          SizedBox(height: 20),
          Row(
            children: [
              // TODO add buttons
              GestureDetector(
                onTap: () {
                  final value = onCancel?.call();
                  Navigator.of(context).pop(value);
                },
                child: Text(
                  'Cancel',
                  style: text.body.colored(color.surface.as.foreground),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  final value = onConfirm?.call();
                  Navigator.of(context).pop(value);
                },
                child: Text(
                  'OK',
                  style: text.body.colored(color.error),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
