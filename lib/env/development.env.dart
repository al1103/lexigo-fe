import 'package:envied/envied.dart';
import 'package:lexigo/env/env.dart';

part 'development.env.g.dart';

@Envied(name: 'Env', path: '.env/.development.env')
final class DevelopmentEnv extends Env {
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
