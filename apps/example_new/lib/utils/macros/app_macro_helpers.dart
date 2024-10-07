import 'package:macros/macros.dart';

extension ClassTypeBuilderX on MemberDeclarationBuilder {
  Future<void> declareRoute(ClassDeclaration clazz, String path) async {
    final future = await resolveIdentifier(Uri.parse('dart:async'), 'Future');
    final string = await resolveIdentifier(Uri.parse('dart:core'), 'String');
    final goRouter = await resolveIdentifier(Uri.parse('package:go_router/src/router.dart'), 'GoRouter');
    final name = clazz.identifier.name;
    final routeName = '${name[0].toLowerCase()}${name.substring(1)}Route';
    final fields = await fieldsOf(clazz);
    final buildContext =
        await resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');

    // // Constructor fields
    final constructorFields = fields
        .map((field) => DeclarationCode.fromParts([
              newLine(2),
              field.type.isNullable ? '' : 'required ',
              field.type.code,
              ' ${field.identifier.name},',
            ]))
        .toList();

    // final constructorSetFields = fields
    //     .map((field) => DeclarationCode.fromParts([
    //           ' ${field.identifier.name} = ${field.identifier.name},',
    //         ]))
    //     .toList();

    // // Fields from widget
    // final fieldsDeclaration = fields
    //     .map((field) => DeclarationCode.fromParts([
    //           '\n\t/// Comment'
    //               '\n\tfinal ',
    //           field.type.code,
    //           ' ${field.identifier.name};',
    //         ]))
    //     .toList();

    // // Widget fields
    // final widgetFields = fields
    //     .map((field) => DeclarationCode.fromParts([
    //           '${field.identifier.name} : ${field.identifier.name},\n\t\t\t',
    //         ]))
    //     .toList();

    declareInType(
      DeclarationCode.fromParts(
        [
          // TODO add constructor from state
          // '\t$name(',
          // if (constructorFields.isNotEmpty) '{',
          // ...constructorFields,
          // if (constructorFields.isNotEmpty) '}',
          // ')',
          // if (constructorSetFields.isNotEmpty) ':',
          // ...constructorSetFields,
          // ' super(\n\t\tpath: ',
          // "'$path',\n\t\tbuilder: (context,state){\n\t\t\treturn ",
          // widgetType,
          // '(',
          // if (widgetFields.isNotEmpty) '\n\t\t\t\t',
          // ...widgetFields,
          // ');\n\t\t},\n\t);\n',
          // ...fieldsDeclaration,
          // '\n\n\t',

          newLine(),
          '/// ',
          newLine(),
          // TODO add path params to path
          'static ',
          string,
          " get path => '$path';",
          newLine(),

          newLine(),
          '/// ',
          newLine(),
          'static ',
          string,
          " get routeName => '$routeName';",
          newLine(),

          // TODO support path and query parameters
          newLine(),
          '///',
          newLine(),
          'static ',
          future,
          '<void> go(',
          newLine(2),
          buildContext,
          ' context,',
          if (constructorFields.isNotEmpty) ' {',
          ...constructorFields,
          newLine(),
          if (constructorFields.isNotEmpty) '}',
          ') async {',
          newLine(2),
          goRouter,
          '.of(context).goNamed(',
          newLine(3),
          "'$routeName',",
          newLine(3),
          'pathParameters: {},',
          newLine(3),
          'queryParameters: {},',
          newLine(3),
          'extra: {},',
          newLine(2),
          ');',
          '\n\t}',
          newLine(),

          // TODO support path and query parameters
          newLine(),
          '///',
          newLine(),
          'static ',
          future,
          '<void> push(',
          newLine(2),
          buildContext,
          ' context,',
          if (constructorFields.isNotEmpty) ' {',
          ...constructorFields,
          newLine(),
          if (constructorFields.isNotEmpty) '}',
          ') async {',
          newLine(2),
          goRouter,
          '.of(context).pushNamed(',
          newLine(3),
          "'$routeName',",
          newLine(3),
          'pathParameters: {},',
          newLine(3),
          'queryParameters: {},',
          newLine(3),
          'extra: {},',
          newLine(2),
          ');',
          '\n\t}',
          newLine(),
        ],
      ),
    );
  }
}

/// Returns a new line with the given level of indentation.
String newLine([int? level]) => '\n${'\t' * (level ?? 1)}';
