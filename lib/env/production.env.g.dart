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
    3026512664,
    892228328,
  ];

  static const List<int> _envieddataapiKey = <int>[
    3026512703,
    892228303,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl =
      'https://movement-foto-indicators-heavy.trycloudflare.com/api';
}
