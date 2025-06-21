import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/screen/scan_objects/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class ScanObjectScreen extends StatefulWidget {
  const ScanObjectScreen({super.key});

  @override
  State<ScanObjectScreen> createState() => _ScanObjectState();
}

class _ScanObjectState extends State<ScanObjectScreen> {
  bool _dialogShown = false;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _checkPermissionAndOpenCamera(),
    );
  }

  Future<void> _checkPermissionAndOpenCamera() async {
    if (_dialogShown || _isNavigating) return;

    final status = await Permission.camera.status;
    if (status.isGranted) {
      _openCamera();
    } else {
      _requestPermission();
    }
  }

  Future<void> _requestPermission() async {
    if (_dialogShown || _isNavigating) return;

    try {
      final status = await Permission.camera.request();

      if (status.isGranted) {
        _openCamera();
      } else if (status.isPermanentlyDenied) {
        _showSettingsDialog();
      } else {
        _showPermissionDialog();
      }
    } catch (e) {
      _showErrorDialog('Failed to request camera permission.');
    }
  }

  Future<void> _openCamera() async {
    if (_isNavigating) return;

    try {
      setState(() => _isNavigating = true);

      final cameras = await availableCameras();
      if (cameras.isNotEmpty && mounted) {
        // Use a delayed navigation to avoid navigator lock
        await Future.delayed(const Duration(milliseconds: 100));

        if (!mounted) return;

        final route = MaterialPageRoute<void>(
          builder: (context) => CameraScreen(camera: cameras.first),
        );

        await Navigator.pushReplacement(context, route);
      } else {
        _showErrorDialog('No cameras available on this device.');
      }
    } catch (e) {
      debugPrint('Error opening camera: $e');
      _showErrorDialog('Failed to access camera.');
    } finally {
      if (mounted) {
        setState(() => _isNavigating = false);
      }
    }
  }

  Future<void> _showPermissionDialog() async {
    if (_dialogShown || _isNavigating) return;
    _dialogShown = true;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.camera_alt, color: Colors.blue),
            SizedBox(width: 12),
            Text('Camera Permission Required'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lexigo needs camera access to scan objects and help you learn vocabulary.',
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.security, color: Colors.blue, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Your privacy is protected. Images are processed locally.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _dialogShown = false;
              _requestPermission();
            },
            child: const Text('Allow Camera'),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Camera permission is permanently denied. Please enable it in Settings > Apps > Lexigo > Permissions.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_dialogShown || _isNavigating) {
          return false;
        }
        return true;
      },
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.blue)),
      ),
    );
  }
}
