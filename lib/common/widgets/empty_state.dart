import 'package:flutter/material.dart';
import 'package:lexigo/common/theme/app_colors.dart';
import 'package:lexigo/common/widgets/app_button.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
    this.buttonText,
    this.onButtonPressed,
    this.customAction,
  });

  const EmptyState.noBookmarks({
    super.key,
    this.buttonText,
    this.onButtonPressed,
    this.customAction,
  })  : icon = Icons.bookmark_border,
        title = 'No bookmarks yet',
        subtitle = 'Bookmark questions during quizzes\nto review them later';

  const EmptyState.noResults({
    super.key,
    this.buttonText,
    this.onButtonPressed,
    this.customAction,
  })  : icon = Icons.search_off,
        title = 'No results found',
        subtitle = 'Try adjusting your search criteria';
  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Widget? customAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                icon,
                size: 80,
                color: AppColors.primary.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.h2.copyWith(
                color: AppColors.neutral800,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.body1.copyWith(
                color: AppColors.neutral500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            if (customAction != null)
              customAction!
            else if (buttonText != null && onButtonPressed != null)
              AppButton.primary(
                text: buttonText!,
                onPressed: onButtonPressed,
                icon: const Icon(Icons.add),
              ),
          ],
        ),
      ),
    );
  }
}
