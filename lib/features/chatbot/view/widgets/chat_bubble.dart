import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/widgets/form/index.dart';
import '../../data/utils/chatbot_emotion.dart';
/// Widget hiển thị một tin nhắn trong chat.
///
/// - User bubble: container cam với viền phải, co theo nội dung (max 78% width).
/// - Bot bubble: container xanh với viền trái, có header (avatar + tên).
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.timestamp,
    this.emotion,
  });

  final String content;
  final bool isUser;
  final DateTime? timestamp;

  /// Cảm xúc của bot (chỉ dùng khi `isUser == false`).
  final ChatbotEmotion? emotion;

  @override
  Widget build(BuildContext context) {
    if (isUser) return _buildUserBubble(context);
    return _buildBotBubble(context);
  }

  // ---- User bubble ---------------------------------------------------------

  Widget _buildUserBubble(BuildContext context) {
    final maxW = MediaQuery.of(context).size.width * 0.78;

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(left: 48, bottom: 6),
        // IntrinsicWidth ép width của Container theo kích thước thật của text
        // (thay vì giãn hết maxWidth). ConstrainedBox phía ngoài giới hạn
        // max để text dài vẫn wrap xuống dòng thay vì tràn.
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxW),
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.orangeA500.withValues(alpha: 0.08),
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                border: Border(
                  right: BorderSide(
                    color: AppColors.orangeA500,
                    width: 3,
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
              child: _MessageBody(
                content: content,
                textColor: AppColors.enableText,
                timestamp: timestamp,
                timestampColor: AppColors.hintText,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---- Bot bubble ----------------------------------------------------------

  Widget _buildBotBubble(BuildContext context) {
    final activeEmotion = emotion ?? ChatbotEmotion.exciting;

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.82,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8),
          child: FormLeftBorderCard(
            // Viền trái + nền đồng bộ xanh để mọi bubble bot (kể cả lỗi)
            // đều có cùng tông — phân biệt với bubble user (cam).
            borderColor: AppColors.blueA500,
            backgroundColor: AppColors.blueA500.withValues(alpha: 0.08),
            borderWidth: 3,
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            crossAxisAlignment: CrossAxisAlignment.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header: avatar + tên + accent emoji.
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _BotAvatar(emotion: activeEmotion, accent: AppColors.blueA500),
                    const SizedBox(width: 8),
                    Text(
                      'Rio',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryERP,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                _MessageBody(
                  content: content,
                  textColor: AppColors.enableText,
                  timestamp: timestamp,
                  timestampColor: AppColors.hintText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Phần nội dung + timestamp dùng chung cho cả user / bot bubble.
class _MessageBody extends StatelessWidget {
  const _MessageBody({
    required this.content,
    required this.textColor,
    required this.timestamp,
    required this.timestampColor,
  });

  final String content;
  final Color textColor;
  final DateTime? timestamp;
  final Color timestampColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          textColor == AppColors.enableText
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
      children: [
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            height: 1.4,
          ),
        ),
        if (timestamp != null) ...[
          const SizedBox(height: 6),
          Text(
            DateFormat('HH:mm').format(timestamp!),
            style: TextStyle(fontSize: 10, color: timestampColor),
          ),
        ],
      ],
    );
  }
}

/// Avatar Rio nhỏ trong bubble.
class _BotAvatar extends StatelessWidget {
  const _BotAvatar({required this.emotion, required this.accent});

  final ChatbotEmotion emotion;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: ClipOval(
        child: Image.asset(
          emotion.imageAsset,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
