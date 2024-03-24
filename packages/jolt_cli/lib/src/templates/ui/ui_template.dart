import 'dart:io';

import 'package:jolt_cli/src/logger_extension.dart';
import 'package:jolt_cli/src/templates/templates.dart';
import 'package:mason/mason.dart';

/// {@template dart_cli_template}
/// A Dart CLI application template.
/// {@endtemplate}
class JoltUiTemplate extends Template {
  /// {@macro dart_cli_template}
  JoltUiTemplate()
      : super(
          name: 'init',
          bundle: uiBundle,
          help: 'Initialise Jolt in your project',
        );

  @override
  Future<void> onGenerateComplete(Logger logger, Directory outputDir) async {
    // TODO test and put back
    // await installDartPackages(logger, outputDir);
    await applyDartFixes(logger, outputDir);
    _logSummary(logger);
  }

  void _logSummary(Logger logger) {
    logger
      ..info('\n')
      ..created('Initialised Jolt! ⚡')
      ..info('\n');
  }
}
