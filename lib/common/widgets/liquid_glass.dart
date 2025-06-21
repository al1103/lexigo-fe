import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class LiquidGlass extends StatefulWidget {
  const LiquidGlass({
    required this.child,
    super.key,
    this.borderRadius = 24,
    this.blurIntensity = 15,
    this.gradientColors = const [
      Color(0x33FFFFFF),
      Color(0x1AFFFFFF),
    ],
    this.animationDuration = const Duration(milliseconds: 1000),
    this.padding,
    this.margin,
    this.onTap,
    this.enableRipple = true,
    this.enableMorphing = false,
    this.enableFloatingBubbles = false,
    this.opacity = 0.2,
    this.width,
    this.height,
  });

  // Predefined variants
  const LiquidGlass.card({
    required this.child,
    super.key,
    this.onTap,
    this.margin,
  })  : borderRadius = 20,
        blurIntensity = 12,
        gradientColors = const [Color(0x26FFFFFF), Color(0x0DFFFFFF)],
        animationDuration = const Duration(milliseconds: 300),
        padding = const EdgeInsets.all(20),
        enableRipple = true,
        enableMorphing = false,
        enableFloatingBubbles = false,
        opacity = 0.15,
        width = null,
        height = null;

  const LiquidGlass.button({
    required this.child,
    required this.onTap,
    super.key,
    this.width,
    this.height = 56,
  })  : borderRadius = 16,
        blurIntensity = 10,
        gradientColors = const [
          Color(0x99667EEA),
          Color(0x66764BA2),
        ],
        animationDuration = const Duration(milliseconds: 200),
        padding = EdgeInsets.zero,
        margin = null,
        enableRipple = true,
        enableMorphing = true,
        enableFloatingBubbles = false,
        opacity = 0.6;

  const LiquidGlass.floating({
    required this.child,
    super.key,
    this.padding,
    this.margin,
  })  : borderRadius = 32,
        blurIntensity = 25,
        gradientColors = const [Color(0x40FFFFFF), Color(0x1AFFFFFF)],
        animationDuration = const Duration(milliseconds: 2000),
        onTap = null,
        enableRipple = false,
        enableMorphing = true,
        enableFloatingBubbles = true,
        opacity = 0.3,
        width = null,
        height = null;
  final Widget child;
  final double borderRadius;
  final double blurIntensity;
  final List<Color> gradientColors;
  final Duration animationDuration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool enableRipple;
  final bool enableMorphing;
  final bool enableFloatingBubbles;
  final double opacity;
  final double? width;
  final double? height;

  @override
  State<LiquidGlass> createState() => _LiquidGlassState();
}

class _LiquidGlassState extends State<LiquidGlass>
    with TickerProviderStateMixin {
  late AnimationController _morphController;
  late AnimationController _bubbleController;
  late AnimationController _shimmerController;

  late Animation<double> _morphAnimation;
  late Animation<double> _bubbleAnimation;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    // Morphing animation
    _morphController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _morphAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.easeInOut),
    );

    // Floating bubbles animation
    _bubbleController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    _bubbleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _bubbleController, curve: Curves.linear),
    );

    // Shimmer effect
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _shimmerAnimation = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    if (widget.enableMorphing) {
      _morphController.repeat(reverse: true);
    }

    if (widget.enableFloatingBubbles) {
      _bubbleController.repeat();
    }

    _shimmerController.repeat();
  }

  @override
  void dispose() {
    _morphController.dispose();
    _bubbleController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _morphController,
        _bubbleController,
        _shimmerController,
      ]),
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          child: Stack(
            children: [
              // Main liquid glass container
              _buildLiquidGlassContainer(),

              // Floating bubbles overlay
              if (widget.enableFloatingBubbles) _buildFloatingBubbles(),

              // Shimmer effect overlay
              _buildShimmerOverlay(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLiquidGlassContainer() {
    // Calculate morphing border radius
    final morphValue = widget.enableMorphing ? _morphAnimation.value : 0;
    final dynamicRadius = widget.borderRadius + (morphValue * 8);

    return ClipRRect(
      borderRadius: BorderRadius.circular(dynamicRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurIntensity + (morphValue * 5),
          sigmaY: widget.blurIntensity + (morphValue * 5),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.gradientColors.map((color) {
                // Add morphing opacity effect
                final alpha =
                    (color.alpha + (morphValue * 50)).clamp(0, 255).toInt();
                return color.withAlpha(alpha);
              }).toList(),
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.3 + (morphValue * 0.2)),
              width: 1 + (morphValue * 0.5),
            ),
            borderRadius: BorderRadius.circular(dynamicRadius),
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          splashColor: widget.enableRipple
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
          highlightColor: widget.enableRipple
              ? Colors.white.withOpacity(0.05)
              : Colors.transparent,
          child: Container(
            padding: widget.padding ?? const EdgeInsets.all(24),
            child: widget.child,
          ),
        ),
      );
    }

    return Container(
      padding: widget.padding ?? const EdgeInsets.all(24),
      child: widget.child,
    );
  }

  Widget _buildFloatingBubbles() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Stack(
          children: List.generate(5, (index) {
            final offset = (_bubbleAnimation.value + (index * 0.2)) % 1.0;
            final size = 20.0 + (index * 10);
            final leftPosition =
                (math.sin(offset * 2 * math.pi + index) + 1) / 2;
            final topPosition = offset;

            return Positioned(
              left: leftPosition * (widget.width ?? 200) - size / 2,
              top: topPosition * (widget.height ?? 200) - size / 2,
              child: _buildBubble(size, index),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildBubble(double size, int index) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 0.5,
        ),
      ),
    );
  }

  Widget _buildShimmerOverlay() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                _shimmerAnimation.value - 0.3,
                _shimmerAnimation.value,
                _shimmerAnimation.value + 0.3,
              ],
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.1),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Liquid Glass Background
class LiquidGlassBackground extends StatefulWidget {
  const LiquidGlassBackground({
    required this.child,
    super.key,
    this.backgroundColors = const [
      Color(0xFF667EEA),
      Color(0xFF764BA2),
      Color(0xFFF093FB),
      Color(0xFFF5576C),
    ],
    this.orbCount = 5,
    this.enableParallax = true,
  });
  final Widget child;
  final List<Color> backgroundColors;
  final int orbCount;
  final bool enableParallax;

