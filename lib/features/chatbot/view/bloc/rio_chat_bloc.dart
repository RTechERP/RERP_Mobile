// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/bloc/index.dart';
import '../../../../base/network/errors/extension.dart';
import '../../../../common/local_data/shared_pref.dart';
import '../../../../common/logger/index.dart';
import '../../data/repository/rio_chat_repo.dart';

part 'rio_chat_bloc_event.dart';
part 'rio_chat_bloc_state.dart';

part 'rio_chat_bloc.freezed.dart';
part 'rio_chat_bloc.g.dart';

/// Key lưu messages vào SharedPreferences theo session.
String _rioChatMessagesKey(int sessionId) => 'rio_chat_messages_$sessionId';

/// Bloc quản lý trạng thái Rio Chat.
@injectable
class RioChatBloc extends BaseBloc<RioChatEvent, RioChatState> {
  final RioChatRepo _repo;
  final LogUtils _log;
  final LocalStorage _localStorage;

  int _currentSessionId = 0;

  RioChatBloc(this._repo, this._log, this._localStorage)
    : super(RioChatState.initial()) {
    on<RioChatEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        loadHistory: () => _onLoadHistory(emit),
        selectSession: (sessionId) => _onSelectSession(emit, sessionId),
        sendMessage: (message) => _onSendMessage(emit, message),
        clear: () => _onClear(emit),
        startNew: () => _onStartNew(emit),
      );
    });
  }

  /// Khởi tạo: load messages đã cache trong storage (nếu có).
  Future<void> _onInit(Emitter<RioChatState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    try {
      final cached = await _loadCachedMessages(_currentSessionId);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          messages: cached ?? const [],
        ),
      );
    } catch (e, st) {
      _log.logE('RioChat: Init failed: $e\n$st');
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          message: 'Không thể tải lịch sử chat',
        ),
      );
    }
  }

  /// Load danh sách session lịch sử chat từ API.
  Future<void> _onLoadHistory(Emitter<RioChatState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _repo.getChatHistory();

    res.fold(
      (err) {
        _log.logE('RioChat: Load history failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (sessions) {
        final history = sessions
            .map(
              (s) => ChatHistorySessionModel(
                sessionId: s.sessionId,
                createdDate: s.createdDate,
                updatedDate: s.updatedDate,
              ),
            )
            .toList();

        emit(
          state.copyWith(status: BaseStateStatus.success, chatHistory: history),
        );
      },
    );
  }

  /// Chọn một session: gọi API detail, fill messages ra màn chính, cache local.
  Future<void> _onSelectSession(
    Emitter<RioChatState> emit,
    int sessionId,
  ) async {
    _currentSessionId = sessionId;
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        pendingMessage: null,
      ),
    );

    final res = await _repo.getChatHistoryDetail(sessionId);

    res.fold(
      (err) {
        _log.logE('RioChat: Select session failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (detail) {
        final list = detail.messages
            .map((m) => ChatMessage(question: m.question, answer: m.answer))
            .toList();
        _saveMessagesForSession(sessionId, list);
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            messages: list,
            // Reset message để tránh toast lỗi cũ hiện lại
            message: null,
          ),
        );
      },
    );
  }

  /// Gửi tin nhắn: tạo pending, gọi API, cập nhật answer.
  Future<void> _onSendMessage(
    Emitter<RioChatState> emit,
    String message,
  ) async {
    final question = message.trim();
    if (question.isEmpty) return;

    emit(state.copyWith(pendingMessage: ChatMessage(question: question)));

    final res = await _repo.sendMessage(message: question);

    await res.fold(
      (err) async {
        _log.logE('RioChat: Send failed: $err');
        // Giữ pendingMessage để user thấy câu mình đã gửi, phát lỗi qua UI.
        emit(state.copyWith(message: err.getErrorMessage));
      },
      (response) async {
        final completed = ChatMessage(
          question: question,
          answer: response.answer ?? 'Tôi không có câu trả lời.',
        );
        final newMessages = [...state.messages, completed];
        emit(state.copyWith(messages: newMessages, pendingMessage: null));
        await _saveMessagesForSession(_currentSessionId, newMessages);
      },
    );
  }

  /// Xóa toàn bộ messages hiện tại + cache local.
  Future<void> _onClear(Emitter<RioChatState> emit) async {
    emit(state.copyWith(messages: const []));
    await _localStorage.remove(_rioChatMessagesKey(_currentSessionId));
  }

  /// Bắt đầu cuộc hội thoại mới: reset session về 0, clear messages.
  Future<void> _onStartNew(Emitter<RioChatState> emit) async {
    _currentSessionId = 0;
    emit(state.copyWith(messages: const [], pendingMessage: null));
  }

  /// Đọc cache messages từ storage.
  Future<List<ChatMessage>?> _loadCachedMessages(int sessionId) async {
    final data = await _localStorage.get<dynamic>(
      _rioChatMessagesKey(sessionId),
    );
    if (data == null) return null;
    final raw = data is String ? jsonDecode(data) : data;
    return (raw as List)
        .map(
          (e) => ChatMessage(
            question: e['question'] as String,
            answer: e['answer'] as String?,
          ),
        )
        .toList();
  }

  /// Ghi cache messages cho 1 session cụ thể.
  Future<void> _saveMessagesForSession(
    int sessionId,
    List<ChatMessage> messages,
  ) async {
    try {
      final data = messages
          .map((e) => {'question': e.question, 'answer': e.answer})
          .toList();
      await _localStorage.save(
        _rioChatMessagesKey(sessionId),
        jsonEncode(data),
      );
    } catch (e) {
      _log.logW('RioChat: Save failed: $e');
    }
  }
}
