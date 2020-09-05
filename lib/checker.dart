///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 14:00
///
import 'package:no_free_action/constants/constants.dart';

import 'action.dart';

Future<void> check({
  ArgResults args,
  IssueEvent event,
}) async {
  final bool isForkRequired = args['forked'] as bool;
  final bool isStarRequired = args['starred'] as bool;
  if (!isForkRequired && !isStarRequired) {
    print('Nothing to check. Phew!');
    return;
  }

  final String token = args['token'] as String;
  final String login = event.issue.user.login;
  final String fullRepoName = event.repository.full_name;

  final Repository repo = await HttpUtils.fetch<Repository>(
    url: '$baseUrl/repos/$fullRepoName',
    fetchType: FetchType.get,
    headers: <String, dynamic>{'Authorization': 'Bearer $token'},
  );
  if (repo == null) {
    return;
  }
  final List<dynamic> requests = await Future.wait(<Future>[
    HttpUtils.fetchModels<Repository>(
      url: repo.forks_url,
      fetchType: FetchType.get,
      queryParameters: <String, dynamic>{
        'per_page': repo.forks_count,
      },
      headers: <String, dynamic>{'Authorization': 'Bearer $token'},
    ),
    HttpUtils.fetchModels<User>(
      url: repo.stargazers_url,
      fetchType: FetchType.get,
      queryParameters: <String, dynamic>{
        'per_page': repo.stargazers_count,
      },
      headers: <String, dynamic>{'Authorization': 'Bearer $token'},
    ),
  ]);

  final List<Repository> forks = requests[0] as List<Repository>;
  final List<User> stargazers = requests[1] as List<User>;
  final Iterable<Repository> filteredForks = forks?.where((Repository repo) {
    return repo.full_name.contains(login);
  });
  final Iterable<User> filteredStargazers = stargazers?.where((User user) {
    return user.login.contains(login);
  });

  final bool isForked = filteredForks?.isNotEmpty ?? false;
  final bool isStarred = filteredStargazers?.isNotEmpty ?? false;
  print(
    '\nUser    : $login'
    '\nForked  : $isForked'
    '\nStarred : $isStarred'
    '\n',
  );

  if ((isForkRequired && !isForked) || (isStarRequired && !isStarred)) {
    final bool isCommented = await tips(
      token: token,
      event: event,
      repo: fullRepoName,
      tips: args['words'] as String,
    );
    if (isCommented) {
      final bool isClosed = await close(
        token: token,
        event: event,
      );
      if (isClosed) {
        await lock(
          token: token,
          event: event,
          repo: fullRepoName,
        );
      }
    }
  }
}
