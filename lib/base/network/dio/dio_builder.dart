import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import '../../../common/config/api_config.dart';

import '../../../common/logger/index.dart';
import 'dio_interceptor.dart';

class DioBuilder {
  Dio? dio;
  String initBaseUrl = 'https://interactive-book-api.tecinus.vn/';
  Dio getDio() {
    if (dio == null) {
      // bool canLog = false;
      bool canLog = dotenv.get('LOG_DIO', fallback: 'false') == 'true';
      final BaseOptions options = BaseOptions(
        baseUrl: getUrl(),
        receiveDataWhenStatusError: true,
        connectTimeout:
        const Duration(seconds: ApiConfig.connectTimeout * 1000),
        receiveTimeout:
        const Duration(seconds: ApiConfig.connectTimeout * 1000),
        headers: {"accept": "application/json"},
      );
      dio = Dio(options);
      dio?.options.headers['content-Type'] = 'Application/json';
      // dio?.interceptors.add(DioCacheInterceptor(options: optionsCache));
      dio?.interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: false,
            responseHeader: false,
            requestBody: false,
            responseBody: false,
            request: false,
            logPrint: canLog ? (msg) => printDebug(msg) : (msg) {},
          ),
          DioInterceptor()
        ],
      );
    }
    return dio!;
  }

  String getUrl() {
    String url = '';
    try {
      url = dotenv.get('BASE_URL');
    } catch (e) {
      url = initBaseUrl;
    }
    return url;
  }
}
