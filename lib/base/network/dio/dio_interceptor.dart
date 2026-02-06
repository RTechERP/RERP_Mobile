import 'package:dio/dio.dart';

import '../../../features/auth/data/repository/auth_repository.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> header = {};

    // 🔑 LẤY TOKEN
    final token = await AuthRepository.getToken();
    if (token != null && token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }

    // 🌐 NGÔN NGỮ (nếu cần)
    header['lang'] = 'vi';

    options.headers.addAll(header);

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // ErrorHandling.withError(error: err);
    if (err.response?.data['message'] == '{{error.youLogedInAnotherDevice}}') {
      // LogoutHelper.logoutBecauseLoggedInAnotherDevice();
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
