import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/app_theme/index.dart';

/// Widget hiển thị một tin nhắn trong chat.
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.timestamp,
  });

  final String content;
  final bool isUser;
  final DateTime? timestamp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: EdgeInsets.only(
          left: isUser ? 48 : 0,
          right: isUser ? 0 : 48,
          bottom: 8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primaryERP : AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
          border: isUser ? null : Border.all(color: AppColors.borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: (isUser ? AppColors.primaryERP : Colors.black)
                  .withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar và tên cho bot
            if (!isUser) ...[
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.smart_toy_outlined,
                      size: 16,
                      color: AppColors.primaryERP,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Rio',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
            // Nội dung tin nhắn
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: isUser ? Colors.white : AppColors.enableText,
                height: 1.4,
              ),
            ),
            // Thời gian
            if (timestamp != null) ...[
              const SizedBox(height: 6),
              Text(
                DateFormat('HH:mm').format(timestamp!),
                style: TextStyle(
                  fontSize: 10,
                  color: isUser
                      ? Colors.white.withValues(alpha: 0.7)
                      : AppColors.hintText,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
