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
