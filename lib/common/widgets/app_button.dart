import 'package:flutter/material.dart';
import 'package:lexigo/common/theme/app_colors.dart';

enum ButtonVariant { primary, secondary, outline, ghost, danger }

enum ButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    super.key,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  const AppButton.primary({
    required this.text,
    super.key,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = ButtonVariant.primary;

  const AppButton.secondary({
    required this.text,
    super.key,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = ButtonVariant.secondary;

  const AppButton.outline({
    required this.text,
    super.key,
    this.onPressed,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : variant = ButtonVariant.outline;
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final config = _getButtonConfig();

    final Widget child = isLoading
        ? SizedBox(
            width: config.iconSize,
            height: config.iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(config.foregroundColor),
            ),
          )
        : Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(text, style: config.textStyle),
            ],
          );

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: config.backgroundColor,
        foregroundColor: config.foregroundColor,
        elevation: config.elevation,
        padding: EdgeInsets.symmetric(
          horizontal: config.horizontalPadding,
          vertical: config.verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
          side: config.borderSide,
        ),
      ),
      child: child,
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }

  _ButtonConfig _getButtonConfig() {
    switch (variant) {
      case ButtonVariant.primary:
        return _ButtonConfig(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          borderSide: BorderSide.none,
          elevation: 0,
        );
      case ButtonVariant.secondary:
        return _ButtonConfig(
          backgroundColor: AppColors.neutral100,
          foregroundColor: AppColors.neutral700,
          borderSide: BorderSide.none,
          elevation: 0,
        );
      case ButtonVariant.outline:
        return _ButtonConfig(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          borderSide: const BorderSide(color: AppColors.primary),
          elevation: 0,
        );
      case ButtonVariant.ghost:
        return _ButtonConfig(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          borderSide: BorderSide.none,
          elevation: 0,
        );
      case ButtonVariant.danger:
        return _ButtonConfig(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          borderSide: BorderSide.none,
          elevation: 0,
        );
    }
  }
}

class _ButtonConfig {
  _ButtonConfig({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderSide,
    required this.elevation,
  });
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderSide borderSide;
  final double elevation;

  // Size-based properties
  double get horizontalPadding => 20;
  double get verticalPadding => 14;
  double get borderRadius => 12;
  double get iconSize => 20;
  TextStyle get textStyle =>
      AppTextStyles.button.copyWith(color: foregroundColor);
}
