import 'package:macros/macros.dart';

final _dartCore = Uri.parse('dart:core');

///
extension MacroDeclarationX on MemberDeclarationBuilder {
  ///
  Future<void> declareConstructor(
    ClassDeclaration clazz, {
    bool isStyle = false,
  }) async {
    final name = clazz.identifier.name;
    final fields = await fieldsOf(clazz);
    declareInType(
      DeclarationCode.fromParts([
        '\n\t/// Default comment for constructor\n',
        '\tconst $name({',
        if (isStyle) '\n\t\tthis.resolver,',
        for (final field in fields)
          DeclarationCode.fromParts(
            [
              '\n\t\t${field.type.isNullable ? '' : 'required '}this.${field.identifier.name},',
            ],
          ),
        '\n\t});',
      ]),
    );
  }

  ///
  Future<void> declareFieldKeys(ClassDeclaration clazz) async {
    final fields = await fieldsOf(clazz);
    for (final field in fields) {
      declareInType(
        DeclarationCode.fromParts([
          '\n\t/// Comment for ${field.identifier.name} key\n',
          "\tstatic const ${field.identifier.name}Key = '${field.identifier.name}';",
        ]),
      );
    }
  }

  ///
  Future<void> declareToJson(ClassDeclaration clazz) async {
    // final name = clazz.identifier.name;
    final map = await resolveIdentifier(_dartCore, 'Map');
    final string = await resolveIdentifier(_dartCore, 'String');
    final dynamicType = await resolveIdentifier(_dartCore, 'dynamic');
    declareInType(
      DeclarationCode.fromParts([
        '\n\t/// Default comment for toJson\n\t',
        map,
        '<',
        string,
        ',',
        dynamicType,
        '> ',
        // Map<String,dynamic>
        'toJson(){\n',
        '\t\treturn {};',
        '\n\t}',
      ]),
    );
  }

  ///
  Future<void> declareFromJson(ClassDeclaration clazz) async {
    final name = clazz.identifier.name;
    final map = await resolveIdentifier(_dartCore, 'Map');
    final string = await resolveIdentifier(_dartCore, 'String');
    final dynamicType = await resolveIdentifier(_dartCore, 'dynamic');
    final fields = (await fieldsOf(clazz)).map((field) {
      final code = field.type.code;
      return DeclarationCode.fromParts([
        "\n\t\t\t${field.identifier.name}: json['${field.identifier.name}'] as ",
        code,
        ',',
      ]);
    }).toList();
    declareInType(
      DeclarationCode.fromParts([
        '\n\t/// Default comment for fromJson',
        '\n\tfactory $name.fromJson(',
        map,
        '<',
        string,
        ', ',
        dynamicType,
        '> json) {\n\t\treturn $name(',
        ...fields,
        '\n\t\t);\n\t}',
      ]),
    );
  }

  ///
  Future<void> declareResolve(
    ClassDeclaration clazz,
  ) async {
    final name = clazz.identifier.name;
    final buildContext =
        await resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');
    final inheritedStyle = await resolveIdentifier(Uri.parse('package:jolt/jolt.dart'), 'InheritedStyle');
    declareInType(
      DeclarationCode.fromParts([
        '\n\n\t/// Comment for resolve method\n',
        '\t$name resolve(\n\t\t',
        buildContext,
        ' context,\n',
        '\t\t$name? inlineStyle,',
        '\n\t) {\n',
        '\t\treturn merge(',
        inheritedStyle,
        '.maybeOf<$name>(context)).merge(inlineStyle);\n\t}',
      ]),
    );
  }

  ///
  Future<void> declareMerge(ClassDeclaration clazz) async {
    final name = clazz.identifier.name;
    // final print = await resolveIdentifier(_dartCore, 'print');

    // TODO just a workaround until I can determine if field type has a merge method
    final mergeableFields = ['surfaceStyle', 'labelStyle'];
    final resolver = DeclarationCode.fromParts([
      '\n\t\t\tresolver: (resolvedStyle, context) {\n\t\t\t\t',
      'final resolved = resolver?.call(resolvedStyle, context);',
      '\n\t\t\t\tfinal styleResolved =  style?.resolver?.call(resolved, context);',
      '\n\t\t\t\treturn styleResolved ?? resolved ?? resolvedStyle;',
      '\n\t\t\t},',
    ]);
    final fields = (await fieldsOf(clazz)).map((field) {
      return DeclarationCode.fromParts(
        mergeableFields.contains(field.identifier.name)
            ? [
                '\n\t\t\t${field.identifier.name}: ${field.identifier.name}?.merge(style?.${field.identifier.name}) ??  style?.${field.identifier.name},',
              ]
            : [
                '\n\t\t\t${field.identifier.name}:  style?.${field.identifier.name} ?? ${field.identifier.name},',
              ],
      );
    }).toList();
    declareInType(
      DeclarationCode.fromParts([
        '\n\t/// Comment for merge method\n',
        '\t$name merge($name? style) {',
        '\n\t\treturn $name(',
        resolver,
        ...fields,
        '\n\t\t);',
        '\n\t}',
      ]),
    );
  }
}
