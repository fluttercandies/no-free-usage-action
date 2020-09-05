///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 20:38
///
// ignore_for_file: non_constant_identifier_names
part of 'data_model.dart';

class Comment extends DataModel {
  Comment({
    this.body,
    this.created_at,
    this.html_url,
    this.id,
    this.node_id,
    this.updated_at,
    this.url,
    this.user,
  });

  @override
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      body: json['body'] as String,
      created_at: json['created_at'] as String,
      html_url: json['html_url'] as String,
      id: json['id'] as int,
      node_id: json['node_id'] as String,
      updated_at: json['updated_at'] as String,
      url: json['url'] as String,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  final String body;
  final String created_at;
  final String html_url;
  final int id;
  final String node_id;
  final String updated_at;
  final String url;
  final User user;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'body': body,
      'created_at': created_at,
      'html_url': html_url,
      'id': id,
      'node_id': node_id,
      'updated_at': updated_at,
      'url': url,
      'user': user?.toJson(),
    };
    return data;
  }
}
