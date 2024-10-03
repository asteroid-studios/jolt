import 'package:ui/macros/form_macro.dart';
// ignore: unused_import
import 'package:ui/ui.dart';
// import 'package:flutter/material.dart' as mat;

// final test = mat.Form(
//   child: Container(),
// );

// TODO something else I could do is have the Form generate an actual Form widget
// ie TestForm will return Form<TestForm>

///
@TypeSafeForm()
class TestForm {
  ///
  final String? firstName;

  ///
  final String? lastName;

  ///
  final String? email;
}

// void test() {
//   final form = Form.unsafe(
//     initialValue: {},
//     builder: (context, state) {
//       return Container();
//     },
//   );

//   final test = TestForm.fromJson({});

//   final safeForm = Form(
//     form: (json) => TestForm.fromJson(json),
//     builder: (context, state) {
//       return Container();
//     },
//   );

//   // TODO Possible alternative syntax
//   // final safeFormAlt = TestForm(
//   //   builder: (context, state) {
//   //     return Container();
//   //   },
//   // );
// }
