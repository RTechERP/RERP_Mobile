import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/rio_chat_model.dart';

abstract class RioChatRepo {
  /// Lấy lịch sử các session chat.
  Future<Either<BaseError, List<ChatHistorySession>>> getChatHistory();

  /// Lấy chi tiết một session chat (kèm messages).
  Future<Either<BaseError, ChatSessionDetail>> getChatHistoryDetail(
    int sessionId,
  );

  /// Gửi tin nhắn.
  Future<Either<BaseError, RioChatResponse>> sendMessage({
    required String message,
  });
}
