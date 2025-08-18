import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class AppToast {
  static FToast? _fToast;

  static void init(BuildContext context) {
    _fToast = FToast();
    _fToast!.init(context);
  }

  // Quick toast methods
  static void success(String message) {
    _showToast(message, ToastType.success);
  }

  static void error(String message) {
    _showToast(message, ToastType.error);
  }

  static void warning(String message) {
    _showToast(message, ToastType.warning);
  }

  static void info(String message) {
    _showToast(message, ToastType.info);
  }

  // Custom toast with more options
  static void custom({
    required String message,
    required ToastType type,
    Duration? duration,
    ToastGravity? gravity,
    String? title,
    IconData? customIcon,
    VoidCallback? onTap,
  }) {
    _showToast(
      message,
      type,
      duration: duration,
      gravity: gravity,
      title: title,
      customIcon: customIcon,
      onTap: onTap,
    );
  }

  // Loading toast
  static void loading(String message) {
    if (_fToast == null) return;

    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    _fToast!.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
    );
  }

  // Reminder toast for learning
  static void reminder({
    required String message,
    required VoidCallback onLearnNow,
    required VoidCallback onSnooze,
    Duration? duration,
    ToastGravity? gravity,
    String? title,
  }) {
    _showToast(
      message,
      ToastType.info,
      duration: duration ?? const Duration(seconds: 5),
      gravity: gravity ?? ToastGravity.TOP,
      title: title ?? 'Đến giờ học rồi!',
      customIcon: Icons.alarm,
      onTap: onLearnNow,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: onLearnNow,
            child: const Text('Học ngay', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: onSnooze,
            child: const Text('Hoãn', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  static void _showToast(
    String message,
    ToastType type, {
    Duration? duration,
    ToastGravity? gravity,
    String? title,
    IconData? customIcon,
    VoidCallback? onTap,
    Widget? customWidget,
  }) {
    if (_fToast == null) return;

    final config = _getToastConfig(type);

    final Widget toast = GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: config.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: config.borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: config.shadowColor,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: config.iconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                customIcon ?? config.icon,
                color: config.iconColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null) ...[
                    Text(
                      title,
                      style: TextStyle(
                        color: config.titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    message,
                    style: TextStyle(
                      color: config.textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                color: config.textColor.withValues(alpha: 0.5),
                size: 14,
              ),
          ],
        ),
      ),
    );

    _fToast!.showToast(
      child: toast,
      gravity: gravity ?? ToastGravity.TOP,
      toastDuration: duration ?? const Duration(seconds: 3),
    );
  }

  static _ToastConfig _getToastConfig(ToastType type) {
    switch (type) {
      case ToastType.success:
        return _ToastConfig(
          backgroundColor: const Color(0xFFF0FDF4),
          borderColor: const Color(0xFF10B981),
          shadowColor: const Color(0xFF10B981).withValues(alpha: 0.4),
          iconBackgroundColor: const Color(0xFF10B981)..withValues(alpha: 0.1),
          iconColor: const Color(0xFF10B981),
          titleColor: const Color(0xFF065F46),
          textColor: const Color(0xFF047857),
          icon: Icons.check_circle_outline,
        );
      case ToastType.error:
        return _ToastConfig(
          backgroundColor: const Color(0xFFFEF2F2),
          borderColor: const Color(0xFFEF4444),
          shadowColor: const Color(0xFFEF4444).withValues(alpha: 0.4),
          iconBackgroundColor: const Color(0xFFEF4444)..withValues(alpha: 0.1),
          iconColor: const Color(0xFFEF4444),
          titleColor: const Color(0xFF991B1B),
          textColor: const Color(0xFFDC2626),
          icon: Icons.error_outline,
        );
      case ToastType.warning:
        return _ToastConfig(
          backgroundColor: const Color(0xFFFEFBF3),
          borderColor: const Color(0xFFF59E0B),
          shadowColor: const Color(0xFFF59E0B).withValues(alpha: 0.4),
          iconBackgroundColor: const Color(0xFFF59E0B)..withValues(alpha: 0.1),
          iconColor: const Color(0xFFF59E0B),
          titleColor: const Color(0xFF92400E),
          textColor: const Color(0xFFD97706),
          icon: Icons.warning_outlined,
        );
      case ToastType.info:
        return _ToastConfig(
          backgroundColor: const Color(0xFFF0F9FF),
          borderColor: const Color(0xFF3B82F6),
          shadowColor: const Color(0xFF3B82F6)..withValues(alpha: 0.2),
          iconBackgroundColor: const Color(0xFF3B82F6)..withValues(alpha: 0.1),
          iconColor: const Color(0xFF3B82F6),
          titleColor: const Color(0xFF1E40AF),
          textColor: const Color(0xFF2563EB),
          icon: Icons.info_outline,
        );
    }
  }

  // Clear all toasts
  static void removeAll() {
    _fToast?.removeQueuedCustomToasts();
  }

  // Simple snackbar alternative
  static void snackbar(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    Duration? duration,
    SnackBarAction? action,
  }) {
    final config = _getToastConfig(type);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              config.icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: config.borderColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: duration ?? const Duration(seconds: 3),
        action: action,
      ),
    );
  }
}

class _ToastConfig {
  _ToastConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.titleColor,
    required this.textColor,
    required this.icon,
  });
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color textColor;
  final IconData icon;
}
