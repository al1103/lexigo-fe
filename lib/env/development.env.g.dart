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
    2985244355,
    2855527760,
  ];

  static const List<int> _envieddataapiKey = <int>[
    2985244388,
    2855527799,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl =
      'https://volume-server-variety-eastern.trycloudflare.com/api';
}
