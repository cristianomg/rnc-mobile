import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/http/interceptor.dart';

import '../models/login_user.dart';

class AuthRepository {
  final _url = Uri.http(kBase_url, '/api/auth');
  final Client _client = InterceptedClient.build(
    interceptors: [
      Interceptor(),
    ],
  );

  Future<Map> login(LoginUser user) async {
    final body = json.encode(user.toJson());

    final response = await _client.post(_url, body: body);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body) as Map<String, dynamic>;

      return responseJson;
    }

    throw Exception(response.body);
  }
}
