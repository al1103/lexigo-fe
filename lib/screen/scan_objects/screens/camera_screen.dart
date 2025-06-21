import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:lexigo/screen/scan_objects/screens/image_preview_screen.dart';
import 'package:lexigo/screen/scan_objects/widgets/camera_overlay.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class CameraScreen extends StatefulWidget {
  const CameraScreen({required this.camera, super.key});
  final CameraDescription camera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;
  bool _isCapturing = false;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggleFlash() async {
    setState(() => _isFlashOn = !_isFlashOn);
    await _controller
        .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
  }

  Future<void> _takePicture() async {
    if (_isCapturing || _isNavigating) return;

    try {
      setState(() => _isCapturing = true);

      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      final squareImagePath = await _cropToSquare(image.path);

      if (mounted) {
        setState(() {
          _isCapturing = false;
          _isNavigating = true;
        });

        // Use a delayed navigation to avoid navigator lock
        await Future.delayed(const Duration(milliseconds: 100));

        if (!mounted) return;

        final route = MaterialPageRoute<void>(
          builder: (context) => ImagePreviewScreen(imagePath: squareImagePath),
        );

        await Navigator.push(context, route);

        if (mounted) {
          setState(() => _isNavigating = false);
        }
      }
    } catch (e) {
      debugPrint('Error taking picture: $e');
      setState(() {
        _isCapturing = false;
        _isNavigating = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<String> _cropToSquare(String imagePath) async {
    try {
      final originalFile = File(imagePath);
      final originalBytes = await originalFile.readAsBytes();

      final originalImage = img.decodeImage(originalBytes);
      if (originalImage == null) return imagePath;

      final size = originalImage.width < originalImage.height
          ? originalImage.width
          : originalImage.height;

      final x = (originalImage.width - size) ~/ 2;
      final y = (originalImage.height - size) ~/ 2;

      final croppedImage = img.copyCrop(
        originalImage,
        x: x,
        y: y,
        width: size,
        height: size,
      );

      final directory = await getTemporaryDirectory();
      final croppedFile = File(
        '${directory.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      await croppedFile.writeAsBytes(img.encodeJpg(croppedImage));

      return croppedFile.path;
    } catch (e) {
      debugPrint('Error cropping image: $e');
      return imagePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isCapturing || _isNavigating) {
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final size = MediaQuery.of(context).size;

              return Stack(
                fit: StackFit.expand,
                children: [
                  OverflowBox(
                    maxHeight: size.height,
                    maxWidth: size.height * _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                  CameraOverlay(
                    isFlashOn: _isFlashOn,
                    isCapturing: _isCapturing,
                    onFlashToggle: _toggleFlash,
                    onCapture: _takePicture,
                    onBack: () {
                      if (!_isCapturing && !_isNavigating) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
