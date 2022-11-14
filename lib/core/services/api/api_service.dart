import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oxidized/oxidized.dart';
import '../../locator.dart';

class ApiService {
  static ApiService get instance => locator<ApiService>();

  final _baseHeaders = {
    'Content-Type': 'application/json',
  };

  void addHeader(String key, String value) {
    _baseHeaders.addAll({key: value});
  }

  void resetHeaders() {
    _baseHeaders.clear();
    _baseHeaders.addAll({
      'Content-Type': 'application/json',
    });
  }

  Uri _buildUri(String path) {
    return Uri.http('swapi.dev', path);
  }

  Future<Result<dynamic, dynamic>> get(String path) async {
    try {
      final uri = _buildUri(path);

      final response = await http.get(uri, headers: _baseHeaders);

      var decodedResponse = response.body != '' ? json.decode(response.body) : '';

      if (['OK', 'Created', 'No Content'].contains(response.reasonPhrase)) {
        return Result.ok(decodedResponse);
      } else {
        return Result.err(decodedResponse);
      }
    } catch (e) {
      return Result.err('An unknown error has ocurred');
    }
  }
}
