import 'package:macros/macros.dart';

extension ClassTypeBuilderX on MemberDeclarationBuilder {
  Future<void> declareRoute(
    ClassDeclaration clazz,
    String path,
    GoRouterIdentifiers identifiers,
  ) async {
    final name = clazz.identifier.name;
    final routeName = '${name[0].toLowerCase()}${name.substring(1)}Route';
    final fields = await fieldsOf(clazz);
    final pathParams = fields.pathParams;
    final updatedPath = pathParams.fold<String>(
      path,
      (previousValue, element) => '$previousValue${previousValue == '/' ? '' : '/'}:${element.identifier.name}',
    );

    declareInType(
      DeclarationCode.fromParts(
        [
          newLine(),
          '/// ',
          newLine(),
          'static ',
          identifiers.string,
          // " get path => '${path == '/' ? '/' : '$path-${pathParams.isEmpty ? 'empty' : 'not'}'}';",
          " get path => '$updatedPath';",
          newLine(),
          newLine(),
          '/// ',
          newLine(),
          'static ',
          identifiers.string,
          " get name => '$routeName';",
        ],
      ),
    );
  }

  Future<void> declareBuilder(
    ClassDeclaration clazz,
    String path,
    GoRouterIdentifiers identifiers,
  ) async {
    final name = clazz.identifier.name;
    final fields = await fieldsOf(clazz);
    // TODO based on the type of the field, we should cast from String to correct type
    // For example bool.fromString()
    // For example int.fromString()
    // For example double.fromString()
    final params = fields.map(
      (field) {
        final metadata = field.metadata.firstOrNull as ConstructorMetadataAnnotation?;
        final isPathParam = metadata?.type.identifier.name == 'PathParam';
        final isHidden = metadata?.type.identifier.name == 'HiddenParam';
        return DeclarationCode.fromParts([
          newLine(2),
          'final ${field.identifier.name} = ',
          if (isPathParam)
            'state.pathParameters['
          else if (isHidden)
            DeclarationCode.fromParts([
              '(state.extra as ',
              identifiers.map,
              '<',
              identifiers.string,
              ',',
              identifiers.string,
              '>)[',
            ])
          else
            'state.uri.queryParameters[',
          "'${field.identifier.name}'] as ",
          field.type.code,
          ';',
        ]);
      },
    ).toList();
    final usedFields = fields
        .map((field) => DeclarationCode.fromParts([
              newLine(3),
              field.identifier.name,
              ': ',
              field.identifier.name,
              ',',
            ]))
        .toList();
    declareInType(
      DeclarationCode.fromParts([
        newLine(),
        '///',
        newLine(),
        'static $name builder(',
        newLine(2),
        identifiers.buildContext,
        ' context,',
        newLine(2),
        identifiers.goRouterState,
        ' state,',
        newLine(),
        ') {',
        ...params,
        newLine(2),
        'return $name(',
        ...usedFields,
        if (fields.isNotEmpty) newLine(2),
        ');',
        newLine(),
        '}',
      ]),
    );
  }

  Future<void> declareNavigationMethod(
    ClassDeclaration clazz,
    String path,
    GoRouterIdentifiers identifiers, {
    required String navMethod,
  }) async {
    final name = clazz.identifier.name;
    final routeName = '${name[0].toLowerCase()}${name.substring(1)}Route';
    final fields = await fieldsOf(clazz);
    final pathParams = fields.pathParams.toMapDeclarations;
    final queryParams = fields.queryParams.toMapDeclarations;
    final hiddenParams = fields.hiddenParams.toMapDeclarations;
    final constructorFields = fields
        .map(
          (field) => DeclarationCode.fromParts([
            newLine(2),
            if (field.type.isNullable) '' else 'required ',
            field.type.code,
            ' ${field.identifier.name},',
          ]),
        )
        .toList();

    declareInType(
      DeclarationCode.fromParts([
        newLine(),
        '///',
        newLine(),
        'static ',
        identifiers.future,
        '<void> $navMethod(',
        newLine(2),
        identifiers.buildContext,
        ' context,',
        if (fields.isNotEmpty) ' {',
        ...constructorFields,
        newLine(),
        if (fields.isNotEmpty) '}',
        ') async {',
        newLine(2),
        identifiers.goRouter,
        '.of(context).${navMethod}Named(',
        newLine(3),
        "'$routeName',",
        newLine(3),
        'pathParameters: {',
        ...pathParams,
        if (pathParams.isNotEmpty) newLine(3),
        '},',
        newLine(3),
        'queryParameters: {',
        ...queryParams,
        if (queryParams.isNotEmpty) newLine(3),
        '},',
        newLine(3),
        'extra: {',
        ...hiddenParams,
        if (hiddenParams.isNotEmpty) newLine(3),
        '},',
        newLine(2),
        ');',
        '\n\t}',
      ]),
    );
  }
}

/// Returns a new line with the given level of indentation.
String newLine([int? level]) => '\n${'\t' * (level ?? 1)}';

class GoRouterIdentifiers {
  GoRouterIdentifiers({
    required this.goRouter,
    required this.buildContext,
    required this.future,
    required this.string,
    required this.map,
    required this.goRouterState,
  });

  static Future<GoRouterIdentifiers> get(MemberDeclarationBuilder builder) async {
    final future = await builder.resolveIdentifier(Uri.parse('dart:async'), 'Future');
    final string = await builder.resolveIdentifier(Uri.parse('dart:core'), 'String');
    final map = await builder.resolveIdentifier(Uri.parse('dart:core'), 'Map');
    final goRouter = await builder.resolveIdentifier(Uri.parse('package:go_router/src/router.dart'), 'GoRouter');
    final goRouterState =
        await builder.resolveIdentifier(Uri.parse('package:go_router/src/state.dart'), 'GoRouterState');
    final buildContext =
        await builder.resolveIdentifier(Uri.parse('package:flutter/src/widgets/framework.dart'), 'BuildContext');

    return GoRouterIdentifiers(
      goRouter: goRouter,
      goRouterState: goRouterState,
      buildContext: buildContext,
      future: future,
      string: string,
      map: map,
    );
  }

  final Identifier goRouter;
  final Identifier buildContext;
  final Identifier future;
  final Identifier string;
  final Identifier map;
  final Identifier goRouterState;
}

extension ParamsX on List<FieldDeclaration> {
  List<FieldDeclaration> get pathParams => where((field) {
        final metadata = field.metadata.firstOrNull as ConstructorMetadataAnnotation?;
        return metadata?.type.identifier.name == 'PathParam';
      }).toList();

  List<FieldDeclaration> get queryParams => where((field) {
        final metadata = field.metadata.firstOrNull as ConstructorMetadataAnnotation?;
        return metadata == null;
      }).toList();

  List<FieldDeclaration> get hiddenParams => where((field) {
        final metadata = field.metadata.firstOrNull as ConstructorMetadataAnnotation?;
        return metadata?.type.identifier.name == 'HiddenParam';
      }).toList();

  Iterable<DeclarationCode> get toMapDeclarations => map(
        (p) => DeclarationCode.fromParts([
          newLine(4),
          'if (${p.identifier.name} != null) ',
          "'${p.identifier.name}'",
          ' : ',
          p.identifier.name,
          '.toString(),',
        ]),
      );
}
