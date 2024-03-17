import 'package:jolt_cli/src/commands/add/widgets/widgets.dart';
import 'package:jolt_cli/src/templates/templates.dart';

/// {@template very_good_create_dart_cli_command}
/// A [AddSubCommand] for creating Dart command line interfaces.
/// {@endtemplate}
class AddButton extends AddSubCommand {
  /// {@macro very_good_create_dart_cli_command}
  AddButton({
    required super.logger,
    required super.generatorFromBundle,
    required super.generatorFromBrick,
  });

  @override
  String get name => 'button';

  @override
  String get description => 'Add a Jolt Button widget to your project.';

  @override
  Template get template => JoltButtonTemplate();

  @override
  Map<String, dynamic> getTemplateVars() {
    final vars = super.getTemplateVars();

    return vars;
  }
}
