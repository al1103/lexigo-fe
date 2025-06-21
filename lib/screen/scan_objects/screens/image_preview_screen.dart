import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/scan_object_controller.dart';
import 'package:lexigo/screen/scan_objects/widgets/image_analys.dart';
import 'package:lexigo/screen/scan_objects/widgets/image_preview_controls.dart';

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
    final scanState = ref.watch(scanObjectControllerProvider);

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
              _showResultDialog(context, results);
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
                      color: Colors.black.withOpacity(0.5),
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
                      : Image.file(
                          File(widget.imagePath),
                          fit: BoxFit.cover,
                          width: imageSize,
                          height: imageSize,
                        ),
                ),
              ),
            ),
          ),

          // Loading overlay
          if (_isAnalyzing)
            ColoredBox(
              color: Colors.black.withOpacity(0.7),
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
              // ref.read(scanObjectControllerProvider.notifier).reset();
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
      // ref.read(scanObjectControllerProvider.notifier).reset();
      await Future.delayed(Duration.zero);

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

  void _showResultDialog(BuildContext context, List<DetectionResult> results) {
    if (results.isEmpty) return;

    final result = results.first;

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => AlertDialog(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    //     title: Row(
    //       children: [
    //         const Icon(Icons.auto_awesome, color: Colors.blue),
    //         const SizedBox(width: 12),
    //         Expanded(
    //           child: Text(
    //             result.name ?? 'Unknown Object',
    //             style: const TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       ],
    //     ),
    //     content: SingleChildScrollView(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Confidence: ${(result.score * 100).toInt()}%',
    //             style: const TextStyle(fontSize: 16),
    //           ),
    //           const SizedBox(height: 16),
    //           if (results.length > 1) ...[
    //             const Text(
    //               'Other detected objects:',
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             const SizedBox(height: 8),
    //             ...results.skip(1).take(3).map(
    //                   (r) => Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 2),
    //                     child: Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.label,
    //                           size: 16,
    //                           color: Colors.grey,
    //                         ),
    //                         const SizedBox(width: 8),
    //                         Expanded(
    //                           child: Text(
    //                             '${r.name} (${(r.score * 100).toInt()}%)',
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //           ],
    //         ],
    //       ),
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //           Navigator.pop(context);
    //         },
    //         child: const Text('Take Another Photo'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //           Navigator.pop(context);
    //         },
    //         style: ElevatedButton.styleFrom(
    //           backgroundColor: Colors.blue,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //         ),
    //         child: const Text(
    //           'Continue Scanning',
    //           style: TextStyle(color: Colors.white),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
