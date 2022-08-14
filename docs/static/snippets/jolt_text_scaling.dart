import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class TextScaling extends StatelessWidget {
  const TextScaling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceTextScale = context.mediaQuery.textScaleFactor; // eg: 0.9
    final appTextScale = context.jolt.textScale.value; // eg: 0.9

    // The final text scale applied to text will the two combined
    print(deviceTextScale * appTextScale); // eg: 0.81

    return JoltText(
      'Scaled text',
      // Optionally prevent text from scaling at all
      // scaleText: false,
    );
  }
}
