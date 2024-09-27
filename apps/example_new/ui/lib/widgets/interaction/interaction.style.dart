import 'package:ui/macros/style_macro.dart';
import 'package:ui/ui.dart';

///
@Style()
class InteractionStyle {
  ///
  final MouseCursor? cursor;

  /// Defaults to false
  final bool? requestFocusOnTap;

  /// Set this to ensure that the state of pressing will last at least this long
  final Duration? minPressingDuration;

  ///
  static InteractionStyle defaultStyle(BuildContext context, InteractionState interaction) {
    return const InteractionStyle(
      cursor: SystemMouseCursors.click,
      minPressingDuration: Durations.medium,
    );
  }
}
