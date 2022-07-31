import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';
import 'package:flutter_jolt/src/widgets/snackbars/snackbar_content.dart';

// Constants
const _defaultMaxLines = 1;
const _defaultDuration = Duration(seconds: 2);

enum SnackBarType {
  custom,
  success,
  info,
  warning,
  error,
}

/// Extension on BuildContext to expose showSnackBar methods
extension MessengerExtension on BuildContext {
  ScaffoldMessengerState get _scaffoldMessenger => ScaffoldMessenger.of(this);

  AsyncScaffoldMessengerState get scaffoldMessenger =>
      AsyncScaffoldMessengerState(_scaffoldMessenger);

  showSnackBarSuccess({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    _scaffoldMessenger.showSnackBarDefault(
      type: SnackBarType.success,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarInfo({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    _scaffoldMessenger.showSnackBarDefault(
      type: SnackBarType.info,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarWarning({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    _scaffoldMessenger.showSnackBarDefault(
      type: SnackBarType.warning,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarError({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    _scaffoldMessenger.showSnackBarDefault(
      type: SnackBarType.error,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBar({
    Duration? duration,
    String? message,
    String? heading,
    Color? backgroundColor,
    Color? color,
    IconData? icon,
    int maxLines = _defaultMaxLines,
  }) {
    _scaffoldMessenger.showSnackBarDefault(
      duration: duration,
      message: message,
      heading: heading,
      backgroundColor: backgroundColor,
      color: color,
      icon: icon,
      maxLines: maxLines,
    );
  }
}

/// Extension on global scaffoldMessenger key to expose showSnackBar methods
extension GlobalMessengerExtension on GlobalKey<ScaffoldMessengerState> {
  showSnackBarSuccess({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    currentState?.showSnackBarDefault(
      type: SnackBarType.success,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarInfo({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    currentState?.showSnackBarDefault(
      type: SnackBarType.info,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarWarning({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    currentState?.showSnackBarDefault(
      type: SnackBarType.warning,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarError({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    currentState?.showSnackBarDefault(
      type: SnackBarType.error,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBar({
    Duration? duration,
    String? message,
    String? heading,
    Color? backgroundColor,
    Color? color,
    IconData? icon,
    int maxLines = _defaultMaxLines,
  }) {
    currentState?.showSnackBarDefault(
      duration: duration,
      message: message,
      heading: heading,
      backgroundColor: backgroundColor,
      color: color,
      icon: icon,
      maxLines: maxLines,
    );
  }
}

/// Use [AsyncScaffoldMessengerState] when you are working inside an async
/// function of a widget.
class AsyncScaffoldMessengerState {
  final ScaffoldMessengerState state;

  AsyncScaffoldMessengerState(this.state);

  showSnackBarSuccess({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    state.showSnackBarDefault(
      type: SnackBarType.success,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarInfo({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    state.showSnackBarDefault(
      type: SnackBarType.info,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarWarning({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    state.showSnackBarDefault(
      type: SnackBarType.warning,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBarError({
    Duration? duration,
    String? message,
    int maxLines = _defaultMaxLines,
  }) {
    state.showSnackBarDefault(
      type: SnackBarType.error,
      duration: duration,
      message: message,
      maxLines: maxLines,
    );
  }

  showSnackBar({
    Duration? duration,
    String? message,
    String? heading,
    Color? backgroundColor,
    Color? color,
    IconData? icon,
    int maxLines = _defaultMaxLines,
  }) {
    state.showSnackBarDefault(
      duration: duration,
      message: message,
      heading: heading,
      backgroundColor: backgroundColor,
      color: color,
      icon: icon,
      maxLines: maxLines,
    );
  }
}

/// Extension on any instance of ScaffoldMessengerState, to show snackbars
extension ScaffoldMessengerStateExtension on ScaffoldMessengerState {
  /// A method to show the Jolt snackbar, should not be called directly
  /// use one of the following:
  /// context.showSnackBar
  /// scaffoldMessengerKey.showSnackBar
  /// context.scaffoldMessenger.showSnackBar
  showSnackBarDefault({
    Duration? duration,
    String? message,
    String? heading,
    Color? backgroundColor,
    Color? color,
    IconData? icon,
    SnackBarType type = SnackBarType.custom,
    int maxLines = _defaultMaxLines,
  }) {
    // Setup default values
    final isMobile = context.responsive.isMobile;
    final snackBarDuration = duration ?? _defaultDuration;
    late Color snackBarBackgroundColor;
    late Color snackBarColor;
    IconData? snackBarIcon;
    switch (type) {
      case SnackBarType.custom:
        snackBarBackgroundColor = context.color.primary;
        snackBarColor = context.color.onPrimary;
        break;
      case SnackBarType.success:
        snackBarBackgroundColor = context.color.success;
        snackBarColor = context.color.onSuccess;
        snackBarIcon = context.jolt.iconOverrides.success;
        break;
      case SnackBarType.info:
        snackBarBackgroundColor = context.color.info;
        snackBarColor = context.color.onInfo;
        snackBarIcon = context.jolt.iconOverrides.info;
        break;
      case SnackBarType.warning:
        snackBarBackgroundColor = context.color.warning;
        snackBarColor = context.color.onWarning;
        snackBarIcon = context.jolt.iconOverrides.warning;
        break;
      case SnackBarType.error:
        snackBarBackgroundColor = context.color.error;
        snackBarColor = context.color.onError;
        snackBarIcon = context.jolt.iconOverrides.error;
        break;
    }
    snackBarBackgroundColor = backgroundColor ?? snackBarBackgroundColor;
    snackBarColor = color ?? snackBarColor;
    snackBarIcon = icon ?? snackBarIcon;
    // Call the default showSnackbar method with our custom snackbarContent
    showSnackBar(
      SnackBar(
        elevation: isMobile ? null : 0,
        padding: const EdgeInsets.all(0),
        duration: snackBarDuration,
        dismissDirection: DismissDirection.vertical,
        content: SnackBarContent(
          type: type,
          duration: snackBarDuration,
          backgroundColor: snackBarBackgroundColor,
          color: snackBarColor,
          icon: snackBarIcon,
          message: message,
          heading: heading,
          maxLines: maxLines,
        ),
        width:
            isMobile ? null : 400, // Todo replace 400 with a not magic number
        backgroundColor:
            isMobile ? snackBarBackgroundColor : Colors.transparent,
        behavior: isMobile ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
      ),
    );
  }
}
