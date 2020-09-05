///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 19:34
///
// ignore_for_file: non_constant_identifier_names
part of 'data_model.dart';

class Issue extends DataModel {
  const Issue({
    this.active_lock_reason,
    this.assignee,
    this.assignees,
    this.author_association,
    this.body,
    this.closed_at,
    this.comments,
    this.comments_url,
    this.created_at,
    this.events_url,
    this.html_url,
    this.id,
    this.locked,
    this.milestone,
    this.node_id,
    this.number,
    this.repository_url,
    this.state,
    this.title,
    this.updated_at,
    this.url,
    this.user,
  });

  @override
  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      active_lock_reason: json['active_lock_reason'] as String,
      assignee: json['assignee'] != null
          ? User.fromJson(json['assignee'] as Map<String, dynamic>)
          : null,
      assignees: json['assignees'] != null
          ? (json['assignees'] as List)
              .map((i) => User.fromJson(i as Map<String, dynamic>))
              .toList()
          : null,
      author_association: json['author_association'] as String,
      body: json['body'] as String,
      closed_at: json['closed_at'] as String,
      comments: json['comments'] as int,
      comments_url: json['comments_url'] as String,
      created_at: json['created_at'] as String,
      events_url: json['events_url'] as String,
      html_url: json['html_url'] as String,
      id: json['id'] as int,
      locked: json['locked'] as bool,
      milestone: json['milestone'] as String,
      node_id: json['node_id'] as String,
      number: json['number'] as int,
      repository_url: json['repository_url'] as String,
      state: json['state'] as String,
      title: json['title'] as String,
      updated_at: json['updated_at'] as String,
      url: json['url'] as String,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  final String active_lock_reason;
  final User assignee;
  final List<User> assignees;
  final String author_association;
  final String body;
  final String closed_at;
  final int comments;
  final String comments_url;
  final String created_at;
  final String events_url;
  final String html_url;
  final int id;
  final bool locked;
  final String milestone;
  final String node_id;
  final int number;
  final String repository_url;
  final String state;
  final String title;
  final String updated_at;
  final String url;
  final User user;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'author_association': author_association,
      'body': body,
      'comments': comments,
      'comments_url': comments_url,
      'created_at': created_at,
      'events_url': events_url,
      'html_url': html_url,
      'id': id,
      'locked': locked,
      'node_id': node_id,
      'number': number,
      'repository_url': repository_url,
      'state': state,
      'title': title,
      'updated_at': updated_at,
      'url': url,
      'active_lock_reason': active_lock_reason,
      'assignee': assignee?.toJson(),
      'assignees': assignees?.map((v) => v.toJson())?.toList(),
      'closed_at': closed_at,
      'milestone': milestone,
      'user': user?.toJson(),
    };
    return data;
  }
}
