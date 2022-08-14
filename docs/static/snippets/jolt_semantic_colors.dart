import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class SemanticColors extends StatelessWidget {
  const SemanticColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JoltText(
      'Message',
      color: context.color.success,
      // color: context.color.warning,
      // color: context.color.info,
      // color: context.color.error,
    );
  }
}
