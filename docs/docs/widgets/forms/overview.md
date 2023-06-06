---
sidebar_position: 1
title: 'Form'
---

# Form

Jolt uses a slightly modified version of the default Flutter **Form** widget. It makes all the fields from within the form available from the **FormState**, as well as the current value of the whole form.

Here is an example of using a form:

```dart
Form(
  builder: (context, state) {
    return Column(
      children: [
        TextFormField(
          name: 'firstName',
          label: 'First Name',
          validation: FormValidation.required,
        ),
        Button(
          label: 'Submit',
          onTap: (){
            final valid  = state.saveAndValidate();
            if(valid) {
              print(state.value);
              // {'firstName' : value of firstNames}
            }
          },
        ),
      ],
    );
  },
),
```

## Accessing FormState

In addition to the one passed to the form builder, you can also access the **FormState** like this:
``` dart
final state = Form.of(context);
// or..
final state = context.form;
```

If you need to access form state outside of the scope of the form for some reason, you can use a **GlobalKey**, but this method is not recommended unless you can be sure you will never have two instances of this form at once.

``` dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  // ...
)
```

## TypeSafe forms