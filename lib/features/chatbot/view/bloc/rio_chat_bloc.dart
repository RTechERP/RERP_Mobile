import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/bloc/index.dart';
import '../../../../base/network/errors/extension.dart';
import '../../../../common/local_data/shared_pref.dart';
import '../../../../common/logger/index.dart';
import '../../data/repository/rio_chat_repo.dart';

part 'rio_chat_bloc_event.dart';
part 'rio_chat_bloc_state.dart';

/// Key lưu messages vào SharedPreferences.
const _rioChatMessagesKey = 'rio_chat_messages';

/// Bloc quản lý trạng thái Rio Chat.
@injectable
class RioChatBloc extends BaseBloc<RioChatEvent, RioChatState> {
  final RioChatRepo _repo;
  final LogUtils _log;
  final LocalStorage _localStorage;

  RioChatBloc(this._repo, this._log, this._localStorage)
      : super(RioChatState.initial()) {
    on<InitChat>(_onInitChat);
    on<SendMessage>(_onSendMessage);
    on<ClearChat>(_onClearChat);
  }

  /// Init: Load lịch sử từ storage.
  Future<void> _onInitChat(InitChat event, Emitter<RioChatState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    try {
      final data = await _localStorage.get<dynamic>(_rioChatMessagesKey);
      if (data != null) {
        final raw = data is String ? jsonDecode(data) : data;
        final list = (raw as List)
            .map((e) => ChatMessage(
                  question: e['question'] as String,
                  answer: e['answer'] as String?,
                ))
            .toList();
        emit(state.copyWith(
          status: BaseStateStatus.success,
          messages: list,
        ));
      } else {
        emit(state.copyWith(status: BaseStateStatus.success));
      }
    } catch (e, st) {
      _log.logE('RioChat: Init failed: $e\n$st');
      emit(state.copyWith(
        status: BaseStateStatus.success,
        message: 'Không thể tải lịch sử chat',
      ));
    }
  }

  /// Lưu messages vào storage.
  Future<void> _saveMessages(List<ChatMessage> messages) async {
    try {
      final data = messages
          .map((e) => {'question': e.question, 'answer': e.answer})
          .toList();
      await _localStorage.save(_rioChatMessagesKey, jsonEncode(data));
    } catch (e) {
      _log.logW('RioChat: Save failed: $e');
    }
  }

  /// Gửi tin nhắn: Tạo pending, gọi API, cập nhật answer.
  Future<void> _onSendMessage(SendMessage event, Emitter<RioChatState> emit) async {
    final question = event.message.trim();
    if (question.isEmpty) return;

    // Tạo pending message
    final pending = ChatMessage(question: question);
    emit(state.copyWith(pendingMessage: pending, error: null));

    // Gọi API
    final res = await _repo.sendMessage(message: question);

    await res.fold(
      (l) async {
        _log.logE('RioChat: Send failed: $l');
        emit(state.copyWith(
          clearPending: true,
          error: l.getErrorMessage,
        ));
      },
      (response) async {
        // Chuyển pending -> completed
        final completed = ChatMessage(
          question: question,
          answer: response.answer ?? 'Tôi không có câu trả lời.',
        );
        final newMessages = [...state.messages, completed];
        emit(state.copyWith(messages: newMessages, clearPending: true));
        await _saveMessages(newMessages);
      },
    );
  }

  /// Xóa lịch sử chat.
  Future<void> _onClearChat(ClearChat event, Emitter<RioChatState> emit) async {
    emit(state.copyWith(messages: const []));
    await _localStorage.remove(_rioChatMessagesKey);
  }
}
