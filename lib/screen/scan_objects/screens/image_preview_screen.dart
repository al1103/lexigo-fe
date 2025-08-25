import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/theme/app_fonts.dart';
import 'package:lexigo/common/utils/toast_helper.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/scan_object_controller.dart';
import 'package:lexigo/screen/scan_objects/widgets/image_analys.dart';
import 'package:lexigo/screen/scan_objects/widgets/image_preview_controls.dart';
import 'package:lexigo/screen/scan_objects/widgets/square_image_widget.dart';

class ImagePreviewScreen extends ConsumerStatefulWidget {
  const ImagePreviewScreen({required this.imagePath, super.key});
  final String imagePath;

  @override
  ConsumerState<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends ConsumerState<ImagePreviewScreen> {
  bool _isAnalyzing = false;
  bool _hasAnalyzed = false;
  bool _showAnalysis = false;
  bool _hasTimedOut = false; // Track timeout state
  List<DetectionResult>? _detections;
  Timer? _timeoutTimer;
  Timer? _progressTimer;
  int _secondsElapsed = 0;

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    _progressTimer?.cancel();
    super.dispose();
  }

  String _getErrorMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('500') ||
        errorString.contains('server error') ||
        errorString.contains('internal server error')) {
      return 'Server AI quá tải. Vui lòng thử lại sau.';
    } else if (errorString.contains('timeout') ||
        errorString.contains('connection timeout')) {
      return 'Kết nối quá chậm. Vui lòng kiểm tra mạng và thử lại.';
    } else if (errorString.contains('network') ||
        errorString.contains('no internet')) {
      return 'Không có kết nối mạng. Vui lòng kiểm tra và thử lại.';
    } else {
      return 'Lỗi phân tích: $error';
    }
  }

  void _showToast(String message, {bool isError = false}) {
    if (isError) {
      ToastHelper.showError(message);
    } else {
      ToastHelper.showWarning(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to scan state changes
    ref.listen<AsyncValue<List<DetectionResult>>>(
      scanObjectControllerProvider,
      (previous, next) {
        if (!mounted) return;

        next.when(
          data: (results) {
            // Chỉ xử lý nếu đang analyzing và chưa timeout
            if (_isAnalyzing && !_hasTimedOut) {
              _timeoutTimer?.cancel(); // Hủy timeout khi có kết quả
              _progressTimer?.cancel(); // Hủy progress timer
              setState(() {
                _isAnalyzing = false;
                _detections = results.isNotEmpty ? results : null;
                _showAnalysis = results.isNotEmpty;
                _secondsElapsed = 0; // Reset counter
              });

              // Hiển thị toast khi không tìm thấy object nào
              if (results.isEmpty) {
                _showToast('Không tìm thấy đối tượng nào trong hình ảnh');
              }
            } else if (_hasTimedOut) {
              // Nếu API về nhưng đã timeout, show toast warning
              _showToast('API đã phản hồi nhưng quá chậm. Vui lòng thử lại.');
            }
          },
          error: (error, stackTrace) {
            // Chỉ xử lý nếu đang analyzing và chưa timeout
            if (_isAnalyzing && !_hasTimedOut) {
              _timeoutTimer?.cancel(); // Hủy timeout khi có lỗi
              _progressTimer?.cancel(); // Hủy progress timer
              setState(() {
                _isAnalyzing = false;
                _secondsElapsed = 0; // Reset counter
              });
              _showToast(_getErrorMessage(error), isError: true);
            } else if (_hasTimedOut) {
              // Nếu API error về nhưng đã timeout, show toast warning
              _showToast(
                'API đã phản hồi lỗi nhưng quá chậm. Vui lòng thử lại.',
              );
            }
          },
          loading: () {},
        );
      },
    );

    final size = MediaQuery.of(context).size;
    final imageSize = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Image display
          Center(
            child: Hero(
              tag: widget.imagePath,
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _showAnalysis && _detections != null
                      ? ImageAnalysis(
                          imagePath: widget.imagePath,
                          detections: _detections!,
                        )
                      : SquareImageWidget(
                          imagePath: widget.imagePath,
                          size: imageSize,
                        ),
                ),
              ),
            ),
          ),

          // Loading overlay
          if (_isAnalyzing)
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                            value: _secondsElapsed /
                                30, // Progress từ 0 đến 1 trong 30s
                          ),
                        ),
                        Text(
                          '${30 - _secondsElapsed}s',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Đang phân tích hình ảnh...',
                      style: AppFonts.bodyLarge(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vui lòng chờ trong giây lát',
                      style: AppFonts.bodyMedium(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Controls
          ImagePreviewControls(
            imagePath: widget.imagePath,
            isAnalyzing: _isAnalyzing,
            hasAnalyzed: _hasAnalyzed,
            showAnalysis: _showAnalysis,
            hasDetections: _detections != null,
            onAnalyze: _analyzeImage,
            onToggleView: () => setState(() => _showAnalysis = !_showAnalysis),
            onBack: () {
              Navigator.pop(context);
            },
            onRetake: () {
              Navigator.pop(context);
              try {
                File(widget.imagePath).deleteSync();
              } catch (e) {
                debugPrint('Error deleting file: $e');
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _analyzeImage() async {
    if (_isAnalyzing) return;

    setState(() {
      _isAnalyzing = true;
      _hasAnalyzed = true;
      _hasTimedOut = false; // Reset timeout flag
      _secondsElapsed = 0; // Reset counter
    });

    // Thiết lập progress timer
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isAnalyzing && mounted && !_hasTimedOut) {
        setState(() {
          _secondsElapsed++;
        });
      } else {
        timer.cancel();
      }
    });

    // Thiết lập timeout 30 giây
    _timeoutTimer = Timer(const Duration(seconds: 30), () {
      if (_isAnalyzing && mounted && !_hasTimedOut) {
        _progressTimer?.cancel();
        setState(() {
          _isAnalyzing = false;
          _hasTimedOut = true; // Set timeout flag
          _secondsElapsed = 0;
        });
        _showToast(
          'Quá trình phân tích mất quá nhiều thời gian. Vui lòng thử lại.',
        );
      }
    });

    try {
      await ref.read(scanObjectControllerProvider.notifier).analyzeImage(
            File(widget.imagePath),
            // 'en',
          );
    } catch (e) {
      // Chỉ xử lý error nếu chưa timeout
      if (mounted && !_hasTimedOut) {
        _timeoutTimer?.cancel(); // Hủy timeout khi có lỗi
        _progressTimer?.cancel(); // Hủy progress timer
        setState(() {
          _isAnalyzing = false;
          _secondsElapsed = 0; // Reset counter
        });
        _showToast(_getErrorMessage(e), isError: true);
      }
    }
  }
}
