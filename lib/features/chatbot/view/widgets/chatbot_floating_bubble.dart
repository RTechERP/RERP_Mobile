import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/constants/app_image.dart';
import '../../../../routes/route_names.dart';

/// Widget hiển thị bong bóng chatbot nổi trên các màn hình.
///
/// Bấm vào bong bóng sẽ navigate sang màn hình Chatbot.
/// Có thể kéo thả để di chuyển vị trí.
class ChatbotFloatingBubble extends StatefulWidget {
  const ChatbotFloatingBubble({super.key});

  @override
  State<ChatbotFloatingBubble> createState() => _ChatbotFloatingBubbleState();
}

class _ChatbotFloatingBubbleState extends State<ChatbotFloatingBubble> {
  /// _position.dx = khoảng cách từ cạnh phải màn hình.
  /// _position.dy = khoảng cách từ đáy màn hình (trừ bottom nav bar).
  Offset _position = const Offset(16, 100);
  bool _isDragging = false;

  static const double _bubbleSize = 64;
  static const double _bubbleSizeDragging = 72;
  static const double _edgeMargin = 16;
  // Độ cao bottom nav bar + safe area — bubble neo phía trên nav bar.
  static const double _bottomSafeOffset = 100;

  void _onTap() {
    context.push(RouteNames.chatbot);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final size = MediaQuery.of(context).size;
    final bubbleSize = _isDragging ? _bubbleSizeDragging : _bubbleSize;
    setState(() {
      // Kéo phải → dx tăng (khoảng cách từ right tăng) → bubble dịch trái.
      _position = Offset(
        (_position.dx - details.delta.dx)
            .clamp(0.0, size.width - bubbleSize),
        (_position.dy - details.delta.dy)
            .clamp(0.0, size.height - bubbleSize - _bottomSafeOffset),
      );
    });
  }

  void _onPanStart(DragStartDetails details) {
    setState(() => _isDragging = true);
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() => _isDragging = false);
    // Snap về mép trái hoặc phải.
    final screenWidth = MediaQuery.of(context).size.width;
    final bubbleSize = _bubbleSize;
    // Nếu khoảng cách bubble-to-right (dx) < nửa màn hình → bubble đang ở
    // nửa phải → snap sát phải (dx = edgeMargin).
    if (_position.dx < screenWidth / 2) {
      _position = Offset(_edgeMargin, _position.dy);
    } else {
      // Ngược lại → snap sát trái (dx = screenWidth - bubble - margin).
      _position = Offset(
        screenWidth - bubbleSize - _edgeMargin,
        _position.dy,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: _position.dx,
            bottom: _position.dy,
            child: GestureDetector(
              onTap: _onTap,
              onPanUpdate: _onPanUpdate,
              onPanStart: _onPanStart,
              onPanEnd: _onPanEnd,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: _isDragging ? _bubbleSizeDragging : _bubbleSize,
                height: _isDragging ? _bubbleSizeDragging : _bubbleSize,
                decoration: BoxDecoration(
                  color: AppColors.blueA500.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: ClipOval(
                    child: Image.asset(
                      AppImages.chatbot_exciting,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
