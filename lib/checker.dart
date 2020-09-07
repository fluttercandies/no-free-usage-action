///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 14:00
///
import 'dart:async';
import 'dart:math' as math;

import 'package:no_free_action/constants/constants.dart';

import 'action.dart';

Future<void> check() async {
  if (!Constants.isForkRequired && !Constants.isStarRequired) {
    print('Nothing to check. Phew!');
    return;
  }

  final Repository repo = await HttpUtils.fetch<Repository>(
    url: '$baseUrl/repos/${Constants.fullRepoName}',
    fetchType: FetchType.get,
    headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
  );
  if (repo == null) {
    return;
  }
  final List<dynamic> requests = await Future.wait(<Future>[
    forksCheck(repo: repo),
    starredCheck(repo: repo),
  ]);

  final bool isForked = requests[0] as bool;
  final bool isStarred = requests[1] as bool;

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

Future<bool> forksCheck({
  @required Repository repo,
}) async {
  bool isForked = false;
  int page = 1;
  int forksCount = repo.forks_count;

  Future<void> requestForked() async {
    final List<Repository> forks = await HttpUtils.fetchModels<Repository>(
      url: repo.forks_url,
      fetchType: FetchType.get,
      queryParameters: <String, dynamic>{
        'page': page,
        'per_page': math.min(100, forksCount),
      },
      headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
    );
    final Iterable<Repository> filteredForks = forks?.where((Repository repo) {
      return repo.full_name.contains(Constants.login);
    });
    if (filteredForks?.isNotEmpty ?? false) {
      isForked = true;
    } else {
      if (forksCount <= 100) {
        return;
      }
      page++;
      forksCount -= forks?.length;
      await requestForked();
    }
  }

  await requestForked();
  return isForked;
}

Future<bool> starredCheck({
  @required Repository repo,
}) async {
  bool isStarred = false;
  int page = 1;
  int stargazersCount = repo.stargazers_count;

  Future<void> requestStarred() async {
    final List<User> stargazers = await HttpUtils.fetchModels<User>(
      url: repo.stargazers_url,
      fetchType: FetchType.get,
      queryParameters: <String, dynamic>{
        'page': page,
        'per_page': math.min(100, stargazersCount),
      },
      headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
    );
    final Iterable<User> filteredStargazers = stargazers?.where((User user) {
      return user.login.contains(Constants.login);
    });
    if (filteredStargazers?.isNotEmpty ?? false) {
      isStarred = true;
    } else {
      if (stargazersCount <= 100) {
        return;
      }
      page++;
      stargazersCount -= stargazers?.length;
      await requestStarred();
    }
  }

  await requestStarred();
  return isStarred;
}
