import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/controller/speaking_controller.dart';
import 'package:lexigo/screen/speaking/controller/vocabulary_level_detail_controller.dart';
import 'package:lexigo/screen/speaking/speaking_result_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

@RoutePage()
class SpeakingScreen extends ConsumerStatefulWidget {
  const SpeakingScreen({
    super.key,
    this.levelCode,
    this.levelName,
  });
  final String? levelCode;
  final String? levelName;

  @override
  ConsumerState<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends ConsumerState<SpeakingScreen>
    with TickerProviderStateMixin {
  final _audioRecorder = AudioRecorder();
  final _flutterTts = FlutterTts();
  bool _isRecording = false;
  bool _isSpeaking = false;
  // ignore: use_late_for_private_fields_and_variables
  String? _recordingPath;
  Timer? _recordingTimer;
  int _recordingDuration = 0;
  final int _maxDuration = 3;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  String _targetWord = 'Đang tải...';
  String _ipa = '';
  int _currentWordIndex = 0;
  List<VocabularyModel> _vocabularyList = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeRecorder();
    _initializeTts();
    _loadVocabulary();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  Future<void> _initializeRecorder() async {
    final hasPermission = await _audioRecorder.hasPermission();
    if (!hasPermission) {
      await Permission.microphone.request();
    }
  }

  Future<void> _initializeTts() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.5); // Slower speech for learning
    await _flutterTts.setVolume(0.8);
    await _flutterTts.setPitch(1);

