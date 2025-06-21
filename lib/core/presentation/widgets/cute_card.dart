import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';

class CuteCard extends StatelessWidget {
  const CuteCard({
    required this.child,
    this.backgroundColor = Colors.white,
    this.gradientColors,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(16),
    this.hasShadow = true,
    this.width,
    this.height,
    this.onTap,
    this.borderColor,
    this.borderWidth = 1.5,
    this.gradientBegin,
    this.gradientEnd,
    this.border,
    this.margin = const EdgeInsets.symmetric(vertical: 6),
    this.isActive = false,
    this.activeColor = AppColors.primary,
    super.key,
  });
  final Widget child;
  final Color backgroundColor;
  final List<Color>? gradientColors;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool hasShadow;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Color? borderColor;
  final double borderWidth;
  final Alignment? gradientBegin;
  final Alignment? gradientEnd;
  final BoxBorder? border;
  final EdgeInsetsGeometry margin;
  final bool isActive;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: gradientColors == null ? backgroundColor : null,
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: gradientBegin ?? Alignment.topLeft,
                  end: gradientEnd ?? Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border ??
              (borderColor != null || isActive
                  ? Border.all(
                      color: isActive ? activeColor : borderColor!,
                      width: isActive ? borderWidth + 0.5 : borderWidth,
                    )
                  : null),
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: (isActive ? activeColor : Colors.black)
                        .withOpacity(isActive ? 0.15 : 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                    spreadRadius: 1,
                  ),
                  if (isActive)
                    BoxShadow(
                      color: activeColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                ]
              : null,
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}

class CuteBubbleCard extends StatelessWidget {
  const CuteBubbleCard({
    required this.child,
    this.backgroundColor = Colors.white,
    this.gradientColors,
    this.padding = const EdgeInsets.all(16),
    this.hasShadow = true,
    this.width,
    this.onTap,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.5,
    this.tipPosition = BubbleTipPosition.bottomLeft,
    this.borderRadius = 24,
    super.key,
  });
  final Widget child;
  final Color backgroundColor;
  final List<Color>? gradientColors;
  final EdgeInsetsGeometry padding;
  final bool hasShadow;
  final double? width;
  final VoidCallback? onTap;
  final Color borderColor;
  final double borderWidth;
  final BubbleTipPosition tipPosition;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: gradientColors == null ? backgroundColor : null,
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != Colors.transparent
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            const SizedBox(height: 8),
            _buildTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildTip() {
    switch (tipPosition) {
      case BubbleTipPosition.bottomLeft:
        return Align(
          alignment: Alignment.bottomLeft,
          child: CustomPaint(
            size: const Size(16, 16),
            painter: BubbleTipPainter(
              backgroundColor: gradientColors?.first ?? backgroundColor,
            ),
          ),
        );
      case BubbleTipPosition.bottomRight:
        return Align(
          alignment: Alignment.bottomRight,
          child: CustomPaint(
            size: const Size(16, 16),
            painter: BubbleTipPainter(
              backgroundColor: gradientColors?.last ?? backgroundColor,
              flipped: true,
            ),
          ),
        );
      case BubbleTipPosition.topLeft:
        return Align(
          alignment: Alignment.topLeft,
          child: CustomPaint(
            size: const Size(16, 16),
            painter: BubbleTipPainter(
              backgroundColor: gradientColors?.first ?? backgroundColor,
              direction: BubbleTipDirection.up,
            ),
          ),
        );
      case BubbleTipPosition.topRight:
        return Align(
          alignment: Alignment.topRight,
          child: CustomPaint(
            size: const Size(16, 16),
            painter: BubbleTipPainter(
              backgroundColor: gradientColors?.last ?? backgroundColor,
              direction: BubbleTipDirection.up,
              flipped: true,
            ),
          ),
        );
    }
  }
}

enum BubbleTipPosition {
  bottomLeft,
  bottomRight,
  topLeft,
  topRight,
}

enum BubbleTipDirection {
  up,
  down,
}

class BubbleTipPainter extends CustomPainter {
  BubbleTipPainter({
    required this.backgroundColor,
    this.direction = BubbleTipDirection.down,
    this.flipped = false,
  });
  final Color backgroundColor;
  final BubbleTipDirection direction;
  final bool flipped;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;
    final path = Path();

    if (direction == BubbleTipDirection.down) {
      if (!flipped) {
        // Bottom left pointing down
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height);
      } else {
        // Bottom right pointing down
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
      }
    } else {
      if (!flipped) {
        // Top left pointing up
        path.moveTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(0, 0);
      } else {
        // Top right pointing up
        path.moveTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CuteMenuCard extends StatelessWidget {
  const CuteMenuCard({
    required this.child,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.activeColor = AppColors.primary,
    this.isActive = false,
    this.size = 70,
    this.borderRadius = 20,
    this.gradientColors,
    super.key,
  });
  final Widget child;
  final Color backgroundColor;
  final Color activeColor;
  final bool isActive;
  final VoidCallback onTap;
  final double size;
  final double borderRadius;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isActive && gradientColors == null
              ? activeColor.withOpacity(0.2)
              : (gradientColors == null ? backgroundColor : null),
          gradient: gradientColors != null && !isActive
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : (gradientColors != null && isActive
                  ? LinearGradient(
                      colors: [
                        activeColor.withOpacity(0.2),
                        activeColor.withOpacity(0.3),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isActive ? activeColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: (isActive ? activeColor : Colors.black)
                  .withOpacity(isActive ? 0.15 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
