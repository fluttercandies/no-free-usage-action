///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 14:00
///
import 'package:no_free_action/constants/constants.dart';

import 'action.dart';

Future<void> check() async {
  if (!Constants.isForkRequired && !Constants.isStarRequired) {
    print('Nothing to check. Phew!');
    return;
  }

  final String token = args['token'] as String;
  final String login = event.issue.user.login;
  final String fullRepoName = event.repository.full_name;

  final Repository repo = await HttpUtils.fetch<Repository>(
    url: '$baseUrl/repos/${Constants.fullRepoName}',
    fetchType: FetchType.get,
    headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
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
    '\nUser    : ${Constants.login}'
    '\nForked  : $isForked'
    '\nStarred : $isStarred'
    '\n',
  );

  if ((Constants.isForkRequired && !isForked) ||
      (Constants.isStarRequired && !isStarred)) {
    final bool isCommented = await tips();
    if (isCommented) {
      final bool isClosed = await close();
      if (isClosed) {
        await lock();
      }
    }
  }
}
