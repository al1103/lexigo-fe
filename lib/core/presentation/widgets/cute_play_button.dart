import 'package:flutter/material.dart';

class CutePlayButton extends StatelessWidget {
  const CutePlayButton({
    required this.onPressed,
    this.text = 'Play',
    this.iconAsset,
    this.iconData,
    this.backgroundColor = const Color(0xFFFE8EDE),
    this.textColor = Colors.white,
    this.width = 460,
    this.height = 99,
    this.fontSize = 36.8,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 22,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final String? iconAsset;
  final IconData? iconData;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            const SizedBox(width: 12),
            if (iconAsset != null)
              Image.asset(
                iconAsset!,
                width: 40,
                height: 41,
              )
            else if (iconData != null)
              Icon(
                iconData,
                size: 40,
                color: textColor,
              ),
          ],
        ),
      ),
    );
  }
}

class CutePlayButtonResponsive extends StatelessWidget {
  const CutePlayButtonResponsive({
    required this.onPressed,
    this.text = 'Play',
    this.iconAsset,
    this.iconData,
    this.backgroundColor = const Color(0xFFFE8EDE),
    this.textColor = Colors.white,
    this.width,
    this.height = 80,
    this.fontSize = 32.0,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 22,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final String? iconAsset;
  final IconData? iconData;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.85,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            const SizedBox(width: 12),
            if (iconAsset != null)
              Image.asset(
                iconAsset!,
                width: 40,
                height: 41,
              )
            else if (iconData != null)
              Icon(
                iconData,
                size: 40,
                color: textColor,
              ),
          ],
        ),
      ),
    );
  }
}
