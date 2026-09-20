import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../../../../../common/config/api_config.dart';
import '../models/rio_chat_model.dart';

@lazySingleton
class RioChatService {
  late final Dio _dio;

  RioChatService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.20.28.241:5678', // Sẽ phải đổi lại sau
        connectTimeout: Duration(seconds: ApiConfig.connectTimeout),
        receiveTimeout: const Duration(seconds: 60), // Rio chat có thể chậm
        headers: const {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// Gửi tin nhắn đến Rio Chat và nhận phản hồi.
  Future<Either<BaseError, RioChatResponse>> sendMessage({
    required String message,
  }) async {
    try {
      final response = await _dio.post(
        '/webhook/rio-chat-v2',
        data: {'message': message},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = RioChatResponse.fromJson(response.data as Map<String, dynamic>);
        return right(data);
      }

      return left(BaseError.httpUnknownError('Phản hồi không hợp lệ'));
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError('Lỗi không xác định: $e'));
    }
  }
}
