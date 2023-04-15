import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:flutter/material.dart';

bool _isTextWidget(DartType type) {
  return type == Text;
  // TODO refactor to use TypeChecker
  // TODO is it safe?
  final element = type.element! as ClassElement;
  final source = element.librarySource.uri;

  final isProviderBase = source.scheme == 'package' &&
      // TODO handle flutter_riverpod
      source.pathSegments.first == 'riverpod' &&
      element.name == 'ProviderBase';

  return isProviderBase || element.allSupertypes.any(_isProvider);
}

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _JoltLint());
}

class _JoltLint extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult resolvedUnitResult) async* {
    final library = resolvedUnitResult.libraryElement;
    print('This is a print');
    final textWidgets = library.topLevelElements
        .whereType<VariableElement>()
        .where((e) => !e.isFinal)
        .where((e) => _isTextWidget(e.type))
        .toList();

    for (final provider in providers) {
      if (provider.name == 'fail') throw StateError('Nani?');

      yield Lint(
        code: 'use_jolt_text',
        message:
            'JoltText should always be used instead of the standard Text widget',
        location: provider.nameLintLocation!,
      );
    }
  }
}
