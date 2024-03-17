// Flutter exports
import 'package:jolt/utils/utils.dart';

export 'package:flutter/material.dart' show Scrollbar, SelectionArea;
export 'package:flutter/widgets.dart'
    hide
        ColorSwatch,
        Form,
        FormField,
        FormFieldBuilder,
        FormFieldState,
        FormState,
        Icon;

export 'package:jolt/utils/utils.dart';

///
class Jolt {
  /// private constructor
  Jolt._();

  /// the one and only instance of this singleton
  static final instance = Jolt._();

  ///
  static JoltColor get color => JoltColor.instance;
}
