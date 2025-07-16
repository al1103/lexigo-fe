import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';

class CuteButton extends StatefulWidget {
  const CuteButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.width = 0,
    this.isFullWidth = false,
    this.icon,
    this.customIcon,
    this.borderRadius = 24.0,
    this.hasShadow = true,
    this.hasBorder = true,
    this.borderColor,
    this.gradientColors,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.elevation = 0,
    this.textStyle,
    this.height = 50,
    this.gradientBegin,
    this.gradientEnd,
    this.showPressEffect = true,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final bool isFullWidth;
  final IconData? icon;
  final Widget? customIcon;
  final double borderRadius;
  final bool hasShadow;
  final bool hasBorder;
  final Color? borderColor;
  final List<Color>? gradientColors;
  final bool isLoading;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final TextStyle? textStyle;
  final double height;
  final Alignment? gradientBegin;
  final Alignment? gradientEnd;
  final bool showPressEffect;

  @override
  State<CuteButton> createState() => _CuteButtonState();
}

class _CuteButtonState extends State<CuteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.showPressEffect) return;
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.showPressEffect) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    if (!widget.showPressEffect) return;
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Use the provided border color or default to the button's background color
    final effectiveBorderColor = widget.borderColor ?? widget.backgroundColor;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.isFullWidth
                ? double.infinity
                : (widget.width > 0 ? widget.width : null),
            height: widget.height,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: widget.hasShadow
                ? BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius + 6),
                    boxShadow: [
                      BoxShadow(
                        color: _isPressed
                            ? widget.backgroundColor.withValues(alpha: 0.3)
                            : widget.backgroundColor.withValues(alpha: 0.4),
                        spreadRadius: _isPressed ? 0 : 1,
                        blurRadius: _isPressed ? 4 : 6,
                        offset: _isPressed
                            ? const Offset(0, 2)
                            : const Offset(0, 4),
                      ),
                    ],
                  )
                : null,
            child: GestureDetector(
              onTapDown: _handleTapDown,
              onTapUp: _handleTapUp,
              onTapCancel: _handleTapCancel,
              onTap: widget.isLoading ? null : widget.onPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.gradientColors == null
                      ? widget.backgroundColor
                      : null,
                  gradient: widget.gradientColors != null
                      ? LinearGradient(
                          colors: widget.gradientColors!,
                          begin: widget.gradientBegin ?? Alignment.centerLeft,
                          end: widget.gradientEnd ?? Alignment.centerRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  border: widget.hasBorder
                      ? Border.all(color: effectiveBorderColor, width: 2)
                      : null,
                ),
                padding: widget.padding,
                child: Center(
                  child: widget.isLoading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(widget.textColor),
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.customIcon != null) ...[
                              widget.customIcon!,
                              const SizedBox(width: 8),
                            ] else if (widget.icon != null) ...[
                              Icon(
                                widget.icon,
                                size: 20,
                                color: widget.textColor,
                              ),
                              const SizedBox(width: 8),
                            ],
                            Text(
                              widget.text,
                              style: widget.textStyle ??
                                  AppTextStyles.buttonText.copyWith(
                                    color: widget.textColor,
                                  ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CuteIconButton extends StatefulWidget {
  const CuteIconButton({
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = AppColors.primary,
    this.size = 40,
    this.hasShadow = true,
    this.hasBorder = true,
    this.borderColor,
    this.gradientColors,
    this.isLoading = false,
    this.customIcon,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final bool hasShadow;
  final bool hasBorder;
  final Color? borderColor;
  final List<Color>? gradientColors;
  final bool isLoading;
  final Widget? customIcon;

  @override
  State<CuteIconButton> createState() => _CuteIconButtonState();
}

class _CuteIconButtonState extends State<CuteIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.92).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Use the provided border color or default to the button's background color
    final effectiveBorderColor = widget.borderColor ?? widget.backgroundColor;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: widget.hasShadow
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.size / 2 + 4),
                    boxShadow: [
                      BoxShadow(
                        color: _isPressed
                            ? Colors.black.withValues(alpha: 0.5)
                            : Colors.black
                          ..withValues(alpha: 0.1),
                        spreadRadius: _isPressed ? 0 : 1,
                        blurRadius: _isPressed ? 3 : 6,
                        offset: _isPressed
                            ? const Offset(0, 1)
                            : const Offset(0, 2),
                      ),
                    ],
                  )
                : null,
            child: GestureDetector(
              onTapDown: _handleTapDown,
              onTapUp: _handleTapUp,
              onTapCancel: _handleTapCancel,
              onTap: widget.isLoading ? null : widget.onPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.gradientColors == null
                      ? widget.backgroundColor
                      : null,
                  gradient: widget.gradientColors != null
                      ? LinearGradient(
                          colors: widget.gradientColors!,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  shape: BoxShape.circle,
                  border: widget.hasBorder
                      ? Border.all(color: effectiveBorderColor, width: 2)
                      : null,
                ),
                child: Center(
                  child: widget.isLoading
                      ? SizedBox(
                          width: widget.size / 3,
                          height: widget.size / 3,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(widget.iconColor),
                          ),
                        )
                      : widget.customIcon ??
                          Icon(
                            widget.icon,
                            color: widget.iconColor,
                            size: widget.size / 2,
                          ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CuteOutlinedButton extends StatelessWidget {
  const CuteOutlinedButton({
    required this.text,
    required this.onPressed,
    this.borderColor = AppColors.primary,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.primary,
    this.width = 0,
    this.isFullWidth = false,
    this.icon,
    this.isLoading = false,
    this.height = 50,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final bool isFullWidth;
  final IconData? icon;
  final bool isLoading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CuteButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      textColor: textColor,
      width: width,
      isFullWidth: isFullWidth,
      icon: icon,
      borderRadius: 25,
      borderColor: borderColor,
      isLoading: isLoading,
      height: height,
    );
  }
}
