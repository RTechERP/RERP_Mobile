import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../base/bloc/index.dart';
import '../../../../base/widgets/base_scaffold.dart';
import '../../../../common/app_theme/index.dart';
import '../../../../common/constants/app_image.dart';
import '../../../../common/utils/dialog/index.dart';
import '../../../../base/widgets/base_widget.dart';
import '../bloc/rio_chat_bloc.dart';
import '../widgets/chat_bubble.dart';
import '../../data/utils/chatbot_emotion.dart';

/// Màn hình Rio Chat.
class RioChatScreen extends StatefulWidget {
  const RioChatScreen({super.key});

  @override
  State<RioChatScreen> createState() => _RioChatScreenState();
}

class _RioChatScreenState
    extends BaseState<RioChatScreen, RioChatEvent, RioChatState, RioChatBloc> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  /// Snapshot frame trước — dùng để phát hiện message/pending mới.
  /// Tránh scroll ép khi user đang đọc lại tin nhắn cũ.
  int _lastMessagesLength = 0;
  bool _lastHasPending = false;

  /// Cờ cục bộ chặn gửi lặp trong cùng frame (state chưa kịp cập nhật).
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const InitChat());
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    // Chặn gửi lặp trong cùng frame (bloc.state chưa được cập nhật khi user
    // nhấn Enter/button liên tục).
    if (_sending || bloc.state.isWaiting) return;

    _sending = true;
    _messageController.clear();
    _focusNode.unfocus();
    bloc.add(SendMessage(message));
  }

  @override
  void listener(BuildContext context, RioChatState state) {
    super.listener(context, state);

    // Reset cờ khi pending đã được xử lý xong.
    if (!state.isWaiting && _sending) {
      _sending = false;
    }

    final hasPending = state.pendingMessage != null;
    final messagesChanged = state.messages.length != _lastMessagesLength;
    final pendingChanged = hasPending != _lastHasPending;

    // Phát hiện clear chat (messages về 0) hoặc reload — reset snapshot.
    if (state.messages.isEmpty && _lastMessagesLength > 0) {
      _lastMessagesLength = 0;
      _lastHasPending = false;
      return;
    }

    // Lần đầu có dữ liệu (sau InitChat) — ép cuộn xuống đáy bất chấp
    // _followBottom. Hàm _scrollToBottom sẽ retry nếu ListView chưa sẵn sàng.
    final isFirstLoad = _lastMessagesLength == 0 && state.messages.isNotEmpty;

    if (messagesChanged || pendingChanged || isFirstLoad) {
      _lastMessagesLength = state.messages.length;
      _lastHasPending = hasPending;
      // Có tin mới (gửi hoặc nhận) → force scroll xuống đáy. User vừa tương
      // tác với chat → họ muốn xem câu trả lời mới nhất, không phải đọc lại
      // tin cũ. Skip check _followBottom cho case này.
      _scrollToBottom();
    }

    // Hiện lỗi
    if (state.error != null) {
      DialogService.showToastFailed(context: context, mess: state.error!);
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            const _AppBarAvatar(),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rio',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                ),
                blocBuilder(
                  (context, state) => Text(
                    state.isWaiting ? 'Đang trả lời...' : 'Trợ lý ảo',
                    style: TextStyle(fontSize: 12, color: AppColors.hintText),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          blocBuilder((context, state) {
            if (state.messages.isEmpty && state.pendingMessage == null) {
              return const SizedBox.shrink();
            }
            return IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmClearChat(context),
              tooltip: 'Xóa lịch sử chat',
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatContent()),
          _buildWaitingPreview(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatContent() {
    return blocBuilder((context, state) {
      // Loading lần đầu
      if (state.status == BaseStateStatus.loading && state.messages.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      // Không có gì
      if (!state.hasHistory && state.pendingMessage == null) {
        return _buildWelcome();
      }

      // Có nội dung
      return ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 12),
        children: [
          // Tin nhắn hoàn chỉnh
          for (final msg in state.messages) ...[
            ChatBubble(content: msg.question, isUser: true),
            const SizedBox(height: 8),
            ChatBubble(
              content: msg.answer!,
              isUser: false,
              emotion: detectEmotion(msg.answer!),
            ),
            const SizedBox(height: 16),
          ],
          // Tin nhắn đang chờ — câu hỏi của user vẫn hiện trong list,
          // phần trả lời được preview bằng card dưới ô nhập (kiểu Snapchat).
          if (state.pendingMessage != null) ...[
            ChatBubble(content: state.pendingMessage!.question, isUser: true),
            const SizedBox(height: 16),
          ],
        ],
      );
    });
  }

  Widget _buildWelcome() {
    // Không gắn controller — Welcome không cần scroll programmatic.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.blueA500.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AppImages.chatbot_exciting,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Xin chào, Tôi là Rio!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Hãy đặt câu hỏi để tôi giúp bạn nhé.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: AppColors.gray, height: 1.5),
          ),
        ],
      ),
    );
  }

  /// Preview emotion của Rio ngay trên ô nhập khi đang chờ trả lời.
  /// Snap-style: chỉ hiện khi `state.isWaiting`, animation fade + scale nhẹ.
  Widget _buildWaitingPreview() {
    return blocBuilder((context, state) {
      if (!state.isWaiting || state.pendingMessage == null) {
        return const SizedBox.shrink();
      }

      // Đoán sơ bộ emotion từ câu hỏi đang chờ để Rio "ngụ ý" phản ứng;
      // fallback questioning nếu không match keyword nào.
      final guess = detectEmotion(state.pendingMessage!.question);

      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: _TypingDots(emotion: guess),
        ),
      );
    });
  }

  Widget _buildMessageInput() {
    return blocBuilder((context, state) {
      final isWaiting = state.isWaiting;

      return Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).padding.bottom + 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: TextField(
                  controller: _messageController,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendMessage(),
                  enabled: !isWaiting,
                  maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: isWaiting
                        ? 'Đang chờ phản hồi...'
                        : 'Nhập tin nhắn...',
                    hintStyle: TextStyle(
                      color: AppColors.hintText,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: isWaiting ? AppColors.gray : AppColors.primaryERP,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  isWaiting ? Icons.hourglass_empty : Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: isWaiting ? null : _sendMessage,
                padding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _confirmClearChat(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa lịch sử chat'),
        content: const Text('Bạn có chắc muốn xóa toàn bộ lịch sử chat không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              bloc.add(const ClearChat());
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.redA500),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}

/// Bubble chờ AI trả lời: avatar emotion Rio + 3 chấm typing nhảy.
/// Đồng bộ tông xanh nhạt với bot bubble.
class _TypingDots extends StatefulWidget {
  const _TypingDots({required this.emotion});

  final ChatbotEmotion emotion;

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.blueA500.withValues(alpha: 0.08),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: Border(left: BorderSide(color: AppColors.blueA500, width: 3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar emotion Rio.
          ClipOval(
            child: Image.asset(
              widget.emotion.imageAsset,
              width: 28,
              height: 28,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              gaplessPlayback: true,
            ),
          ),
          const SizedBox(width: 10),
          // 3 chấm typing nhảy.
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  final delay = i * 0.2;
                  final v = (_controller.value - delay) % 1.0;
                  final opacity = (v < 0.5 ? v * 2 : (1 - v) * 2).clamp(
                    0.3,
                    1.0,
                  );
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: i == 1 ? 4 : 2),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.blueA500.withValues(alpha: opacity),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Avatar Rio trên AppBar — hiển thị emotion phù hợp với trạng thái.
class _AppBarAvatar extends StatelessWidget {
  const _AppBarAvatar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RioChatBloc, RioChatState>(
      builder: (context, state) {
        // Khi chờ trả lời: questioning.
        // Ngược lại: lấy emotion từ câu trả lời gần nhất; mặc định exciting.
        final emotion = state.isWaiting
            ? ChatbotEmotion.questioning
            : (state.messages.isNotEmpty && state.messages.last.answer != null
                  ? detectEmotion(state.messages.last.answer!)
                  : ChatbotEmotion.exciting);

        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.blueA500.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              emotion.imageAsset,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              gaplessPlayback: true,
            ),
          ),
        );
      },
    );
  }
}
