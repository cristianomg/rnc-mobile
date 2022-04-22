import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/http/interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print(responseJson);
      _fillPreferences(responseJson);

      return responseJson;
    }

    throw Exception(response.body);
  }

  Future _fillPreferences(Map<dynamic, dynamic> authResponse) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kUser, json.encode(authResponse['user']));
    prefs.setString(kjwt_token, authResponse['token'].toString());
    prefs.setString(kPermission, authResponse['permission'].toString());
    prefs.setInt(
        kPermissionId, authResponse['user']['userPermissionId'] as int);
    prefs.setBool(klogged_in, true);
  }
}
