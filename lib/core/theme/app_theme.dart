import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlue,
        primary: AppColors.primaryBlue,
        surface: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
    );
  }
}
