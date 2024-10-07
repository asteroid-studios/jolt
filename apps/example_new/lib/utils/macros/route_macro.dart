

import 'dart:async';

import 'package:example_new/utils/macros/app_macro_helpers.dart';
import 'package:macros/macros.dart';

///
macro class TypeSafeRoute implements  ClassDeclarationsMacro {
  ///
  const TypeSafeRoute({required this.path});

  final String path;

  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    await builder.declareRoute(clazz,path);
  }
}
