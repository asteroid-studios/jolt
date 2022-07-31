import 'package:flutter/material.dart';

extension SpacingExtension on BuildContext {
  SpacingMapping get spacing => SpacingMapping(this);
}

class SpacingMapping {
  final BuildContext context;

  SpacingMapping(this.context);

  double get xs => 4;
  double get sm => 8;
  double get md => 16;
  double get lg => 32;
  double get xl => 64;
}
