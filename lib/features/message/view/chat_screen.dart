// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình nhắn tin trong một cuộc trò chuyện cá nhân hoặc nhóm
//
// Giao diện:
//   - AppBar: avatar + tên người/nhóm + trạng thái online/offline
//   - Danh sách tin nhắn: bubble đỏ (đã gửi) bên phải, bubble xám (đã nhận) bên trái
//   - Thanh nhập tin nhắn với icon gửi
//   - Dữ liệu hiện tại là mock tĩnh

import 'package:flutter/material.dart';

import '../../../../../common/app_theme/index.dart';

/// Màn hình nhắn tin - mở khi tap vào một cuộc trò chuyện trong [MessageScreen].
///
/// Hiển thị danh sách tin nhắn với 2 loại bubble: đã gửi (đỏ) và đã nhận (xám).
/// Input bar ở dưới cùng để nhập và gửi tin nhắn.
/// Dữ liệu là mock tĩnh.
class ChatScreen extends StatefulWidget {
  final String name;
  final String avatar;
  final Color avatarColor;
  final bool isGroup;
  final bool isOnline;

  const ChatScreen({
    super.key,
    required this.name,
    required this.avatar,
    required this.avatarColor,
    required this.isGroup,
    required this.isOnline,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Mock tin nhắn
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      content: 'Chào bạn, đã nhận được thông tin chưa?',
      isSent: false,
      time: '09:00',
      senderName: 'Nguyễn Văn An',
    ),
    _ChatMessage(
      content: 'Dạ đã nhận rồi ạ, em đang xử lý.',
      isSent: true,
      time: '09:15',
    ),
    _ChatMessage(
      content: 'File báo cáo đã được cập nhật, bạn xem lại giúp mình nhé.',
      isSent: false,
      time: '09:30',
      senderName: 'Nguyễn Văn An',
    ),
    _ChatMessage(
      content: 'Đã xem xong! Cảm ơn bạn nhiều.',
      isSent: true,
      time: '09:45',
    ),
    _ChatMessage(
      content: 'Mình cần bổ sung thêm phần KPI tuần sau.',
      isSent: true,
      time: '10:00',
    ),
    _ChatMessage(
      content: 'OK, mình sẽ cập nhật và gửi lại trước thứ 6.',
      isSent: false,
      time: '10:10',
      senderName: 'Nguyễn Văn An',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(
        content: text,
        isSent: true,
        time: 'Vừa xong',
      ));
    });

    _messageController.clear();
    // Scroll xuống cuối sau khi thêm tin nhắn
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        shadowColor: AppColors.borderColor,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.heading),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            // Avatar trong AppBar
            Stack(
              clipBehavior: Clip.none,
              children: [
                _ChatAvatarCircle(
                  text: widget.avatar,
                  color: widget.avatarColor,
                  size: 36,
                ),
                if (widget.isOnline && !widget.isGroup)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF41B339),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.white, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: AppColors.heading,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    widget.isOnline ? 'Đang hoạt động' : 'Offline',
                    style: TextStyle(
                      color: widget.isOnline
                          ? const Color(0xFF41B339)
                          : AppColors.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_outlined, color: AppColors.heading),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // Danh sách tin nhắn
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                // Hiển thị sender name cho nhóm khi người gửi khác liên tiếp
                final showSender = widget.isGroup &&
                    !msg.isSent &&
                    (index == 0 ||
                        _messages[index - 1].isSent ||
                        _messages[index - 1].senderName != msg.senderName);

                return _ChatBubble(
                  message: msg,
                  showSender: showSender,
                );
              },
            ),
          ),

          // Thanh nhập tin nhắn
          _ChatInputBar(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

/// Tin nhắn mock.
class _ChatMessage {
  final String content;
  final bool isSent; // true = đã gửi (bên phải), false = đã nhận (bên trái)
  final String time;
  final String? senderName; // chỉ dùng trong nhóm

  const _ChatMessage({
    required this.content,
    required this.isSent,
    required this.time,
    this.senderName,
  });
}

/// Bubble hiển thị một tin nhắn.
///
/// Đã gửi (isSent=true): nền đỏ cam, căn phải, bo tròn trái nhiều nhất.
/// Đã nhận (isSent=false): nền trắng, căn trái, bo tròn phải nhiều nhất.
class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;
  final bool showSender;

  const _ChatBubble({
    required this.message,
    this.showSender = false,
  });

  @override
  Widget build(BuildContext context) {
    if (message.isSent) {
      return _buildSentBubble();
    } else {
      return _buildReceivedBubble();
    }
  }

  Widget _buildSentBubble() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 56),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryERP,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message.time,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedBubble() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSender && message.senderName != null)
            Padding(
              padding: const EdgeInsets.only(left: 44, bottom: 3),
              child: Text(
                message.senderName!,
                style: const TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Avatar người gửi
              _ChatAvatarCircle(
                text: message.senderName != null
                    ? message.senderName!.split(' ').map((w) => w.isNotEmpty ? w[0] : '').take(2).join()
                    : '??',
                color: AppColors.secondaryERP,
                size: 32,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.content,
                        style: const TextStyle(
                          color: AppColors.heading,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        message.time,
                        style: const TextStyle(
                          color: AppColors.gray,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Thanh nhập tin nhắn ở dưới cùng.
class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _ChatInputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE8EAF0), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.gray,
              size: 28,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller,
                maxLines: 4,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
                decoration: const InputDecoration(
                  hintText: 'Nhập tin nhắn...',
                  hintStyle: TextStyle(
                    color: AppColors.hintText,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: AppColors.gradientERP,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryERP.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Avatar tròn trong màn chat.
class _ChatAvatarCircle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const _ChatAvatarCircle({
    required this.text,
    required this.color,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.32,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
