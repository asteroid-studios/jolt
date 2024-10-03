

import 'dart:async';

import 'package:example_new/utils/macros/app_macro_helpers.dart';
import 'package:macros/macros.dart';

///
macro class TypedGoRoute implements  ClassDeclarationsMacro, ClassTypesMacro {
  ///
  const TypedGoRoute({required this.path});

  final String path;

  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    await builder.declareRoute(clazz,path, clazz.typeParameters.firstOrNull);
  }
  

  
  @override
  FutureOr<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder)  async{
    final goRoute = await builder.resolveIdentifier(Uri.parse('package:go_router/src/route.dart'), 'GoRoute');
    builder.extendsType(NamedTypeAnnotationCode(name: goRoute));
  }
}
