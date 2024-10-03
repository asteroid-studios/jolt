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
  final Widget? title;

  ///
  final Widget? content;

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
            DefaultSymbolStyle(
              style: Fonts.heading.sm,
              child: title!,
            ),
          const Gap.xxs(),
          if (content != null) content!.foregroundLight,
          if (child != null) child!,
          const Gap.lg(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // TODO add buttons
              Button.outlined(
                label: 'Cancel'.text,
                onTap: () {
                  final value = onCancel?.call();
                  Navigator.of(context).pop(value);
                },
              ),
              const Gap.sm(),
              Button.filled(
                color: Colors.error,
                label: 'Delete'.text,
                onTap: () {
                  // final value = onConfirm?.call();
                  // Navigator.of(context).pop(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
