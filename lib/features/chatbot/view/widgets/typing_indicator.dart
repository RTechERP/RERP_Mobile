import 'package:flutter/material.dart';

import '../../data/utils/chatbot_emotion.dart';
import 'bot_emotion_theme.dart';

/// Widget hiển thị typing indicator khi bot đang trả lời.
///
/// Nhận [emotion] để giữ phong cách bubble nhất quán với emotion Rio sẽ dùng
/// sau khi trả lời xong (mặc định [ChatbotEmotion.questioning]).
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({
    super.key,
    this.emotion = ChatbotEmotion.questioning,
  });

  final ChatbotEmotion emotion;

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = BotEmotionTheme.of(widget.emotion);

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 48, bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: theme.background,
            gradient: theme.gradient,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(theme.borderRadius),
              topRight: Radius.circular(theme.borderRadius),
              bottomLeft: const Radius.circular(4),
              bottomRight: Radius.circular(theme.borderRadius),
            ),
            border: Border.all(color: theme.border, width: 1),
            boxShadow: [
              BoxShadow(
                color: theme.accent.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar bot (đang suy nghĩ).
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: theme.accent.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.accent.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    widget.emotion.imageAsset,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 3 chấm nhảy với tông accent của emotion.
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    children: List.generate(3, (index) {
                      final delay = index * 0.2;
                      final value = (_controller.value - delay) % 1.0;
                      final opacity = (value < 0.5 ? value * 2 : (1 - value) * 2)
                          .clamp(0.3, 1.0);
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: theme.accent.withValues(alpha: opacity),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
