import 'dart:io';

import 'package:jolt_cli/src/logger_extension.dart';
import 'package:jolt_cli/src/templates/button/button_bundle.dart';
import 'package:jolt_cli/src/templates/template.dart';
import 'package:mason/mason.dart';

/// {@template dart_cli_template}
/// A Dart CLI application template.
/// {@endtemplate}
class JoltButtonTemplate extends Template {
  /// {@macro dart_cli_template}
  JoltButtonTemplate()
      : super(
          name: 'button',
          bundle: buttonBundle,
          help: 'Add a Jolt Button widget to your project.',
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
      ..created('Added the Button widget from Jolt! ⚡')
      ..info('\n');
  }
}
