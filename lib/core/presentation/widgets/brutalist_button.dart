import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';

class BrutalistButton extends StatefulWidget {
  const BrutalistButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.offsetX = 4.0,
    this.offsetY = 4.0,
    this.icon,
    this.width = double.infinity,
    this.height = 50.0,
    this.isFullWidth = false,
  });
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double offsetX;
  final double offsetY;
  final IconData? icon;
  final double width;
  final double height;
  final bool isFullWidth;

  @override
  State<BrutalistButton> createState() => _BrutalistButtonState();
}

class _BrutalistButtonState extends State<BrutalistButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Container(
        width: widget.isFullWidth ? double.infinity : widget.width,
        height: widget.height,
        margin: EdgeInsets.only(
          bottom: widget.offsetY,
          right: widget.offsetX,
        ),
        child: Stack(
          children: [
            // Shadow/Offset layer
            Positioned(
              left: _isPressed ? 0 : widget.offsetX,
              top: _isPressed ? 0 : widget.offsetY,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.borderColor,
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            // Main button
            AnimatedPositioned(
              duration: const Duration(milliseconds: 50),
              left: 0,
              top: 0,
              right: _isPressed ? widget.offsetX : 0,
              bottom: _isPressed ? widget.offsetY : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  border: Border.all(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: widget.textColor,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                      ],
                      Text(
                        widget.text.toUpperCase(),
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
