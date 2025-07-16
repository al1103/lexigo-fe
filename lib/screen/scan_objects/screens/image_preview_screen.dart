import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  List<DetectionResult>? _detections;
  @override
  Widget build(BuildContext context) {
    // Listen to scan state changes
    ref.listen<AsyncValue<List<DetectionResult>>>(
      scanObjectControllerProvider,
      (previous, next) {
        if (!mounted) return;

        next.when(
          data: (results) {
            if (results.isNotEmpty && _isAnalyzing) {
              setState(() {
                _isAnalyzing = false;
                _detections = results;
                _showAnalysis = true;
              });
            }
          },
          error: (error, stackTrace) {
            if (_isAnalyzing) {
              setState(() => _isAnalyzing = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $error'),
                  backgroundColor: Colors.red,
                ),
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
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Analyzing image...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
    });

    try {
      await ref.read(scanObjectControllerProvider.notifier).analyzeImage(
            File(widget.imagePath),
            // 'en',
          );
    } catch (e) {
      if (mounted) {
        setState(() => _isAnalyzing = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
