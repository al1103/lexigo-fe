import 'package:flutter/material.dart';
import 'package:lexigo/common/theme/app_colors.dart';
import 'package:lexigo/common/widgets/app_button.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    this.title,
    this.message,
    this.onRetry,
    this.icon,
  });

  const ErrorState.network({
    super.key,
    this.onRetry,
  })  : title = 'Connection Error',
        message = 'Please check your internet connection and try again',
        icon = Icons.wifi_off;

  const ErrorState.generic({
    super.key,
    this.onRetry,
  })  : title = 'Something went wrong',
        message = 'An unexpected error occurred. Please try again',
        icon = Icons.error_outline;
  final String? title;
  final String? message;
  final VoidCallback? onRetry;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 80,
              color: AppColors.error.withOpacity(0.7),
            ),
            const SizedBox(height: 24),
            Text(
              title ?? 'Error',
              style: AppTextStyles.h2.copyWith(
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.neutral500,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 32),
              AppButton.primary(
                text: 'Try Again',
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
