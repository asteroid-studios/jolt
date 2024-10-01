import 'dart:async';

import 'package:macros/macros.dart';
import 'package:ui/macros/form_macro.dart';
import 'package:ui/macros/macro_helpers.dart';

final _dartCore = Uri.parse('dart:core');

///
macro class Style implements  ClassDeclarationsMacro {

  ///
  const Style();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
  
    builder.declareInType(DeclarationCode.fromParts([
        // TODO this don't work yet
        // Define resolver
        // '\n\n\t/// Comment for resolver\n',
        // '\tfinal ',
        // classIdentifier,
        // '? Function(',
        // classIdentifier,
        // '? style)? resolver;',      
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

    await builder.declareConstructor(clazz);
    await builder.declareResolve(clazz);
    // await builder.declareToJson(clazz);
    // await builder.declareFromJson(clazz);

    await _buildMerge(clazz, builder);
  }

  
  // TODO copyWith. Will have same issue as merge
  Future<void> _buildMerge( 
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
    final name = clazz.identifier.name;
    final fields = await builder.fieldsOf(clazz);
    // TODO just a workaround until I can determine if field type has a merge method
    final mergeableFields = ['surfaceStyle','labelStyle'];
    // final print = await builder.resolveIdentifier(_dartCore, 'print');
    builder.declareInType(
      DeclarationCode.fromParts([
        '\n\t/// Comment for merge method\n',
        '\t$name merge($name? style) {',
        '\n\t\treturn $name(',
        for(final field in fields) 
          DeclarationCode.fromParts(
            field.identifier.name == 'resolver' ? [
              '\n\t\t\t${field.identifier.name}: (resolvedStyle) {',
              '\n\t\t\t\tfinal resolved = ${field.identifier.name}?.call(resolvedStyle);',
              '\n\t\t\t\tfinal styleResolved =  style?.resolver?.call(resolved);',
              '\n\t\t\t\treturn styleResolved ?? resolved ?? resolvedStyle;',
              '\n\t\t\t},',
            ] : mergeableFields.contains(field.identifier.name) ? [
              '\n\t\t\t${field.identifier.name}: ${field.identifier.name}?.merge(style?.${field.identifier.name}) ??  style?.${field.identifier.name},',
            ] : [
              '\n\t\t\t${field.identifier.name}:  style?.${field.identifier.name} ?? ${field.identifier.name},',
            ],
          ),        
        '\n\t\t);',
        '\n\t}',
      ]),
    );
  }
}
