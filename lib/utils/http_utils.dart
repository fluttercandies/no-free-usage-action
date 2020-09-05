///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020-09-05 11:18
///
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:no_free_action/constants/constants.dart';

enum FetchType { get, post, patch, put }

class HttpUtils {
  const HttpUtils._();

  static Future<T> fetch<T extends DataModel>({
    @required String url,
    @required FetchType fetchType,
    Map<String, dynamic> queryParameters,
    dynamic body,
    Map<String, dynamic> headers,
    bool shouldDisplayOverlay = false,
  }) async {
    try {
      final http.Response response = await getResponse(
        url: url,
        fetchType: fetchType,
        queryParameters: queryParameters?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
        body: body,
        headers: headers?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
      if (response == null) {
        throw AssertionError('Null Response with model fetch');
      }
      if (response.body == null) {
        throw AssertionError('Null Response with model empty body');
      }
      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      final T model = makeModel<T>(json);
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<T>> fetchModels<T extends DataModel>({
    @required String url,
    @required FetchType fetchType,
    Map<String, dynamic> queryParameters,
    dynamic body,
    Map<String, dynamic> headers,
    bool shouldDisplayOverlay = false,
  }) async {
    try {
      final http.Response response = await getResponse(
        url: url,
        fetchType: fetchType,
        queryParameters: queryParameters?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
        body: body,
        headers: headers?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
      if (response == null) {
        throw AssertionError('Null Response with models fetch');
      }
      if (response.body == null) {
        throw AssertionError('Null Response with models empty body');
      }
      final List<Map<String, dynamic>> resBody =
          List<Map<String, dynamic>>.from(
              jsonDecode(response.body) as List<dynamic>);
      if (resBody == null) {
        throw AssertionError('Null Response with empty res body');
      }
      final List<T> models = List<T>.generate(
        resBody.length,
        (int index) => makeModel<T>(resBody[index]),
      );
      return models;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<http.Response> getResponse({
    @required String url,
    @required FetchType fetchType,
    Map<String, String> queryParameters,
    dynamic body,
    Map<String, String> headers,
  }) async {
    try {
      http.Response response;
      headers ??= <String, String>{};
      headers['Accept'] = 'application/vnd.github.v3+json';
      headers['Content-Type'] = 'application/json;charset=utf-8';
      switch (fetchType) {
        case FetchType.get:
          response = await http.get(
            Uri.parse(url).replace(queryParameters: queryParameters),
            headers: headers,
          );
          break;
        case FetchType.post:
          response = await http.post(
            Uri.parse(url).replace(queryParameters: queryParameters),
            body: jsonEncode(body),
            headers: headers,
          );
          break;
        case FetchType.patch:
          response = await http.patch(
            Uri.parse(url).replace(queryParameters: queryParameters),
            body: jsonEncode(body),
            headers: headers,
          );
          break;
        case FetchType.put:
          response = await http.put(
            Uri.parse(url).replace(queryParameters: queryParameters),
            body: jsonEncode(body),
            headers: headers,
          );
          break;
      }
      if (response == null) {
        throw AssertionError('Null Response in getting response');
      }
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
