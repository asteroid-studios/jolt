import 'package:macros/macros.dart';

extension ClassTypeBuilderX on MemberDeclarationBuilder {
  Future<void> declareRoute(ClassDeclaration clazz, String path, TypeParameterDeclaration? type) async {
    // final routeMacro = await resolveIdentifier(
    //     Uri.parse('package:example_new/utils/macros/route_macro.dart'), 'TypedGoRouteImplementation');
    // final widget = await typeDeclarationOf(type!.identifier);
    final future = await resolveIdentifier(Uri.parse('dart:async'), 'Future');
    final widgetType = await resolveIdentifier(clazz.library.uri, type?.name ?? '');
    final widget = await typeDeclarationOf(widgetType);
    final goRouter = await resolveIdentifier(Uri.parse('package:go_router/src/router.dart'), 'GoRouter');
    // final goRouterHelper = await resolveIdentifier(Uri.parse('package:go_router/go_router.dart'), 'GoRouterHelper');
    final name = clazz.identifier.name;
    final fields = await fieldsOf(widget);
    final buildContext =
        await resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');

    // Constructor fields
    final constructorFields = fields
        .map((field) => DeclarationCode.fromParts([
              field.type.isNullable ? '' : 'required ',
              field.type.code,
              ' ${field.identifier.name}',
            ]))
        .toList();

    final constructorSetFields = fields
        .map((field) => DeclarationCode.fromParts([
              ' ${field.identifier.name} = ${field.identifier.name},',
            ]))
        .toList();

    // Fields from widget
    final fieldsDeclaration = fields
        .map((field) => DeclarationCode.fromParts([
              '\n\t/// Comment'
                  '\n\tfinal ',
              field.type.code,
              ' ${field.identifier.name};',
            ]))
        .toList();

    // Widget fields
    final widgetFields = fields
        .map((field) => DeclarationCode.fromParts([
              '${field.identifier.name} : ${field.identifier.name},\n\t\t\t',
            ]))
        .toList();

    declareInType(
      DeclarationCode.fromParts(
        [
          '\t$name(',
          if (constructorFields.isNotEmpty) '{',
          ...constructorFields,
          if (constructorFields.isNotEmpty) '}',
          ')',
          if (constructorSetFields.isNotEmpty) ':',
          ...constructorSetFields,
          ' super(\n\t\tpath: ',
          "'$path',\n\t\tbuilder: (context,state){\n\t\t\treturn ",
          widgetType,
          '(',
          if (widgetFields.isNotEmpty) '\n\t\t\t\t',
          ...widgetFields,
          ');\n\t\t},\n\t);\n',
          ...fieldsDeclaration,
          '\n\n\t',
          future,
          '<void> go(',
          buildContext,
          ' context) async {\n\t\t ',
          goRouter,
          ".of(context).go('$path', extra: {});",
          '\n\t}',
        ],
      ),
    );
    // declareType(
    //   routeName,
    //   DeclarationCode.fromParts(
    //     [
    //       // '@',
    //       // routeMacro,
    //       // '()\n',
    //       'class $routeName extends ',
    //       goRoute,
    //       '{\n\t$routeName(): super(\n\t\tpath: ',
    //       "'$path',\n\t\tbuilder: (context,state){\n\t\t\treturn ",
    //       clazz.identifier,
    //       '();\n\t\t},\n\t);\n',
    //       '\n\t',
    //       future,
    //       '<void> go(',
    //       buildContext,
    //       ' context) async {\n\t\t ',
    //       goRouter,
    //       ".of(context).go('$path', extra: {});",
    //       '\n\t}',
    //       '\n}',
    //     ],
    //   ),
    // );
  }
}
// extension ClassTypeBuilderX on ClassTypeBuilder {
//   Future<void> declareRoute(ClassDeclaration clazz, String path) async {
//     // final routeMacro = await resolveIdentifier(
//     //     Uri.parse('package:example_new/utils/macros/route_macro.dart'), 'TypedGoRouteImplementation');
//     final future = await resolveIdentifier(Uri.parse('dart:async'), 'Future');
//     final goRoute = await resolveIdentifier(Uri.parse('package:go_router/go_router.dart'), 'GoRoute');
//     final goRouter = await resolveIdentifier(Uri.parse('package:go_router/go_router.dart'), 'GoRouter');
//     // final goRouterHelper = await resolveIdentifier(Uri.parse('package:go_router/go_router.dart'), 'GoRouterHelper');
//     final name = clazz.identifier.name;
//     final buildContext =
//         await resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');
//     final routeName = '${name}Route'.replaceAll('Page', '').replaceAll('Screen', '');
//     declareType(
//       routeName,
//       DeclarationCode.fromParts(
//         [
//           // '@',
//           // routeMacro,
//           // '()\n',
//           'class $routeName extends ',
//           goRoute,
//           '{\n\t$routeName(): super(\n\t\tpath: ',
//           "'$path',\n\t\tbuilder: (context,state){\n\t\t\treturn ",
//           clazz.identifier,
//           '();\n\t\t},\n\t);\n',
//           '\n\t',
//           future,
//           '<void> go(',
//           buildContext,
//           ' context) async {\n\t\t ',
//           goRouter,
//           ".of(context).go('$path', extra: {});",
//           '\n\t}',
//           '\n}',
//         ],
//       ),
//     );
//   }
// }
