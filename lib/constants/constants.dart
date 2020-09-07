///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 11:21
///
import 'package:no_free_action/models/data_model.dart';

export 'package:args/args.dart';
export 'package:meta/meta.dart';

export '../models/data_model.dart';
export '../utils/http_utils.dart';

const String baseUrl = 'https://api.github.com';

class Constants {
  const Constants._();

  static IssueEvent event;

  static String token;
  static String get login => event.issue.user.login;
  static String get fullRepoName => event.repository.full_name;
  static bool isForkRequired;
  static bool isStarRequired;
  static String words = 'Please file the issue after you starred and forked the repo. Thanks! 🙂';
}
