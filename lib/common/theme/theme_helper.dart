import 'package:flutter/material.dart';

/// Helper class để cung cấp màu sắc consistent cho toàn bộ ứng dụng
class ThemeHelper {
  /// Get primary color based on theme
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  /// Get secondary color based on theme
  static Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  /// Get surface color based on theme
  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  /// Get background color based on theme
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  /// Get card color based on theme
  static Color getCardColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  /// Get text color based on theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
  }

  /// Get secondary text color based on theme
  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .bodyMedium
            ?.color
            ?.withValues(alpha: 0.7) ??
        Colors.grey;
  }

  /// Get disabled text color based on theme
  static Color getDisabledTextColor(BuildContext context) {
    return Theme.of(context).disabledColor;
  }

  /// Get error color based on theme
  static Color getErrorColor(BuildContext context) {
    return Theme.of(context).colorScheme.error;
  }

  /// Get success color (always green, works in both themes)
  static Color getSuccessColor(BuildContext context) {
    return const Color(0xFF10B981);
  }

  /// Get warning color (always orange, works in both themes)
  static Color getWarningColor(BuildContext context) {
    return const Color(0xFFF59E0B);
  }

  /// Get info color based on primary color
  static Color getInfoColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  /// Get shadow color based on theme
  static Color getShadowColor(BuildContext context) {
    return Theme.of(context).shadowColor.withValues(alpha: 0.1);
  }

  /// Get divider color based on theme
  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  /// Get gradient colors for cards based on theme
  static List<Color> getCardGradientColors(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return [
        Theme.of(context).primaryColor.withValues(alpha: 0.2),
        Theme.of(context).primaryColor.withValues(alpha: 0.1),
      ];
    } else {
      return [
        const Color(0xFFE0E7FF),
        const Color(0xFFF3E8FF),
      ];
    }
  }

  /// Get icon color based on theme
  static Color getIconColor(BuildContext context) {
    return Theme.of(context).iconTheme.color ?? getTextColor(context);
  }

  /// Get outline color based on theme
  static Color getOutlineColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.white.withValues(alpha: 0.2);
    } else {
      return Colors.black.withValues(alpha: 0.1);
    }
  }
}
