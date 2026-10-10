import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_theme/index.dart';
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
  Offset _position = const Offset(0, 100);
  bool _isDragging = false;

  static const double _bubbleSize = 56;
  static const double _bubbleSizeDragging = 64;
  static const double _edgeMargin = 16;

  void _onTap() {
    context.push(RouteNames.chatbot);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final size = MediaQuery.of(context).size;
    final bubbleSize = _isDragging ? _bubbleSizeDragging : _bubbleSize;
    setState(() {
      _position = Offset(
        (_position.dx + details.delta.dx)
            .clamp(0.0, size.width - bubbleSize),
        (_position.dy + details.delta.dy)
            .clamp(0.0, size.height - bubbleSize - 100),
      );
    });
  }

  void _onPanStart(DragStartDetails details) {
    setState(() => _isDragging = true);
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() => _isDragging = false);
    // Snap to edge
    final screenWidth = MediaQuery.of(context).size.width;
    final bubbleSize = _bubbleSize;
    if (_position.dx + bubbleSize / 2 < screenWidth / 2) {
      _position = Offset(_edgeMargin, _position.dy);
    } else {
      _position = Offset(screenWidth - bubbleSize - _edgeMargin, _position.dy);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: _position.dx,
            top: _position.dy,
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
                  color: AppColors.primaryERP,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryERP.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.smart_toy_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
