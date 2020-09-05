///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 12:18
///
// ignore_for_file: non_constant_identifier_names
part of 'data_model.dart';

class Organization extends DataModel {
  const Organization({
    this.avatar_url,
    this.events_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.gravatar_id,
    this.html_url,
    this.id,
    this.login,
    this.node_id,
    this.organizations_url,
    this.received_events_url,
    this.repos_url,
    this.site_admin,
    this.starred_url,
    this.subscriptions_url,
    this.type,
    this.url,
  });

  @override
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      avatar_url: json['avatar_url'] as String,
      events_url: json['events_url'] as String,
      followers_url: json['followers_url'] as String,
      following_url: json['following_url'] as String,
      gists_url: json['gists_url'] as String,
      gravatar_id: json['gravatar_id'] as String,
      html_url: json['html_url'] as String,
      id: json['id'] as int,
      login: json['login'] as String,
      node_id: json['node_id'] as String,
      organizations_url: json['organizations_url'] as String,
      received_events_url: json['received_events_url'] as String,
      repos_url: json['repos_url'] as String,
      site_admin: json['site_admin'] as bool,
      starred_url: json['starred_url'] as String,
      subscriptions_url: json['subscriptions_url'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
    );
  }

  final int id;
  final String avatar_url;
  final String events_url;
  final String followers_url;
  final String following_url;
  final String gists_url;
  final String gravatar_id;
  final String html_url;
  final String login;
  final String node_id;
  final String organizations_url;
  final String received_events_url;
  final String repos_url;
  final String starred_url;
  final String subscriptions_url;
  final String type;
  final String url;
  final bool site_admin;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'avatar_url': avatar_url,
      'events_url': events_url,
      'followers_url': followers_url,
      'following_url': following_url,
      'gists_url': gists_url,
      'gravatar_id': gravatar_id,
      'html_url': html_url,
      'id': id,
      'login': login,
      'node_id': node_id,
      'organizations_url': organizations_url,
      'received_events_url': received_events_url,
      'repos_url': repos_url,
      'site_admin': site_admin,
      'starred_url': starred_url,
      'subscriptions_url': subscriptions_url,
      'type': type,
      'url': url,
    };
    return data;
  }
}
