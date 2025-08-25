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
    2607943252,
    1926489950,
  ];

  static const List<int> _envieddataapiKey = <int>[
    2607943283,
    1926489977,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl =
      'https://src-unauthorized-strings-searches.trycloudflare.com/api';
}
