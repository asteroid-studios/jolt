import 'package:jolt/jolt.dart';

///
class TextField extends StatelessWidget {
  ///
  const TextField({
    required this.name,
    this.initialValue,
    super.key,
  });

  /// {@macro form_field_name}
  final String name;

  /// {@macro form_field_initial_value}
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      name: name,
      initialValue: initialValue,
      builder: (field) {
        throw UnimplementedError();
      },
    );
  }
}
