// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'development.env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const String appMode = '\'\'';

  static const List<int> _enviedkeyapiKey = <int>[
    1069054800,
    1835851692,
  ];

  static const List<int> _envieddataapiKey = <int>[
    1069054839,
    1835851659,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl = 'http://192.168.31.225:3000/api';
}
