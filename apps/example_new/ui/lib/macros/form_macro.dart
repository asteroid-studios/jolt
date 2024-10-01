import 'dart:async';
import 'package:macros/macros.dart';
import 'package:ui/macros/macro_helpers.dart';

///
macro class TypeSafeForm implements  ClassDeclarationsMacro, ClassTypesMacro {

  ///
  const TypeSafeForm();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
    await builder.declareConstructor(clazz);
    await builder.declareToJson(clazz);
    await builder.declareFromJson(clazz);
    await builder.declareFieldKeys(clazz);
  }
  
  
  
  @override
  FutureOr<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder)  async{
    final jsonSerializable =await  builder.resolveIdentifier(Uri.parse('package:ui/widgets/form/form.dart'), 'JsonSerializable');
    builder.appendInterfaces([NamedTypeAnnotationCode(name: jsonSerializable)]);
  }
}
