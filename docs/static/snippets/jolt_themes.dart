import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class JoltTheming extends StatelessWidget {
  const JoltTheming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO finish this, also replace with JoltButton
    return ElevatedButton(
      onPressed: () {},
      child: JoltText('Change Theme'),
    );
  }
}
