import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/logger/index.dart';

/// Lỗi khi không resolve được Ollama host — UI sẽ hiển thị message hướng dẫn.
class OllamaHostException implements Exception {
  const OllamaHostException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Service phụ: dò host Ollama đang chạy trong mạng LAN / loopback.
///
/// Ollama chạy local trên Mac dev và listen trên 0.0.0.0:11434; iPhone thật
/// phải trỏ vào IP LAN. Service này thử tuần tự các candidate để tìm host
/// khả dụng, dùng `/api/tags` (GET) làm health check.
@lazySingleton
class OllamaHostResolver {
  OllamaHostResolver(this._log);

  final LogUtils _log;

  /// Cho phép override bằng `--dart-define=OLLAMA_HOST=...` lúc build.
  static const String envOverride = String.fromEnvironment('OLLAMA_HOST');

  /// IP fallback khi chạy trên thiết bị thật cùng LAN với máy dev.
  static const String devFallbackHost = 'http://10.20.28.241:11434';

  /// Trả về host đang hoạt động, hoặc null nếu không tìm thấy.
  ///
  /// Thử tuần tự: override > dev fallback > loopback.
  Future<String?> resolve({String? override}) async {
    final candidates = _candidates(override);
    for (final url in candidates) {
      if (await _ping(url)) {
        _log.logI('[Ollama] resolved host=$url');
        return url;
      }
      _log.logD('[Ollama] host unreachable: $url');
    }
    return null;
  }

  /// Thử connect tới [baseUrl]. Trả `true` nếu `/api/tags` trả 200.
  Future<bool> isAvailable(String baseUrl) async {
    return _ping(baseUrl);
  }

  List<String> _candidates(String? override) {
    if (override != null && override.isNotEmpty) return [override];
    if (envOverride.isNotEmpty) return [envOverride];
    return const [devFallbackHost, 'http://127.0.0.1:11434', 'http://localhost:11434'];
  }

  Future<bool> _ping(String url) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: url,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );
      final r = await dio.get<dynamic>('/api/tags');
      return r.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
