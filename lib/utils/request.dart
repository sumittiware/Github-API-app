import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urbanmatch_task/const.dart';
import 'package:urbanmatch_task/utils/request_exception.dart';

class ServerRequest {
  bool isSuccessRespnose(http.Response response) {
    return response.statusCode < 300 && response.statusCode >= 200;
  }

  Exception _handleException(http.Response response) {
    try {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      return RequestException(jsonData['message']);
    } catch (_) {
      return RequestException('Server error');
    }
  }

  Future<dynamic> get({
    required String path,
  }) async {
    final String url = '$apiServer/$path';
    final Uri uri = Uri.parse(url);
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'token $authToken',
    };

    print(url);

    try {
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (isSuccessRespnose(response)) {
        if (response.body.isEmpty) return null;

        final data = jsonDecode(response.body);

        return data;
      } else {
        throw _handleException(response);
      }
    } catch (_) {
      throw RequestException(_.toString());
    }
  }
}
