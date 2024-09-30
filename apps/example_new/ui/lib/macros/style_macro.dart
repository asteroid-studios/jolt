import 'dart:async';

import 'package:macros/macros.dart';

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
    final classIdentifier = clazz.identifier;
    final name = clazz.identifier.name;
    //  final ids = await ResolvedIdentifiers.resolve(builder);
    final fields = await builder.fieldsOf(clazz);
    final fieldsString = StringBuffer();    
  
    for(final field in fields) {
      fieldsString.write( '\n\t\t');
      if(!field.type.isNullable) {
        throw Exception('All fields must be nullable in a Style class');
      }
      fieldsString.write( 'this.${field.identifier.name},');
    }
    if(fields.isNotEmpty) {
      fieldsString.write('\n');
      // fieldsString.write('\n\t\tthis.resolver,\n');
    }
 
 
    
    builder.declareInType(DeclarationCode.fromParts([
        // Default constructor
        '\t/// Default comment for style constructor\n',
        '\tconst $name({$fieldsString\t});',

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

    await _buildResolve(clazz,builder);
    await _buildMerge(clazz, builder);
  }

  Future<void> _buildResolve( 
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
    final buildContext = await builder.resolveIdentifier(
      Uri.parse('package:flutter/src/widgets/framework.dart'), 
      'BuildContext',
    );
    final print = await builder.resolveIdentifier(_dartCore, 'print');
    final name = clazz.identifier.name;
    final inheritedStyle = await builder.resolveIdentifier(
      Uri.parse('package:jolt/jolt.dart'), 
      'InheritedStyle',
    );  
    builder.declareInType(
      DeclarationCode.fromParts([
        '\n\n\t/// Comment for resolve method\n',
        '\t$name resolve(\n\t\t',
        buildContext,
        ' context,\n',
        '\t\t$name? inlineStyle,',
        '\n\t) {\n',
        '\t\treturn merge(',
        inheritedStyle,
        // inheritedStyle,
        '.maybeOf<$name>(context)).merge(inlineStyle);\n\t}',
      ]),
    );
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
