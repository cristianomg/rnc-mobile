// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Interceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      data.headers["Content-Type"] = "application/json";
      if (prefs.getBool(klogged_in) ??
          false && prefs.getString(kjwt_token) != null) {
        data.headers["Authorization"] = "Bearer ${prefs.getString(kjwt_token)}";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
