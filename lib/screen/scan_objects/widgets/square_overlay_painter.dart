import 'package:flutter/material.dart';

class SquareOverlayPainter extends CustomPainter {
  SquareOverlayPainter({
    required this.squareSize,
    required this.screenSize,
  });

  final double squareSize;
  final Size screenSize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Calculate square position (centered)
    final squareLeft = (size.width - squareSize) / 2;
    final squareTop = (size.height - squareSize) / 2;

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(squareLeft, squareTop, squareSize, squareSize),
        const Radius.circular(20),
      ),
    );

    path.fillType = PathFillType.evenOdd;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
