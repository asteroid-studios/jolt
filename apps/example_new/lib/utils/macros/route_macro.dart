

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
    final identifiers = await GoRouterIdentifiers.get(builder);
    await builder.declareRoute(clazz,path, identifiers);
    await builder.declareBuilder(clazz,path, identifiers);
    await builder.declareNavigationMethod(clazz,path, identifiers, navMethod: 'go');
    await builder.declareNavigationMethod(clazz,path, identifiers, navMethod: 'push');
  }
}



// TODO https://github.com/dart-lang/sdk/issues/56410
macro class PathParam implements  FieldDeclarationsMacro{
  /// Path params will be included in the path 
  /// 
  /// The order which you specify path params is the order which they will appear in the path
  const PathParam();
  
  @override
  FutureOr<void> buildDeclarationsForField(FieldDeclaration field, MemberDeclarationBuilder builder) {
    
  // TODO use this macro to add doc comments explaining its a path param
  }

}

// TODO https://github.com/dart-lang/sdk/issues/56410
macro class HiddenParam  implements  FieldDeclarationsMacro{
  /// Hidden params will be included in the path, they can only be used when navigating programmatically
  /// 
  /// For example calling go or push, the hidden params will be passed as extra arguments
  const HiddenParam();

    @override
  FutureOr<void> buildDeclarationsForField(FieldDeclaration field, MemberDeclarationBuilder builder) {
  // TODO use this macro to add doc comments explaining its a hidden param
    
  }
}
