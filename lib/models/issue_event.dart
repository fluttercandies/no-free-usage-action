///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 19:34
///
part of 'data_model.dart';

class IssueEvent extends DataModel {
  const IssueEvent({
    this.action,
    this.issue,
    this.repository,
    this.sender,
  });

  @override
  factory IssueEvent.fromJson(Map<String, dynamic> json) {
    return IssueEvent(
      action: json['action'] as String,
      issue: json['issue'] != null
          ? Issue.fromJson(json['issue'] as Map<String, dynamic>)
          : null,
      repository: json['repository'] != null
          ? Repository.fromJson(json['repository'] as Map<String, dynamic>)
          : null,
      sender: json['sender'] != null
          ? User.fromJson(json['sender'] as Map<String, dynamic>)
          : null,
    );
  }

  final String action;
  final Issue issue;
  final Repository repository;
  final User sender;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'action': action,
      'issue': issue.toJson(),
      'repository': repository.toJson(),
      'sender': sender.toJson(),
    };
    return data;
  }
}
