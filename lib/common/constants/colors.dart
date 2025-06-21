import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF7EBBFF);
  static const Color primaryDark = Color(0xFF5A9BF5);
  static const Color primaryLight = Color(0xFFDCECFF);

  // Accent colors
  static const Color accent = Color(0xFFFF85C9);
  static const Color accentLight = Color(0xFFFED6EF);
  static const Color accentDark = Color(0xFFE272B3);

  // Background colors
  static const Color background = Color(0xFFF5F9FF);
  static const Color cardBackground = Colors.white;
  static const Color secondaryBackground = Color(0xFFEEF6FF);

  // Text colors
  static const Color textPrimary = Color(0xFF3A4559);
  static const Color textSecondary = Color(0xFF6A7895);
  static const Color textLight = Color(0xFF9AABC8);

  // Status colors
  static const Color success = Color(0xFF8FE086);
  static const Color error = Color(0xFFFF8989);
  static const Color warning = Color(0xFFFFD071);
  static const Color info = Color(0xFF71B8FF);

  // Cute theme colors
  static const Color purple = Color(0xFFD49BFF);
  static const Color purpleLight = Color(0xFFF1E3FF);
  static const Color purpleDark = Color(0xFFB168EF);

  static const Color pink = Color(0xFFFF9BCD);
  static const Color pinkLight = Color(0xFFFFE6F2);
  static const Color pinkDark = Color(0xFFE974AE);

  static const Color yellow = Color(0xFFFFDD85);
  static const Color yellowLight = Color(0xFFFFF6E5);
  static const Color yellowDark = Color(0xFFFFC95C);

  static const Color green = Color(0xFF8FFFB9);
  static const Color greenLight = Color(0xFFE8FFF0);
  static const Color greenDark = Color(0xFF67E195);

  static const Color blue = Color(0xFF9BD8FF);
  static const Color blueLight = Color(0xFFE3F4FF);
  static const Color blueDark = Color(0xFF62B6F0);

  // Gradient pairs for attractive UI elements
  static const List<Color> primaryGradient = [primary, purple];
  static const List<Color> accentGradient = [accent, pink];
  static const List<Color> successGradient = [success, green];
  static const List<Color> blueGradient = [blue, primary];

  // Legacy brutalist colors - keeping for reference but will replace uses
  static const Color brutalistRed = Color(0xFFFF6B6B);
  static const Color brutalistBlue = Color(0xFF5D93E1);
  static const Color brutalistYellow = Color(0xFFFFD166);
}
