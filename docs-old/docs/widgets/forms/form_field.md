
# FormField

All form fields in Jolt use a modified version of the Flutter **FormField**. A required **name** parameter has been added, which is used when generating the value of a form.

All of the provided Jolt form fields are composed using the base FormField widget. You can do the same to make your own custom form fields.

## Creating a custom form field

Let's make a form field which lets a user pick a shade of a color from a row of buttons.

```dart
class MyColorPicker extends StatelessWidget {
  const MyColorPicker({
    super.key,
    required this.name,
    this.initialValue,
    this.validator,
  });

  final String name;
  final Color? initialValue;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<Color>(
      name: name,
      validator: validator,
      initialValue: initialValue,
      builder: (field) {
        return Row(
          children: Colors.violet.shades.map(
            (Color color) {
              return Button(
                background: color,
                onTap: () {
                  field.didChange(color);
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
```

##  Validation

<!-- TODO Validation docs -->