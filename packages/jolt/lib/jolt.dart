// Flutter exports
import 'package:jolt/utils/color/color_shades.dart';

export 'package:flutter/material.dart' show Scrollbar, SelectionArea;
export 'package:flutter/widgets.dart'
    hide Form, FormField, FormFieldBuilder, FormFieldState, FormState, Icon;

export 'package:jolt/utils/utils.dart';

///
class Jolt {
  /// private constructor
  Jolt._();

  /// the one and only instance of this singleton
  static final instance = Jolt._();

  JoltColorShades _colorShades = const JoltColorShades();

  ///
  static JoltColorShades get colorShades => Jolt.instance._colorShades;

  ///
  static set colorShades(JoltColorShades colorShades) {
    Jolt.instance._colorShades = colorShades;
  }
}
