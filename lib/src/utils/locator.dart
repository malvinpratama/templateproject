import 'package:get_it/get_it.dart';
import 'package:templateproject/src/modules/app/services/app_service.dart';

void setupLocator() {
  // Services
  GetIt.I.registerSingleton<AppService>(AppService());
}
