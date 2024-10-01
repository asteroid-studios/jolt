import 'package:flutter/material.dart';

///
class FormField<T> extends StatefulWidget {
  ///
  const FormField({
    this.initialValue,
    super.key,
  });

  ///
  final T? initialValue;

  @override
  State<FormField<T>> createState() => FormFieldState<T>();
}

///
class FormFieldState<T> extends State<FormField<T>> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