  @override
  State<LiquidGlassBackground> createState() => _LiquidGlassBackgroundState();
}

class _LiquidGlassBackgroundState extends State<LiquidGlassBackground>
    with TickerProviderStateMixin {
  late AnimationController _orbController;
  late List<AnimationController> _orbControllers;

  @override
  void initState() {
    super.initState();

    _orbController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _orbControllers = List.generate(
      widget.orbCount,
      (index) => AnimationController(
        duration: Duration(seconds: 15 + index * 5),
        vsync: this,
      )..repeat(),
    );
  }

  @override
  void dispose() {
    _orbController.dispose();
    for (final controller in _orbControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.backgroundColors,
          stops: const [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Animated orbs
          ...List.generate(widget.orbCount, (index) {
            return AnimatedBuilder(
              animation: _orbControllers[index],
              builder: (context, child) {
                return _buildFloatingOrb(index);
              },
            );
          }),

          // Main content
          widget.child,
        ],
      ),
    );
  }

  Widget _buildFloatingOrb(int index) {
    final size = 80.0 + (index * 40);
    final animationValue = _orbControllers[index].value;

    // Calculate position using different patterns for each orb
    double left, top;

    switch (index % 3) {
      case 0:
        left = (math.sin(animationValue * 2 * math.pi) + 1) /
            2 *
            (MediaQuery.of(context).size.width - size);
        top = (math.cos(animationValue * 2 * math.pi) + 1) /
            2 *
            (MediaQuery.of(context).size.height - size);
      case 1:
        left = animationValue * (MediaQuery.of(context).size.width - size);
        top = (math.sin(animationValue * 4 * math.pi) + 1) /
            2 *
            (MediaQuery.of(context).size.height - size);
      default:
        left = (math.cos(animationValue * 3 * math.pi) + 1) /
            2 *
            (MediaQuery.of(context).size.width - size);
        top = animationValue * (MediaQuery.of(context).size.height - size);
    }

    return Positioned(
      left: left,
      top: top,
      child: LiquidOrb(
        size: size,
        color: widget.backgroundColors[index % widget.backgroundColors.length],
        animationValue: animationValue,
      ),
    );
  }
}

// Individual liquid orb
class LiquidOrb extends StatelessWidget {
  const LiquidOrb({
    required this.size,
    required this.color,
    required this.animationValue,
    super.key,
  });
  final double size;
  final Color color;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.4),
            color.withOpacity(0.2),
            color.withOpacity(0.1),
            Colors.transparent,
          ],
          stops: const [0.0, 0.4, 0.7, 1.0],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20 + (animationValue * 10),
          sigmaY: 20 + (animationValue * 10),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1 + (animationValue * 0.1)),
            ),
          ),
        ),
      ),
    );
  }
}
