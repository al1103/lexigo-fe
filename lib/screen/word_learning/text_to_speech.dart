import 'dart:ui';

import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  factory TTSService() => _instance;
  TTSService._internal();
  static final TTSService _instance = TTSService._internal();

  FlutterTts? _flutterTts;
  bool _isInitialized = false;

  VoidCallback? onSpeechStart;
  VoidCallback? onSpeechComplete;
  void Function(String)? onSpeechError;

  Future<void> initialize() async {
    if (_isInitialized) return;

    _flutterTts = FlutterTts();

    await _flutterTts?.setLanguage('en-US');
    await _flutterTts?.setSpeechRate(0.6);
    await _flutterTts?.setVolume(1);
    await _flutterTts?.setPitch(1);

    _flutterTts?.setStartHandler(() {
      onSpeechStart?.call();
    });

    _flutterTts?.setCompletionHandler(() {
      onSpeechComplete?.call();
    });

    _flutterTts?.setErrorHandler((msg) {
      onSpeechError?.call(msg.toString());
    });

    _isInitialized = true;
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) await initialize();
    await _flutterTts?.stop();
    await _flutterTts?.speak(text);
  }

  Future<void> stop() async {
    if (!_isInitialized) return;
    await _flutterTts?.stop();
  }

  Future<void> pause() async {
    if (!_isInitialized) return;
    await _flutterTts?.pause();
  }

  void dispose() {
    if (_isInitialized) {
      _flutterTts?.stop();
      _flutterTts = null;
      _isInitialized = false;
    }
  }
}
