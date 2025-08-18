import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App fonts configuration for better text rendering across platforms
/// Specially optimized for Vietnamese text and iOS compatibility
class AppFonts {
  // Primary font family - Inter supports Vietnamese characters well
  static String get primaryFont => GoogleFonts.inter().fontFamily!;

  // Secondary font for special cases
  static String get secondaryFont => GoogleFonts.nunito().fontFamily!;

  /// Get text theme with proper Vietnamese character support
  static TextTheme getTextTheme(BuildContext context) {
    return GoogleFonts.interTextTheme(
      Theme.of(context).textTheme,
    ).apply(
      bodyColor: const Color(0xFF1F2937),
      displayColor: const Color(0xFF1F2937),
    );
  }

  /// Heading styles with consistent font
  static TextStyle heading1({Color? color}) => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: color ?? const Color(0xFF1F2937),
        height: 1.3,
      );

  static TextStyle heading2({Color? color}) => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color ?? const Color(0xFF1F2937),
        height: 1.3,
      );

  static TextStyle heading3({Color? color}) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? const Color(0xFF1F2937),
        height: 1.3,
      );

  static TextStyle heading4({Color? color}) => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? const Color(0xFF1F2937),
        height: 1.3,
      );

  /// Body text styles
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? const Color(0xFF1F2937),
        height: 1.5,
      );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? const Color(0xFF1F2937),
        height: 1.5,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? const Color(0xFF6B7280),
        height: 1.5,
      );

  /// Button text style
  static TextStyle buttonText({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      );

  /// Caption style
  static TextStyle caption({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? const Color(0xFF6B7280),
      );

  /// Special style for Vietnamese text that needs better rendering
  static TextStyle vietnameseText({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? const Color(0xFF1F2937),
        height: height ?? 1.5,
        // Specific settings for Vietnamese characters
        letterSpacing: 0.1,
      );

  /// For toast messages and overlays
  static TextStyle toastText({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.white,
        height: 1.4,
      );
}
