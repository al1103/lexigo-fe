import 'package:envied/envied.dart';
import 'package:lexigo/env/env.dart';

part 'production.env.g.dart';

@Envied(name: 'Env', path: '.env/.production.env')
final class ProductionEnv extends Env {
  @override
  @EnviedField(varName: 'APP_MODE')
  final String appMode = _Env.appMode;

  @override
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  final String apiKey = _Env.apiKey;

  @override
  @EnviedField(varName: 'API_URL')
  final String apiUrl = _Env.apiUrl;
}
