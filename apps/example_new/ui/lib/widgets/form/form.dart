import 'dart:collection';
import 'package:ui/ui.dart';

///
class Form<T> extends StatefulWidget {
  ///
  const Form({
    required this.form,
    required this.builder,
    this.initialValue,
    super.key,
  });

  ///
  static Form<Map<String, dynamic>> unsafe({
    required Widget Function(BuildContext context, FormState<Map<String, dynamic>> state) builder,
    Map<String, dynamic>? initialValue,
  }) {
    return Form(
      form: (json) => json,
      initialValue: initialValue,
      builder: builder,
    );
  }

  ///
  final T? initialValue;

  ///
  final T Function(Map<String, dynamic> json) form;

  ///
  final Widget Function(BuildContext context, FormState<T> state) builder;

  @override
  State<Form<T>> createState() => FormState();
}

///
class FormState<T> extends State<Form<T>> {
  ///
  final Set<FormFieldState<dynamic>> _fields = <FormFieldState<dynamic>>{};

  ///
  UnmodifiableListView<FormFieldState<dynamic>> get fields => UnmodifiableListView(_fields);

  ///
  late Map<String, dynamic> value;

  @override
  void initState() {
    super.initState();
    final initialValue = widget.initialValue;
    if (initialValue is JsonSerializable) {
      value = initialValue.toJson();
    } else if (initialValue is Map<String, dynamic>) {
      value = initialValue;
    } else {
      value = {};
    }
  }

  ///
  T submit() {
    return widget.form(value);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this);
  }
}

///
abstract class JsonSerializable {
  ///
  Map<String, dynamic> toJson() => throw UnimplementedError();
}
