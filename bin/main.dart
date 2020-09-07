///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 11:14
///
import 'package:no_free_action/constants/constants.dart';
import 'package:no_free_action/checker.dart';
import 'package:no_free_action/event_reader.dart';

Future<void> main(List<String> args) async {
  final ArgParser parser = ArgParser()
    ..addFlag(
      'forked',
      abbr: 'f',
      defaultsTo: true,
      help:
          'Whether required user forked the repository. Defaults to true. Use --no-forked to disable.',
    )
    ..addFlag(
      'starred',
      abbr: 's',
      defaultsTo: true,
      help:
          'Whether required user starred the repository. Defaults to true. Use --no-starred to disable.',
    )
    ..addOption(
      'token',
      abbr: 't',
      help: 'GitHub token.',
    )
    ..addOption(
      'path',
      abbr: 'p',
      help: 'GitHub event path.',
      defaultsTo: '/github/workflow/event.json',
    )
    ..addOption(
      'words',
      abbr: 'w',
      help: 'Reply content.',
      defaultsTo: Constants.words,
    )
    ..addFlag('help', abbr: 'h', help: 'Help usage', defaultsTo: false);

  final ArgResults results = parser.parse(args);

  final IssueEvent event = IssueEvent.fromJson(await readEvent(results));

  Constants.event = event;
  Constants.token = results['token'] as String;
  Constants.isForkRequired = results['forked'] as bool;
  Constants.isStarRequired = results['starred'] as bool;
  Constants.words = results['words'] as String;

  await check();
}
