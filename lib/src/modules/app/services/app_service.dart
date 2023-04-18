import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppService {
  static final _instance = AppService._internal();
  factory AppService() => _instance;
  AppService._internal() {
    initialize();
  }

  static Map<String, dynamic>? _config;
  static bool testingMode = false;

  Future<void> initialize() async {
    testingMode =
        const bool.fromEnvironment('testing_mode', defaultValue: false);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    String configFilePath = "";

    if (packageName == "com.xxx.xxx") {
      configFilePath = "config/env.json";
    } else if (packageName == "com.xxx.xxx") {
      configFilePath = "config/env.sit.json";
    }

    final configString = await rootBundle.loadString(configFilePath);
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  String getApiInternalUrl() {
    return _config?['api_internal_url'] as String;
  }
}
