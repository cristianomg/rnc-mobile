import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/http/interceptor.dart';
import 'package:rnc_mobile/app/models/register_user.dart';

class UserRepository {
  final _url = Uri.http(kBase_url, '/api/user');
  final Client _client = InterceptedClient.build(
    interceptors: [
      Interceptor(),
    ],
  );

  Future create(RegisterUser user) async {
    try {
      final body = json.encode(user.toJson());
      final response = await _client.post(_url, body: body);

      if (response.statusCode == 200) {
        return;
      }
      throw Exception(response.body.toString());
    } catch (e) {
      throw Exception('Erro ao criar novo usuário');
    }
  }
}
