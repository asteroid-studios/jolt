import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:jolt_cli/src/templates/template.dart';
import 'package:jolt_cli/src/templates/ui/ui_template.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

/// A method which returns a [Future<MasonGenerator>] given a [MasonBundle].
typedef MasonGeneratorFromBundle = Future<MasonGenerator> Function(MasonBundle);

/// A method which returns a [Future<MasonGenerator>] given a [Brick].
typedef MasonGeneratorFromBrick = Future<MasonGenerator> Function(Brick);

///
class InitCommand extends Command<int> {
  /// {@macro create_subcommand}
  InitCommand({
    required this.logger,
    MasonGeneratorFromBundle? generatorFromBundle,
    MasonGeneratorFromBrick? generatorFromBrick,
  })  : _generatorFromBundle = generatorFromBundle ?? MasonGenerator.fromBundle,
        _generatorFromBrick = generatorFromBrick ?? MasonGenerator.fromBrick;

  /// The logger user to notify the user of the command's progress.
  final Logger logger;
  final MasonGeneratorFromBundle _generatorFromBundle;
  final MasonGeneratorFromBrick _generatorFromBrick;

  /// [ArgResults] which can be overridden for testing.
  @visibleForTesting
  ArgResults? argResultOverrides;

  /// Should return the desired template to be created during a command run.
  Template get template => JoltUiTemplate();

  @override
  String get invocation => 'jolt init [arguments]';

  @override
  String get description => 'Initialise Jolt';

  @override
  String get name => 'init';

  @override
  ArgResults get argResults => argResultOverrides ?? super.argResults!;

  Future<MasonGenerator> _getGeneratorForTemplate() async {
    try {
      final brick = Brick.version(
        name: template.bundle.name,
        version: '^${template.bundle.version}',
      );
      logger.detail(
        '''Building generator from brick: ${brick.name} ${brick.location.version}''',
      );
      return await _generatorFromBrick(brick);
    } catch (_) {
      logger.detail('Building generator from brick failed: $_');
    }
    logger.detail(
      '''Building generator from bundle ${template.bundle.name} ${template.bundle.version}''',
    );
    return _generatorFromBundle(template.bundle);
  }

  @override
  Future<int> run() async {
    final template = this.template;
    final generator = await _getGeneratorForTemplate();
    final result = await runInit(generator, template);

    return result;
  }

  /// Invoked by [run] to create the project, contains the logic for using
  /// the template vars obtained by [getTemplateVars] to generate the project
  /// from the [generator] and [template].
  Future<int> runInit(MasonGenerator generator, Template template) async {
    var vars = getTemplateVars();

    final generateProgress = logger.progress('Bootstrapping');
    final dir = Directory('ui');
    final target = DirectoryGeneratorTarget(dir);
    await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
    final files = await generator.generate(target, vars: vars, logger: logger);
    generateProgress.complete('Generated ${files.length} file(s)');

    await template.onGenerateComplete(logger, dir);

    return ExitCode.success.code;
  }

  /// Responsible for returns the template parameters to be passed to the
  /// template brick.
  ///
  /// Override if the create sub command requires additional template
  /// parameters.
  ///
  @mustCallSuper
  Map<String, dynamic> getTemplateVars() {
    return <String, dynamic>{};
  }
}