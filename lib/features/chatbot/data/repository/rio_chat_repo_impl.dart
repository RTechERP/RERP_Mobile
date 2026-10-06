import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../../../../base/network/errors/extension.dart';
import '../datasource/models/rio_chat_model.dart';
import '../datasource/service/rio_chat_service.dart';
import 'rio_chat_repo.dart';

@LazySingleton(as: RioChatRepo)
class RioChatRepoImpl implements RioChatRepo {
  final RioChatService _service;

  RioChatRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ChatHistorySession>>> getChatHistory() async {
    try {
      final res = await _service.getChatHistory();
      return right(res.data ?? const []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, ChatSessionDetail>> getChatHistoryDetail(
    int sessionId,
  ) async {
    try {
      final res = await _service.getChatHistoryDetail(sessionId);
      if (res.data == null) {
        return left(
          BaseError.httpUnknownError('Không tải được cuộc hội thoại'),
        );
      }
      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, RioChatResponse>> sendMessage({
    required String message,
  }) async {
    try {
      final res = await _service.sendMessage(message: message);
      if (res.data == null) {
        return left(BaseError.httpUnknownError('Phản hồi không hợp lệ'));
      }
      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
