import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:templateproject/src/modules/shared/services/app_service.dart';

@LazySingleton(as: AppService)
class AppServiceImpl extends AppService {
  static final _instance = AppServiceImpl._internal();
  factory AppServiceImpl() => _instance;
  AppServiceImpl._internal() {
    initialize();
  }

  static Map<String, dynamic>? _config;
  static bool testingMode = false;

  @override
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

  @override
  Future<String> getApiInternalUrl() async {
    return _config?['api_internal_url'] as String;
  }
}