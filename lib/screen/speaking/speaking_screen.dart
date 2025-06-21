import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/speaking/controller/speaking_controller.dart';
import 'package:lexigo/screen/speaking/controller/vocabulary_controller.dart';
import 'package:lexigo/screen/speaking/speaking_result_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

@RoutePage()
class SpeakingScreen extends ConsumerStatefulWidget {
  const SpeakingScreen({super.key});

  @override
  ConsumerState<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends ConsumerState<SpeakingScreen>
    with TickerProviderStateMixin {
  final _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  String? _recordingPath;
  Timer? _recordingTimer;
  int _recordingDuration = 0;
  final int _maxDuration = 3;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  String _targetWord = 'Loading...';
  String _ipa = '';
  int _currentWordIndex = 0;
  List<VocabularyModel> _vocabularyList = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeRecorder();
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

  Future<void> _loadVocabulary() async {
    try {
      final controller = ref.read(vocabularyControllerProvider('', 1).notifier);
      await controller.getVocabulary('', 1);
    } catch (e) {
      _showErrorSnackBar('Failed to load vocabulary');
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
        _targetWord = currentVocab.word ?? 'Hello';
        _ipa = _extractIPA(currentVocab.pronunciation);
      });
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

      _pulseController.repeat(reverse: true);

      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            _recordingDuration++;
          });
          if (_recordingDuration >= _maxDuration) {
            _stopRecording();
          }
        }
      });
    } catch (e) {
      _showErrorSnackBar('Failed to start recording');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      _recordingTimer?.cancel();
      _pulseController.stop();
      _pulseController.reset();

      final path = await _audioRecorder.stop();
      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });

      if (path != null && mounted) {
        _showProcessingDialog();

        try {
          final controller = ref.read(speakingControllerProvider.notifier);
          final result =
              await controller.checkSpeaking(File(path), _targetWord);

          if (mounted) {
            Navigator.of(context).pop();
            if (result != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
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
            _showErrorSnackBar('Failed to analyze pronunciation');
          }
        }
      }
    } catch (e) {
      setState(() {
        _isRecording = false;
        _recordingDuration = 0;
      });
      _showErrorSnackBar('Error stopping recording');
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

  void _previousWord() {
    if (_vocabularyList.isNotEmpty && _currentWordIndex > 0) {
      setState(() {
        _currentWordIndex--;
      });
      _updateCurrentWord();
    }
  }

  void _showProcessingDialog() {
    showDialog(
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
              Text('Analyzing pronunciation...'),
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

  @override
  Widget build(BuildContext context) {
    final vocabularyState = ref.watch(vocabularyControllerProvider('', 1));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Speaking Practice'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: vocabularyState.when(
        data: _buildMainContent,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadVocabulary,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(dynamic data) {
    if (data == null || data.data == null) {
      return const Center(child: Text('No vocabulary available'));
    }

    List<dynamic> rawList;
    if (data.data is List) {
      rawList = data.data as List<dynamic>;
    } else {
      return const Center(child: Text('Invalid data format'));
    }

    if (rawList.isEmpty) {
      return const Center(child: Text('No vocabulary available'));
    }

    if (_vocabularyList.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _vocabularyList = rawList
              .where((item) => item != null)
              .map<VocabularyModel>((item) {
            if (item is VocabularyModel) {
              return item;
            }
            if (item is Map<String, dynamic>) {
              return VocabularyModel.fromJson(item);
            }
            try {
              final itemMap = Map<String, dynamic>.from(item as Map);
              return VocabularyModel.fromJson(itemMap);
            } catch (e) {
              debugPrint('Error converting item to VocabularyModel: $e');
              // Return a default VocabularyModel if conversion fails
              return const VocabularyModel(
                id: 0,
                word: 'Hello',
                pronunciation: '/həˈloʊ/',
                meaning: 'A greeting',
              );
            }
          }).toList();
        });
        _updateCurrentWord();
      });
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Progress
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Text(
              'Word ${_currentWordIndex + 1} of ${_vocabularyList.isNotEmpty ? _vocabularyList.length : rawList.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Word Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  _targetWord,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _ipa,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6366F1),
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 16),
                if (_vocabularyList.isNotEmpty &&
                    _currentWordIndex < _vocabularyList.length &&
                    _vocabularyList[_currentWordIndex].meaning != null)
                  Text(
                    _vocabularyList[_currentWordIndex].meaning!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _currentWordIndex > 0 ? _previousWord : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentWordIndex > 0
                      ? const Color(0xFF6366F1)
                      : Colors.grey[300],
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: _currentWordIndex > 0 ? Colors.white : Colors.grey,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_currentWordIndex + 1} / ${_vocabularyList.isNotEmpty ? _vocabularyList.length : rawList.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6366F1),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _currentWordIndex <
                        (_vocabularyList.isNotEmpty
                            ? _vocabularyList.length - 1
                            : rawList.length - 1)
                    ? _nextWord
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentWordIndex <
                          (_vocabularyList.isNotEmpty
                              ? _vocabularyList.length - 1
                              : rawList.length - 1)
                      ? const Color(0xFF6366F1)
                      : Colors.grey[300],
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: _currentWordIndex <
                          (_vocabularyList.isNotEmpty
                              ? _vocabularyList.length - 1
                              : rawList.length - 1)
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),

          // Recording Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                if (_isRecording) ...[
                  Text(
                    'Recording: ${_recordingDuration}s / ${_maxDuration}s',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: _recordingDuration / _maxDuration,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  const SizedBox(height: 24),
                ] else ...[
                  const Text(
                    'Tap the microphone and speak clearly',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
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
                            color: _isRecording
                                ? Colors.red
                                : const Color(0xFF6366F1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (_isRecording
                                        ? Colors.red
                                        : const Color(0xFF6366F1))
                                    .withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
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
                      ? 'Tap to stop recording'
                      : 'Tap to start recording',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
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
    _recordingTimer?.cancel();
    _pulseController.dispose();
    if (_isRecording) {
      _audioRecorder.stop();
    }
    _audioRecorder.dispose();
    super.dispose();
  }
}
