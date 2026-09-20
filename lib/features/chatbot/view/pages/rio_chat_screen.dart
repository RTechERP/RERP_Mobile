import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../base/bloc/index.dart';
import '../../../../base/widgets/base_scaffold.dart';
import '../../../../common/app_theme/index.dart';
import '../../../../common/utils/dialog/index.dart';
import '../../../../base/widgets/base_widget.dart';
import '../bloc/rio_chat_bloc.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/typing_indicator.dart';

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

    _messageController.clear();
    _focusNode.unfocus();
    bloc.add(SendMessage(message));
    _scrollToBottom(); // Scroll khi gửi message
  }

  @override
  void listener(BuildContext context, RioChatState state) {
    super.listener(context, state);

    // Chỉ scroll khi có answer mới (bot trả lời xong)
    if (state.messages.isNotEmpty) {
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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                color: AppColors.primaryERP,
                size: 20,
              ),
            ),
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
                blocBuilder((context, state) => Text(
                  state.isWaiting ? 'Đang trả lời...' : 'Trợ lý ảo',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.hintText,
                  ),
                )),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Tin nhắn hoàn chỉnh
          for (final msg in state.messages) ...[
            ChatBubble(content: msg.question, isUser: true),
            const SizedBox(height: 8),
            ChatBubble(content: msg.answer!, isUser: false),
            const SizedBox(height: 16),
          ],
          // Tin nhắn đang chờ
          if (state.pendingMessage != null) ...[
            ChatBubble(content: state.pendingMessage!.question, isUser: true),
            const SizedBox(height: 8),
            const TypingIndicator(),
            const SizedBox(height: 16),
          ],
        ],
      );
    });
  }

  Widget _buildWelcome() {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smart_toy_outlined,
              size: 64,
              color: AppColors.primaryERP,
            ),
          ),
          const SizedBox(height: 24),
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
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
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
                    hintText: isWaiting ? 'Đang chờ phản hồi...' : 'Nhập tin nhắn...',
                    hintStyle: TextStyle(color: AppColors.hintText, fontSize: 14),
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
