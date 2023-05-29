import 'package:envied/envied.dart';

part 'staging.env.g.dart';

@Envied(path: '.staging.env')
abstract class Env {
  @EnviedField(varName: 'flavor')
  static const String flavor = _Env.flavor;
}
