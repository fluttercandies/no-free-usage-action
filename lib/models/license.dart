///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 12:19
///
// ignore_for_file: non_constant_identifier_names
part of 'data_model.dart';

class License extends DataModel {
  const License({
    this.key,
    this.name,
    this.node_id,
    this.spdx_id,
    this.url,
  });

  @override
  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'] as String,
      name: json['name'] as String,
      node_id: json['node_id'] as String,
      spdx_id: json['spdx_id'] as String,
      url: json['url'] as String,
    );
  }

  final String key;
  final String name;
  final String node_id;
  final String spdx_id;
  final String url;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'key': key,
      'name': name,
      'node_id': node_id,
      'spdx_id': spdx_id,
      'url': url,
    };
    return data;
  }
}
