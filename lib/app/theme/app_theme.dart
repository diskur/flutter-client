import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
    static ThemeData getTheme(bool isDark) {
      return ThemeData (
        hoverColor: isDark ? AppColors.primaryDark : AppColors.primaryLight,
        colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: isDark ? AppColors.primaryDark : AppColors.primaryLight,
          onPrimary: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
          secondary: isDark ? AppColors.secondaryDark : AppColors.secondaryLight,
          onSecondary: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          onSurface: isDark ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
        )
      );
    }
}