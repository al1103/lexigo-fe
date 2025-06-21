import 'package:flutter/material.dart';
import 'package:lexigo/common/widgets/app_toast.dart';

/// Extension methods for easy toast usage
extension ToastContext on BuildContext {
  void showSuccessToast(String message) {
    AppToast.success(message);
  }

  void showErrorToast(String message) {
    AppToast.error(message);
  }

  void showWarningToast(String message) {
    AppToast.warning(message);
  }

  void showInfoToast(String message) {
    AppToast.info(message);
  }

  void showLoadingToast(String message) {
    AppToast.loading(message);
  }

  void showCustomToast({
    required String message,
    required ToastType type,
    Duration? duration,
    String? title,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    AppToast.custom(
      message: message,
      type: type,
      duration: duration,
      title: title,
      customIcon: icon,
      onTap: onTap,
    );
  }
}

/// Pre-defined toast messages for common scenarios
class ToastMessages {
  // Auth messages
  static const String loginSuccess = 'Welcome back!';
  static const String loginError = 'Invalid username or password';
  static const String logoutSuccess = 'Logged out successfully';

  // Quiz messages
  static const String quizCompleted = 'Quiz completed successfully!';
  static const String answerCorrect = 'Correct answer! 🎉';
  static const String answerIncorrect = 'Incorrect answer. Try again!';
  static const String quizSaved = 'Progress saved';

  // Bookmark messages
  static const String bookmarkAdded = 'Question bookmarked!';
  static const String bookmarkRemoved = 'Bookmark removed';
  static const String bookmarkCleared = 'All bookmarks cleared';

  // Learning messages
  static const String wordLearned = 'Word added to your vocabulary!';
  static const String levelCompleted = 'Level completed! 🎊';
  static const String streakMaintained = 'Study streak maintained! 🔥';

  // Network messages
  static const String networkError = 'Network connection failed';
  static const String loadingData = 'Loading...';
  static const String syncSuccess = 'Data synced successfully';

  // General messages
  static const String saveSuccess = 'Changes saved';
  static const String deleteSuccess = 'Item deleted';
  static const String updateSuccess = 'Updated successfully';
  static const String copySuccess = 'Copied to clipboard';
}
