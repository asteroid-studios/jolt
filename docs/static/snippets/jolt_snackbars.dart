import 'package:flutter/material.dart';
import 'package:flutter_jolt/flutter_jolt_widget.dart';

class JoltSnackbars extends StatelessWidget {
  const JoltSnackbars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.showSnackBar();
        context.showSnackBarSuccess();
        context.showSnackBarWarning();
        context.showSnackBarError();
      },
      child: JoltText(
        'Show Snackbars',
      ),
    );
  }
}
