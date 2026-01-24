import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final Map<String, dynamic> header = {};
    // final prefs = await SharedPreferences.getInstance();
    //
    // String? token = await AuthRepository.getToken();
    // if (true == token?.isNotEmpty) {
    //   header['Authorization'] = "Bearer $token";
    // }
    // final locale = prefs.get("locale");
    // if (locale == "en_US") {
    //   header['lang'] = 'en';
    // } else {
    //   header['lang'] = 'vi';
    // }
    // options.headers.addAll(header);
    // super.onRequest(options, handler);
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
