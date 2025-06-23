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
    3985903095,
    4232792862,
  ];

  static const List<int> _envieddataapiKey = <int>[
    3985903056,
    4232792889,
  ];

  static final String apiKey = String.fromCharCodes(List<int>.generate(
    _envieddataapiKey.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]));

  static const String apiUrl = 'http://192.168.31.225:3000/api';
}
