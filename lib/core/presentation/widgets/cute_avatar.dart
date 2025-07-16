import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';

class CuteAvatar extends StatelessWidget {
  const CuteAvatar({
    this.imageUrl,
    this.size = 50,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.primary,
    this.icon,
    this.iconColor = AppColors.primary,
    this.showBorder = true,
    this.onTap,
    this.badge,
    this.accessory,
    this.accessoryColor,
    super.key,
  });
  final String? imageUrl;
  final double size;
  final Color backgroundColor;
  final Color borderColor;
  final IconData? icon;
  final Color iconColor;
  final bool showBorder;
  final VoidCallback? onTap;
  final Widget? badge;
  final String? accessory; // "frog_hat", "cloud_hat", etc.
  final Color? accessoryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Main avatar container
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: showBorder
                  ? Border.all(
                      color: borderColor,
                      width: size * 0.05,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black..withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null
                ? Center(
                    child: Icon(
                      icon ?? Icons.person,
                      size: size * 0.5,
                      color: iconColor,
                    ),
                  )
                : null,
          ),

          // Accessory (hat, etc)
          if (accessory != null)
            Positioned(
              top: -size * 0.25,
              left: 0,
              right: 0,
              child: _buildAccessory(),
            ),

          // Badge (stars, flags, etc)
          if (badge != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: badge!,
            ),
        ],
      ),
    );
  }

  Widget _buildAccessory() {
    // This is a placeholder - in a real app, you'd create custom accessories
    // based on the accessory name
    final color = accessoryColor ?? AppColors.green;

    if (accessory == 'frog_hat') {
      return Container(
        width: size * 0.9,
        height: size * 0.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size * 0.25),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Frog eyes
            Positioned(
              top: size * 0.1,
              left: size * 0.2,
              child: Container(
                width: size * 0.2,
                height: size * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: size * 0.1,
                  height: size * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.1,
              right: size * 0.2,
              child: Container(
                width: size * 0.2,
                height: size * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: size * 0.1,
                  height: size * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (accessory == 'cloud_hat') {
      return Container(
        width: size * 0.9,
        height: size * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size * 0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.black..withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: size * 0.05,
              left: size * 0.05,
              child: Container(
                width: size * 0.3,
                height: size * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: size * 0.05,
              right: size * 0.05,
              child: Container(
                width: size * 0.3,
                height: size * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -size * 0.1,
              left: size * 0.25,
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Default/generic accessory
    return Container(
      width: size * 0.7,
      height: size * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size * 0.15),
      ),
    );
  }
}

class CuteAvatarBadge extends StatelessWidget {
  const CuteAvatarBadge({
    required this.child,
    this.backgroundColor = AppColors.accent,
    this.size = 20,
    super.key,
  });
  final Widget child;
  final Color backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black..withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}

class CountryBadge extends StatelessWidget {
  const CountryBadge({
    required this.countryCode,
    this.size = 20,
    super.key,
  });
  final String countryCode;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CuteAvatarBadge(
      size: size,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Text(
          _getEmojiFlag(countryCode),
          style: TextStyle(fontSize: size * 0.7),
        ),
      ),
    );
  }

  String _getEmojiFlag(String countryCode) {
    final firstChar = countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
    final secondChar = countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;

    return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  }
}
