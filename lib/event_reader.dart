///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 19:23
///
import 'dart:convert';
import 'dart:io';

import 'package:no_free_action/constants/constants.dart';

Future<Map<String, dynamic>> readEvent(ArgResults result) async {
  final String path = result['path'] as String;
  final File eventFile = File(path);
  final String eventContent = await eventFile.readAsString();
  final Map<String, dynamic> event =
      jsonDecode(eventContent) as Map<String, dynamic>;
  return event;
}