    _flutterTts
      ..setStartHandler(() {
        setState(() {
          _isSpeaking = true;
        });
      })
      ..setCompletionHandler(() {
        setState(() {
          _isSpeaking = false;
        });
      })
      ..setErrorHandler((msg) {
        setState(() {
          _isSpeaking = false;
        });
        _showErrorSnackBar('Lỗi phát âm: $msg');
      });
  }

  Future<void> _loadVocabulary() async {
    try {
      final levelCode = widget.levelCode ?? '';
      if (levelCode.isNotEmpty) {
        ref.invalidate(vocabularyLevelDetailControllerProvider(levelCode));
      }
    } catch (e) {
      _showErrorSnackBar('Không thể tải từ vựng');
    }
  }

  String _extractIPA(String? pronunciation) {
    if (pronunciation == null || pronunciation.isEmpty) return '/həˈloʊ/';
    final cleanIPA = pronunciation.trim();
    return cleanIPA.startsWith('/') && cleanIPA.endsWith('/')
        ? cleanIPA
        : '/$cleanIPA/';
  }

  void _updateCurrentWord() {
    if (_vocabularyList.isNotEmpty &&
        _currentWordIndex < _vocabularyList.length) {
      final currentVocab = _vocabularyList[_currentWordIndex];
      setState(() {
        _targetWord = currentVocab.word ?? 'Xin chào';
        _ipa = _extractIPA(currentVocab.pronunciation);
      });

      // Automatically speak the word when it changes
      Future.delayed(const Duration(milliseconds: 500), _speakCurrentWord);
    }
  }

  Future<void> _startRecording() async {
    if (_isRecording) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      _recordingPath = '${directory.path}/recording_$timestamp.wav';

      await _audioRecorder.start(
        const RecordConfig(encoder: AudioEncoder.wav, sampleRate: 16000),
        path: _recordingPath!,
      );

      setState(() {
        _isRecording = true;
        _recordingDuration = 0;
      });

      // Bắt đầu animation mà không await
      _pulseController.repeat(reverse: true);

      // Đảm bảo không có timer nào đang chạy trước khi tạo timer mới
      _recordingTimer?.cancel();

      // Tạo timer ngay lập tức để đếm giây
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted && _isRecording) {
          setState(() {
            _recordingDuration++;
          });
          if (_recordingDuration >= _maxDuration) {
            _stopRecording();
          }
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });
      _showErrorSnackBar('Không thể bắt đầu ghi âm');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      // Huỷ timer trước
      _recordingTimer?.cancel();
      _recordingTimer = null;

      // Dừng animation
      _pulseController
        ..stop()
        ..reset();

      final path = await _audioRecorder.stop();
      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });

      if (path != null && mounted) {
        _showProcessingDialog();

        try {
          final controller = ref.read(speakingControllerProvider.notifier);
          final currentVocabulary = _vocabularyList.isNotEmpty
              ? _vocabularyList[_currentWordIndex]
              : null;
          final wordId = currentVocabulary?.id?.toString() ?? '0';
          final result =
              await controller.checkSpeaking(File(path), _targetWord, wordId);

          if (mounted) {
            Navigator.of(context).pop();
            if (result != null) {
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => SpeakingResultScreen(
                    speakingResult: result,
                    recordingPath: path,
                    onContinue: _nextWord,
                    onTryAgain: () {},
                  ),
                ),
              );
            }
          }
        } catch (e) {
          if (mounted) {
            Navigator.of(context).pop();
            _showErrorSnackBar('Không thể phân tích phát âm');
          }
        }
      }
    } catch (e) {
      // Đảm bảo timer được huỷ ngay cả khi có lỗi
      _recordingTimer?.cancel();
      _recordingTimer = null;

      // Dừng animation
      _pulseController
        ..stop()
        ..reset();

      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });
      _showErrorSnackBar('Lỗi khi dừng ghi âm');
    }
  }

  void _nextWord() {
    if (_vocabularyList.isNotEmpty &&
        _currentWordIndex < _vocabularyList.length - 1) {
      setState(() {
        _currentWordIndex++;
      });
      _updateCurrentWord();
    }
  }

  void _showProcessingDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Đang phân tích phát âm...'),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _speakCurrentWord() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      return;
    }

    if (_targetWord.isNotEmpty && _targetWord != 'Loading...') {
      try {
        await _flutterTts.speak(_targetWord);
      } catch (e) {
        _showErrorSnackBar('Không thể phát âm từ');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final levelCode = widget.levelCode ?? '';
    final vocabularyState =
        ref.watch(vocabularyLevelDetailControllerProvider(levelCode));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(widget.levelName ?? 'Luyện phát âm'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: vocabularyState.when(
        data: _buildMainContent,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Lỗi: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadVocabulary,
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(PayloadPageableDto<VocabularyModel> data) {
    final vocabularyList = data.contents;

    if (vocabularyList.isEmpty) {
      return const Center(child: Text('Không có từ vựng nào'));
    }

    if (_vocabularyList.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _vocabularyList = vocabularyList;
          _updateCurrentWord();
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Progress
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF667EEA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              'Từ ${_currentWordIndex + 1} / ${vocabularyList.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Word Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEEF2FF), Color(0xFFF3F4F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        _targetWord,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF6366F1),
                          letterSpacing: -1,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Tooltip(
                      message: _isSpeaking ? 'Dừng phát âm' : 'Nghe phát âm',
                      child: GestureDetector(
                        onTap: _speakCurrentWord,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _isSpeaking
                                ? const Color(0xFFEF4444)
                                : const Color(0xFF6366F1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (_isSpeaking
                                        ? const Color(0xFFEF4444)
                                        : const Color(0xFF6366F1))
                                    .withValues(alpha: 0.25),
                                blurRadius: _isSpeaking ? 16 : 10,
                                spreadRadius: _isSpeaking ? 4 : 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            _isSpeaking
                                ? Icons.volume_up
                                : Icons.volume_up_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  _ipa,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xFF6366F1),
                  ),
                ),
                const SizedBox(height: 18),
                if (_vocabularyList.isNotEmpty &&
                    _currentWordIndex < _vocabularyList.length &&
                    _vocabularyList[_currentWordIndex].meaning != null)
                  Text(
                    _vocabularyList[_currentWordIndex].meaning!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // TTS Instructions
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Color(0xFF6366F1),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Chạm biểu tượng loa để nghe phát âm',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6366F1),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 56,
                height: 56,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_currentWordIndex + 1} / ${vocabularyList.length}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6366F1),
                  ),
                ),
              ),
              const SizedBox(
                width: 56,
                height: 56,
              ),
            ],
          ),
          const Spacer(),

          // Recording Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF667EEA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                if (_isRecording) ...[
                  Text(
                    'Đang ghi: ${_recordingDuration}s / ${_maxDuration}s',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: _recordingDuration / _maxDuration,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  const SizedBox(height: 24),
                ] else ...[
                  Column(
                    children: [
                      const Text(
                        'Chạm micro và nói rõ ràng',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: _speakCurrentWord,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.replay,
                                size: 16,
                                color: Color(0xFF6366F1),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Nghe lại',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6366F1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _isRecording ? _pulseAnimation.value : 1.0,
                      child: GestureDetector(
                        onTap: _isRecording ? _stopRecording : _startRecording,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _isRecording
                                  ? [Colors.red, Colors.redAccent]
                                  : [
                                      const Color(0xFF6366F1),
                                      const Color(0xFF667EEA),
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: _isRecording
                                    ? Colors.red.withValues(alpha: 0.25)
                                    : const Color(0xFF6366F1)
                                        .withValues(alpha: 0.18),
                                blurRadius: 24,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: Icon(
                            _isRecording ? Icons.stop : Icons.mic,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  _isRecording
                      ? 'Chạm để dừng ghi âm'
                      : 'Chạm để bắt đầu ghi âm',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dọn dẹp timer
    _recordingTimer?.cancel();
    _recordingTimer = null;

    // Dọn dẹp animation controller
    _pulseController.dispose();

    // Dọn dẹp audio recorder
    if (_isRecording) {
      _audioRecorder.stop();
    }
    _audioRecorder.dispose();

    // Dọn dẹp TTS
    _flutterTts.stop();

    super.dispose();
  }
}
