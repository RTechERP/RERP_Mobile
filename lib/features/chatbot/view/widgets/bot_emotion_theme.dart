import 'package:flutter/material.dart';

import '../../../../common/app_theme/index.dart';
import '../../data/utils/chatbot_emotion.dart';

/// "Theme" của bubble bot cho mỗi emotion: màu nền, màu accent, gradient, viền.
///
/// Giữ tất cả các quyết định thị giác cho bubble ở 1 chỗ để dễ tinh chỉnh mà
/// không phải động vào widget.
class BotEmotionTheme {
  final Color background;
  final Color border;
  final Color accent;
  final Gradient? gradient;
  final double borderRadius;
  final double elevation;

  const BotEmotionTheme({
    required this.background,
    required this.border,
    required this.accent,
    this.gradient,
    this.borderRadius = 18,
    this.elevation = 1,
  });

  /// Lấy theme theo emotion. Falling back `exciting` cho null.
  static BotEmotionTheme of(ChatbotEmotion? emotion) {
    switch (emotion ?? ChatbotEmotion.exciting) {
      case ChatbotEmotion.smile:
        // Trung tính, thân thiện — nền trắng xanh rất nhạt.
        return const BotEmotionTheme(
          background: Color(0xFFF1F6FB),
          border: Color(0xFFD9E4F0),
          accent: AppColors.primaryERP,
        );

      case ChatbotEmotion.happy:
        // Vui tươi — gradient vàng nhạt → cam nhạt.
        return const BotEmotionTheme(
          background: Color(0xFFFFF7E6),
          border: Color(0xFFFFE0A6),
          accent: Color(0xFFEF9A2A),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF7E6), Color(0xFFFFE9C4)],
          ),
        );

      case ChatbotEmotion.exciting:
        // Mặc định — gradient nhẹ từ xanh primary rất nhạt → trắng.
        return const BotEmotionTheme(
          background: Color(0xFFF4F8FE),
          border: Color(0xFFE0EAF8),
          accent: AppColors.primaryERP,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEEF4FE), Color(0xFFFFFFFF)],
          ),
        );

      case ChatbotEmotion.love:
        // Ấm áp — gradient hồng pastel.
        return const BotEmotionTheme(
          background: Color(0xFFFFF0F3),
          border: Color(0xFFFFD5DE),
          accent: Color(0xFFE8527A),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF0F3), Color(0xFFFFE0E8)],
          ),
        );

      case ChatbotEmotion.agree:
        // Đồng thuận — xanh mint nhạt.
        return const BotEmotionTheme(
          background: Color(0xFFE9F8EF),
          border: Color(0xFFB9E6C9),
          accent: Color(0xFF2EA867),
        );

      case ChatbotEmotion.questioning:
        // Tò mò — gradient xanh dương → tím nhạt, góc tròn hơn để "mềm".
        return const BotEmotionTheme(
          background: Color(0xFFEDF1FE),
          border: Color(0xFFC9D5F8),
          accent: Color(0xFF5B6FE0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEDF1FE), Color(0xFFE9E8FB)],
          ),
          borderRadius: 22,
        );

      case ChatbotEmotion.speechless:
        // Bất ngờ — xám nhạt, góc mềm vuốt tròn.
        return const BotEmotionTheme(
          background: Color(0xFFF4F5F7),
          border: Color(0xFFE2E5EB),
          accent: Color(0xFF7B8497),
          borderRadius: 22,
        );

      case ChatbotEmotion.angry:
        // Tiêu cực — đỏ nhạt, viền đậm hơn một chút.
        return const BotEmotionTheme(
          background: Color(0xFFFDEDED),
          border: Color(0xFFF6B8B8),
          accent: Color(0xFFD04040),
        );
    }
  }
}
