// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/http/interceptor.dart';
import 'package:rnc_mobile/app/models/ocurrence_register.dart';

class OcurrenceRegisterRepository {
  final _base_url_controller = '/api/OccurrenceRegister';
  final Client _client = InterceptedClient.build(
    interceptors: [
      Interceptor(),
    ],
  );

  Future<List<OcurrenceRegister>> getAll() async {
    final response =
        await _client.get(Uri.http(kBase_url, _base_url_controller + '/all'));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body) as List;

      return responseJson
          .map<OcurrenceRegister>((e) => OcurrenceRegister.fromJson(e))
          .toList();
    }

    throw Exception(response.body);
  }

  Future<OcurrenceRegister> getById(String id) async {
    final response =
        await _client.get(Uri.http(kBase_url, _base_url_controller + '/$id'));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      return OcurrenceRegister.fromJson(responseJson);
    }

    throw Exception(response.body);
  }

  Future delete(String id) async {
    final response = await _client
        .delete(Uri.http(kBase_url, _base_url_controller + '/$id'));

    if (response.statusCode == 200) {
      return;
    }

    throw Exception(response.body);
  }
}
