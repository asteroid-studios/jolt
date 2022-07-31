import 'package:flutter/material.dart';

class IconOverrides {
  final IconData success;
  final IconData info;
  final IconData warning;
  final IconData error;

  IconOverrides({
    this.success = Icons.check_circle_outline_outlined,
    this.info = Icons.info_outline_rounded,
    this.warning = Icons.warning_amber_rounded,
    this.error = Icons.error_outline_rounded,
  });
}
