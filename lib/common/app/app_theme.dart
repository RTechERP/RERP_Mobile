import 'package:flutter/material.dart';
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
        return const Color(0xFF0057B8);
      case AppEnv.staging:
        return Colors.blue;
      case AppEnv.debug:
        return Colors.orange;
    }
  }

}
