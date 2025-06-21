import 'package:flutter/material.dart';
import 'package:lexigo/common/widgets/app_toast.dart';

extension ContextExtensions on BuildContext {
  // Theme shortcuts
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Screen size shortcuts
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  bool get isSmallScreen => screenWidth < 600;

  // Padding shortcuts
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // Navigation shortcuts
  void pop([dynamic result]) => Navigator.of(this).pop(result);
  Future<T?> push<T>(Widget page) => Navigator.of(this).push<T>(
        MaterialPageRoute(builder: (_) => page),
      );

  // Toast shortcuts (reuse from previous)
  void showSuccessToast(String message) => AppToast.success(message);
  void showErrorToast(String message) => AppToast.error(message);
  void showWarningToast(String message) => AppToast.warning(message);
  void showInfoToast(String message) => AppToast.info(message);

  // Snackbar shortcut
  void showSnackbar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
