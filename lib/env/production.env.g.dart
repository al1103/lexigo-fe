// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const String appMode = '\'\'';

  static const List<int> _enviedkeyapiKey = <int>[
    1601504830,
    1585144350,
  ];

  static const List<int> _envieddataapiKey = <int>[
    1601504793,
    1585144377,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl =
      'https://src-unauthorized-strings-searches.trycloudflare.com/api';
}
