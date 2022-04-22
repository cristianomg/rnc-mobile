import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/http/interceptor.dart';

import '../models/setor.dart';

class SetorRepository {
  final _url = Uri.http(kBase_url, '/api/setor');
  final Client _client = InterceptedClient.build(
    interceptors: [
      Interceptor(),
    ],
  );

  Future<List<Setor>> getAll() async {
    final response = await _client.get(_url);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body) as List;

      return responseJson.map<Setor>((e) => Setor.fromJson(e)).toList();
    }

    return List.empty();
  }
}
