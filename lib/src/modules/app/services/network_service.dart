import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:template/src/modules/app/services/app_service.dart';

class NetworkService {
  static final _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  static final GetIt _getIt = GetIt.I;
  static final AppService _appService = _getIt<AppService>();
  // static final DatabaseService _databaseService = _getIt<DatabaseService>();

  static final String _apiInternalUrl = _appService.getApiInternalUrl();

  Future<http.Response> postInternalAPI(String url,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      String? basic}) {
    final Uri uri = Uri.parse("$_apiInternalUrl$url");
    Map<String, String>? headers;

    if (basic == null) {
      // User? loggedUser = _databaseService.getLoggedUser();
      // String? bearerToken = loggedUser?.bearerToken;

      headers = {
        // 'AUTHORIZATION': 'Bearer $bearerToken',
        'content-type': 'application/x-www-form-urlencoded'
      };
    } else {
      headers = {
        'AUTHORIZATION': 'Basic $basic',
        'content-type': 'application/x-www-form-urlencoded'
      };
    }

    return http.post(uri, headers: headers).then((value) {
      if (kDebugMode) {
        print(value);
      }
      return value;
    });
  }
}
