import 'dart:async';

import 'package:macros/macros.dart';
import 'package:ui/macros/macro_helpers.dart';


///
macro class Style implements  ClassDeclarationsMacro {

  ///
  const Style();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
     final buildContext =
        await builder.resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');
    builder.declareInType(DeclarationCode.fromParts([
        // TODO this don't work yet
        // Define resolver
        '\n\n\t/// Comment for resolver\n',
        '\tfinal ',
        clazz.identifier,
        '? Function(\n\t\t',
        clazz.identifier,
        '? style,\n\t\t',
        buildContext,
        ' context,',
        '\n\t)? resolver;',      
        // TODO think issues stem from not importing stuff.
        // TODO issue where this is there but not called, think I should reference freezed to see how done
        // To String
        // '\n\n\t@override\n\tString toString() {\n\t\treturn \'$name(',
        // fields.map((field) => '${field.identifier.name}: \$${field.identifier.name}').join(', '),
        // ')\';\n\t}',
        // Copy with
        // TODO cannot resolve identifiers yet, come back to copy with
//         '\n\n\t$name copyWith({\n',
//         fields.map((field)  {
// final type = fieldsData[field.identifier.name]?.fieldDeclaration.type;
//           // final type = builder.resolveIdentifier(field.type.li, name) field.type;
//           return '\t\t${type}${field.type.isNullable ? '?' : ''} ${field.identifier.name}';          
//         }).join(', \n'),
//         '\n\t}){\n\t\treturn $name(\n',
//         fields.map((field) => '\t\t\t${field.identifier.name}: ${field.identifier.name} ?? this.${field.identifier.name}').join(', \n'),
//         '\n\t\t);',
//         '\n\t}',
      ]),
    );

    await builder.declareConstructor(clazz, isStyle: true);
    await builder.declareMerge(clazz);
    await builder.declareResolve(clazz);
    await builder.declareCopyWith(clazz, isStyle: true);
    // await builder.declareToJson(clazz);
    // await builder.declareFromJson(clazz);

    // await _buildMerge(clazz, builder);
  }
}
