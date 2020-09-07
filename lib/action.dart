///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 19:57
///
import 'package:http/http.dart' as http;
import 'package:no_free_action/constants/constants.dart';

Future<bool> tips() async {
  final Comment comment = await HttpUtils.fetch(
    url: '$baseUrl/repos/${Constants.fullRepoName}'
        '/issues/${Constants.event.issue.number}/comments',
    fetchType: FetchType.post,
    body: <String, dynamic>{
      'body': Constants.words,
    },
    headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
  );
  if (comment != null) {
    print('Issue replied with tips.');
  } else {
    print('Issue reply failed.');
  }
  return comment != null;
}

Future<bool> close() async {
  final Issue issue = await HttpUtils.fetch(
    url: Constants.event.issue.url,
    fetchType: FetchType.patch,
    body: <String, dynamic>{
      'state': 'closed',
    },
    headers: <String, dynamic>{'Authorization': 'Bearer ${Constants.token}'},
  );
  if (issue != null) {
    print('Issue closed.');
  } else {
    print('Issue close failed.');
  }
  return issue != null;
}

Future<bool> lock() async {
  final http.Response response = await HttpUtils.getResponse(
    url: '$baseUrl/repos/${Constants.fullRepoName}'
        '/issues/${Constants.event.issue.number}/lock',
    fetchType: FetchType.put,
    body: <String, dynamic>{
      'lock_reason': 'spam',
    },
    headers: <String, String>{'Authorization': 'Bearer ${Constants.token}'},
  );
  if (response != null) {
    print('Issue locked with \'spam\'.');
  } else {
    print('Issue locked failed.');
  }
  return response != null;
}
