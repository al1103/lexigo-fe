import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';

class BrutalistCard extends StatelessWidget {
  const BrutalistCard({
    required this.child,
    super.key,
    this.backgroundColor = AppColors.cardBackground,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.offsetX = 5.0,
    this.offsetY = 5.0,
    this.padding = const EdgeInsets.all(16),
    this.elevation = 0,
    this.onTap,
  });
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double offsetX;
  final double offsetY;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Shadow/Offset layer
          Positioned(
            left: offsetX,
            top: offsetY,
            child: Container(
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.zero,
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Main card
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.zero,
            ),
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}

class BrutalistTile extends StatelessWidget {
  const BrutalistTile({
    required this.title,
    super.key,
    this.subtitle,
    this.icon,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
  });
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return BrutalistCard(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      offsetX: 3,
      offsetY: 3,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null)
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: borderColor,
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
