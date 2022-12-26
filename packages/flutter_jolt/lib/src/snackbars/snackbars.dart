import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';
import 'package:flutter_jolt/src/utils/snackbars.dart';

class JoltSnackbar extends HookWidget {
  // The type of snackbar being passed through
  final SnackBarType type;

  /// The duration before the snackBar will automatically close
  final Duration duration;

  /// An optional heading to be shown above the snackbar message
  final String? heading;

  /// The primary message to be shown in the snackbar
  final String? message;

  /// The icon to be shown in the snackbar
  final IconData? icon;

  /// Override the background color for the snackbar
  final Color backgroundColor;

  /// Override the foreground color for the snackbar
  final Color color;

  final int maxLines;

  const JoltSnackbar({
    required this.type,
    required this.duration,
    required this.maxLines,
    required this.backgroundColor,
    required this.color,
    this.heading,
    this.message,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.screen.type.isMobile;
    final isHovered = useState(false);

    // TODO get icon from theme data

    // TODO clean up this code!

    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      onHover: (value) => isHovered.value = value,
      child: Dismissible(
        key: const Key('joltSnackBarContent'),
        direction: DismissDirection.horizontal,
        onDismissed: (_) =>
            ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        child: Card(
          elevation: 0,
          shape: isMobile
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                )
              : null,
          color: backgroundColor.darken(!isMobile && isHovered.value ? 5 : 0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 0 : context.spacing.s4,
                    horizontal: isMobile ? 0 : context.spacing.s8,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: duration,
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 2,
                            backgroundColor: color.withOpacity(0.1),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                color.withOpacity(0.2)),
                          );
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.spacing.s8,
                  horizontal: context.spacing.s8,
                ),
                child: Row(
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(right: context.spacing.s8),
                        child: Icon(
                          icon,
                          color: color,
                          // TODO why is this "18.0"?
                          size: 18.0 * context.effectiveUIScale,
                        ),
                      ),
                    message != null
                        ? Expanded(
                            child: JoltText(
                              message!,
                              maxLines: maxLines,
                              // TODO Themeise this widget
                              // style: context.textStyle.title,
                              color: color,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
