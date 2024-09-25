import 'dart:async';

import 'package:macros/macros.dart';

///
macro class Style implements  ClassDeclarationsMacro {

  ///
  const Style();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz, 
    MemberDeclarationBuilder builder,
  ) async {
    final type =  clazz.typeParameters.firstOrNull?.identifier;
    if(type == null) {
      throw Exception('Missing widget type');
    }
    final widgetType = (await builder.typeDeclarationOf(type)).identifier;

    final name = clazz.identifier.name;
    final fields = await builder.fieldsOf(clazz);
    final fieldsString = StringBuffer();    
    final mergeString = StringBuffer();    
    for(final field in fields) {
      fieldsString.write( '\n\t\t');
      if(!field.type.isNullable) {
        throw Exception('All fields must be nullable in a Style class');
      }
      fieldsString.write( 'this.${field.identifier.name},');
      // TODO just a workaround until I can determine if field type has a merge method
      if(field.identifier.name == 'surfaceStyle') {
        mergeString.write('\n\t\t\t${field.identifier.name}: ${field.identifier.name}?.merge(style?.${field.identifier.name}) ??  style?.${field.identifier.name},');
      } else {
        mergeString.write('\n\t\t\t${field.identifier.name}:  style?.${field.identifier.name} ?? ${field.identifier.name},');
      }
    }
    if(fields.isNotEmpty) {
      fieldsString.write('\n');
      mergeString.write('\n');
    }
    final buildContext = await builder.resolveIdentifier(
      Uri.parse('package:flutter/src/widgets/framework.dart'), 
      'BuildContext',
    );
    final inheritedStyle = await builder.resolveIdentifier(
      Uri.parse('package:jolt/jolt.dart'), 
    'InheritedStyle',
    );  
    builder.declareInType(DeclarationCode.fromParts([
        // Default constructor
        '\t/// Default comment for style constructor\n',
        '\tconst $name({$fieldsString\t});',
        // Merge function
        '\n\n\t/// Comment for merge method\n',
        '\t$name merge($name? style) {',
          '\n\t\treturn $name($mergeString',
        '\t\t);',
        '\n\t}',
        // Resolve method
        '\n\n\t/// Comment for resolve method\n',
        '\t $name resolve(\n\t\t',
        buildContext,
        ' context,\n\t\t',
        widgetType,
        ' widget,\n\t\t',
        '$name? Function(',
        buildContext,
        ' context,',
        widgetType,
        ' widget)? inlineStyle,',
        '\n\t) {\n',
        '\t\treturn defaultStyle(context,widget)',
        '\n\t\t\t\t\t.merge(',
        inheritedStyle,
        '.maybeOf<$name>(context))\n\t\t\t\t\t.merge(inlineStyle?.call(context,widget));\n\t}',
      ]),
    );
  }
}
