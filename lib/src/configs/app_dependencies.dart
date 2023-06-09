import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:templateproject/src/configs/app_dependencies.config.dart';

final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() => getIt.init();
