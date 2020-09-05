///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 11:58
///
import 'dart:convert';

part 'comment.dart';
part 'issue.dart';
part 'issue_event.dart';
part 'license.dart';
part 'organization.dart';
part 'repository.dart';
part 'user.dart';

abstract class DataModel extends Object {
  const DataModel();

  // ignore: avoid_unused_constructor_parameters
  DataModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  @override
  String toString() => const JsonEncoder().convert(toJson());
}

typedef DataFactory<T extends DataModel> = T Function(Map<String, dynamic> json);

final Map<Type, Function> dataModelFactories = <Type, DataFactory>{
  Comment: (Map<String, dynamic> json) => Comment.fromJson(json),
  Issue: (Map<String, dynamic> json) => Issue.fromJson(json),
  IssueEvent: (Map<String, dynamic> json) => IssueEvent.fromJson(json),
  License: (Map<String, dynamic> json) => License.fromJson(json),
  Organization: (Map<String, dynamic> json) => Organization.fromJson(json),
  Repository: (Map<String, dynamic> json) => Repository.fromJson(json),
  User: (Map<String, dynamic> json) => User.fromJson(json),
};

T makeModel<T extends DataModel>(dynamic json) {
  return dataModelFactories[T](json) as T;
}
