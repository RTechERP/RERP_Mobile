import 'package:flutter/material.dart';
import '../app_theme/app_colors.dart';
import 'app_config.dart';
import 'app_env.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor(),
      ),
      useMaterial3: true,
    );
  }

  static Color _primaryColor() {
    switch (AppConfig.env) {
      case AppEnv.production:
        return AppColors.primaryERP;
      case AppEnv.debug:
        return AppColors.secondaryERP;
    }
  }

}
