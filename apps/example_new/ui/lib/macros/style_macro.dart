import 'dart:async';

import 'package:macro_util/macro_util.dart';
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
     final print = await builder.resolveIdentifier(_dartCore, 'print');
    final name = clazz.identifier.name;
     final fieldsData = await builder.introspectFields(clazz);
    //  final ids = await ResolvedIdentifiers.resolve(builder);
    final fields = await builder.fieldsOf(clazz);
    final fieldsString = StringBuffer();    
    final mergeString = StringBuffer();    
    final mergeableFields = [
      'surfaceStyle','labelStyle',
    ];
    // TODO copyWith. Will have same issue as merge
    for(final field in fields) {
      fieldsString.write( '\n\t\t');
      if(!field.type.isNullable) {
        throw Exception('All fields must be nullable in a Style class');
      }
      fieldsString.write( 'this.${field.identifier.name},');
      // TODO just a workaround until I can determine if field type has a merge method
      if(field.identifier.name == 'resolver') {        
        // TODO create a new function which calls functions in order.
        mergeString.write('\n\t\t\t${field.identifier.name}: (style) {\n\t\t\t\treturn style?.resolver?.call(resolver?.call(this));\n\t\t\t}');
      }
     else if(mergeableFields.contains(field.identifier.name)) {        
        mergeString.write('\n\t\t\t${field.identifier.name}: ${field.identifier.name}?.merge(style?.${field.identifier.name}) ??  style?.${field.identifier.name},');
      }else {
        mergeString.write('\n\t\t\t${field.identifier.name}:  style?.${field.identifier.name} ?? ${field.identifier.name},');
      }
    }
    if(fields.isNotEmpty) {
      fieldsString.write('\n');
      // fieldsString.write('\n\t\tthis.resolver,\n');
      mergeString.write('\n');
    }
    final buildContext = await builder.resolveIdentifier(
      Uri.parse('package:flutter/src/widgets/framework.dart'), 
      'BuildContext',
    );
    // final inheritedStyle = await builder.resolveIdentifier(
    //   Uri.parse('package:jolt/jolt.dart'), 
    // 'InheritedStyle',
    // );  
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

        // Merge function
        '\n\n\t/// Comment for merge method\n',
        '\t$name merge($name? style) {',
          '\n\t\treturn $name($mergeString',
        '\t\t);',
        '\n\t}',
        
        // Resolve method
        '\n\n\t/// Comment for resolve method\n',
        '\t$name resolve(\n\t\t',
        buildContext,
        ' context,\n\t\t',
        // widgetType,
        // ' widget,\n\t\t',
        // '$name? Function(',
        // buildContext,
        // ' context, ',
        // widgetType,
        // ' widget)? inlineStyle,',
        '$name? inheritedStyle,\n',
        '\t\t$name? inlineStyle,',
        '\n\t) {\n',
        // '\t\treturn defaultStyle(context,widget)',
        '\t\treturn merge(',
        // inheritedStyle,
        'inheritedStyle).merge(inlineStyle);\n\t}',

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
  }
  
  
}
