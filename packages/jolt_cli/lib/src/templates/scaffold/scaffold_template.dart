import 'dart:io';

import 'package:jolt_cli/src/logger_extension.dart';
import 'package:jolt_cli/src/templates/scaffold/scaffold_bundle.dart';
import 'package:jolt_cli/src/templates/template.dart';
import 'package:mason/mason.dart';

/// {@template dart_cli_template}
/// A Dart CLI application template.
/// {@endtemplate}
class JoltScaffoldTemplate extends Template {
  /// {@macro dart_cli_template}
  JoltScaffoldTemplate()
      : super(
          name: 'scaffold',
          bundle: scaffoldBundle,
          help: 'Add a Jolt Scaffold widget to your project.',
        );

  @override
  Future<void> onGenerateComplete(Logger logger, Directory outputDir) async {
    // await installDartPackages(logger, outputDir);
    // await applyDartFixes(logger, outputDir);
    _logSummary(logger);
  }

  void _logSummary(Logger logger) {
    logger
      ..info('\n')
      ..created('Added the Scaffold widget from Jolt! ⚡')
      ..info('\n');
  }
}
