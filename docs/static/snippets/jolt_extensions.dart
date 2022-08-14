import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_utilities.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem Ipsum',
      style: context.textStyle.displayLarge?.copyWith(
        color: context.color.primary,
      ),
    );
  }
}
