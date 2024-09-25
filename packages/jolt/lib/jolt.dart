// Flutter exports
import 'package:jolt/jolt.dart';

export 'package:flutter/material.dart' show SelectionArea;
export 'package:flutter/widgets.dart'
    hide
        ColorSwatch,
        Form,
        FormField,
        FormFieldBuilder,
        FormFieldState,
        FormState,
        Hero,
        SliverPersistentHeader,
        SliverPersistentHeaderDelegate;

export 'package:jolt/utils/utils.dart';
export 'package:jolt/widgets/widgets.dart';

///
class Jolt {
  /// private constructor
  Jolt._();

  /// the one and only instance of this singleton
  static final instance = Jolt._();

  ///
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ///
  static JoltDialog get dialog => JoltDialog.instance;
}

/// A function that resolves a style from a [BuildContext]
typedef StyleResolver<T, W> = T? Function(BuildContext context, W widget);

///
class InheritedStyle<T> extends InheritedWidget {
  ///
  const InheritedStyle({
    required this.style,
    required super.child,
    super.key,
  });

  ///
  final StyleResolver<T> style;

  @override
  bool updateShouldNotify(covariant InheritedStyle<T> oldWidget) {
    return oldWidget.style != style;
  }

  /// Helper method to access the nearest DefaultStyle in the widget tree
  static T? maybeOf<T>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedStyle<T>>()?.style(
        context,
      );
}
