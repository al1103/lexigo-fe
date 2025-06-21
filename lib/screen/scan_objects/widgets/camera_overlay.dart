import 'package:flutter/material.dart';
import 'package:lexigo/screen/scan_objects/widgets/square_overlay_painter.dart';

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({
    required this.isFlashOn,
    required this.isCapturing,
    required this.onFlashToggle,
    required this.onCapture,
    required this.onBack,
    super.key,
  });

  final bool isFlashOn;
  final bool isCapturing;
  final VoidCallback onFlashToggle;
  final VoidCallback onCapture;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final squareSize = size.width; // SAME calculation as camera crop

    return Stack(
      children: [
        // Square overlay
        CustomPaint(
          size: Size(size.width, size.height),
          painter: SquareOverlayPainter(
            squareSize: squareSize,
            screenSize: size,
          ),
        ),

        // Top controls
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildControlButton(
                  icon: Icons.arrow_back,
                  onPressed: onBack,
                ),
                Row(
                  children: [
                    _buildControlButton(
                      icon: isFlashOn ? Icons.flash_on : Icons.flash_off,
                      onPressed: onFlashToggle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Capture button
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: isCapturing ? null : onCapture,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: isCapturing ? 70 : 80,
                    height: isCapturing ? 70 : 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: isCapturing
                        ? const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 3,
                              ),
                            ),
                          )
                        : const Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isCapturing ? 'Processing...' : 'Tap to capture',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
