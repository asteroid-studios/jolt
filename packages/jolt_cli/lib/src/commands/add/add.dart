import 'package:args/command_runner.dart';
import 'package:jolt_cli/src/commands/add/widgets/widgets.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

///
class AddCommand extends Command<int> {
  AddCommand({
    required Logger logger,
    @visibleForTesting MasonGeneratorFromBundle? generatorFromBundle,
    @visibleForTesting MasonGeneratorFromBrick? generatorFromBrick,
  }) {
    // jolt add button <args>
    addSubcommand(
      AddButton(
        logger: logger,
        generatorFromBundle: generatorFromBundle,
        generatorFromBrick: generatorFromBrick,
      ),
    );
  }

  @override
  String get summary => '$invocation\n$description';

  @override
  String get description => 'Add a Jolt widget from the available templates.';

  @override
  String get name => 'add';

  @override
  String get invocation => 'jolt add <subcommand> [arguments]';
}
