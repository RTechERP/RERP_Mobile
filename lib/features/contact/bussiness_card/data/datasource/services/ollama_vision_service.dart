import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

/// Response trả về từ Ollama sau khi parse JSON.
class OllamaBusinessCardResult {
  const OllamaBusinessCardResult({
    this.name,
    this.phone,
    this.email,
    this.company,
    this.address,
    this.position,
    this.website,
  });

  final String? name;
  final String? phone;
  final String? email;
  final String? company;
  final String? address;
  final String? position;
  final String? website;

  Map<String, String> toMap() {
    final map = <String, String>{};
    if (name != null && name!.isNotEmpty) map['NAME'] = name!;
    if (phone != null && phone!.isNotEmpty) map['PHONE'] = phone!;
    if (email != null && email!.isNotEmpty) map['EMAIL'] = email!;
    if (company != null && company!.isNotEmpty) map['COMPANY'] = company!;
    if (address != null && address!.isNotEmpty) map['ADDRESS'] = address!;
    if (position != null && position!.isNotEmpty) map['TITLE'] = position!;
    if (website != null && website!.isNotEmpty) map['WEBSITE'] = website!;
    return map;
  }
}

/// Service gọi Ollama local (Qwen2.5VL) để trích xuất thông tin danh thiếp.
class OllamaVisionService {
  OllamaVisionService({String? baseUrl})
    : _baseUrlOverride = baseUrl,
      _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(minutes: 5),
          sendTimeout: const Duration(minutes: 5),
        ),
      );

  final String? _baseUrlOverride;
  final Dio _dio;

  static const String envOverride = String.fromEnvironment('OLLAMA_HOST');

  /// IP LAN của Mac dev — fallback cho iPhone thật khi không có dart-define.
  static const String _devFallbackHost = 'http://192.168.0.46:11434';

  static List<String> _defaultCandidates() {
    final override = envOverride.isNotEmpty ? envOverride : null;
    if (override != null) return [override];
    return const [
      _devFallbackHost,
      'http://127.0.0.1:11434',
      'http://localhost:11434',
    ];
  }

  Future<String?> _resolveBaseUrl() async {
    final override = _baseUrlOverride;
    if (override != null && override.isNotEmpty) return override;
    final candidates = _defaultCandidates();
    for (final url in candidates) {
      try {
        final dio = Dio(
          BaseOptions(
            baseUrl: url,
            connectTimeout: const Duration(seconds: 3),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );
        final r = await dio.get('/api/tags');
        if (r.statusCode == 200) return url;
      } catch (_) {
        // try next
      }
    }
    return null;
  }

  /// Gọi Ollama API để nhận diện danh thiếp từ ảnh.
  /// Trả về [OllamaBusinessCardResult] hoặc ném exception.
  Future<OllamaBusinessCardResult> extractBusinessCard(
    String imagePath, {
    String model = 'qwen2.5vl:latest',
  }) async {
    developer.log(
      '[Ollama] extractBusinessCard path=$imagePath',
      name: 'OllamaVision',
    );
    // Resolve base URL trước (auto-detect nếu cần).
    final baseUrl = await _resolveBaseUrl();
    developer.log('[Ollama] resolved baseUrl=$baseUrl', name: 'OllamaVision');
    if (baseUrl == null) {
      throw const OllamaConnectionException(
        'Không tìm thấy Ollama đang chạy.\n'
        'Đảm bảo Ollama đã khởi động và listen trên 0.0.0.0:11434.\n'
        'Chạy: OLLAMA_HOST=0.0.0.0 ollama serve',
      );
    }
    _dio.options.baseUrl = baseUrl;

    // Ollama /api/generate endpoint với image base64.
    final base64Image = await _imageToBase64(imagePath);
    developer.log(
      '[Ollama] image base64 length=${base64Image.length}',
      name: 'OllamaVision',
    );

    // Prompt yêu cầu Ollama trả về JSON thuần túy.
    const prompt = '''
Bạn là một model trích xuất thông tin danh thiếp. Đọc ảnh danh thiếp và trả về JSON với các trường sau (chỉ JSON, không kèm markdown, không giải thích):
{
  "name": "Họ và tên",
  "phone": "Số điện thoại",
  "email": "Email",
  "company": "Tên công ty",
  "address": "Địa chỉ",
  "position": "Chức vụ",
  "website": "Website"
}
Nếu không tìm thấy trường nào thì để giá trị rỗng "". Trả về JSON thuần túy.
''';

    try {
      final response = await _dio.post(
        '/api/generate',
        data: {
          'model': model,
          'prompt': prompt,
          'images': [base64Image],
          'stream': false,
          'format': 'json',
        },
      );

      final data = response.data;
      String rawResponse;

      if (data is Map) {
        // Ollama trả JSON object với key 'response'.
        rawResponse = (data['response'] ?? '').toString();
      } else if (data is String) {
        rawResponse = data;
      } else {
        rawResponse = jsonEncode(data);
      }

      return _parseOllamaResponse(rawResponse);
    } on DioException catch (e, st) {
      final body = e.response?.data;
      developer.log(
        '[Ollama] DioException type=${e.type} '
        'code=${e.response?.statusCode} msg=${e.message} '
        'body=$body',
        name: 'OllamaVision',
        error: e,
        stackTrace: st,
      );
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw const OllamaConnectionException(
          'Kết nối Ollama bị từ chối. Có thể Ollama chỉ listen trên 127.0.0.1.\n'
          'Chạy: OLLAMA_HOST=0.0.0.0 ollama serve',
        );
      }
      final serverMsg = body is Map ? (body['error']?.toString()) : null;
      final detail = serverMsg ?? e.message ?? 'unknown';
      throw OllamaException(
        'Lỗi từ Ollama (${e.response?.statusCode}): $detail',
      );
    } catch (e, st) {
      developer.log(
        '[Ollama] Unexpected error: $e',
        name: 'OllamaVision',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  /// Check xem Ollama có đang online và model có sẵn không.
  Future<bool> isAvailable({String model = 'qwen2.5vl:latest'}) async {
    try {
      final baseUrl = await _resolveBaseUrl();
      if (baseUrl == null) return false;
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 5),
        ),
      );
      final response = await dio.get('/api/tags');
      if (response.statusCode == 200 && response.data is Map) {
        final models = response.data['models'] as List?;
        if (models == null) return false;
        return models.any(
          (m) => m is Map && (m['name'] ?? '').toString().startsWith(model),
        );
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Chuyển ảnh thành base64. Resize xuống max 1024px để tránh vượt context window.
  Future<String> _imageToBase64(String path) async {
    String cleanPath = path;
    if (cleanPath.startsWith('file://')) {
      cleanPath = Uri.parse(cleanPath).toFilePath();
    }
    final file = File(cleanPath);
    if (!await file.exists()) {
      throw OllamaException('File ảnh không tồn tại: $cleanPath');
    }
    final originalBytes = await file.readAsBytes();
    final decoded = img.decodeImage(originalBytes);
    if (decoded == null) {
      throw OllamaException('Không decode được ảnh: $cleanPath');
    }

    const maxDim = 1024;
    final shouldResize = decoded.width > maxDim || decoded.height > maxDim;
    final resized = shouldResize
        ? img.copyResize(
            decoded,
            width: decoded.width > decoded.height ? maxDim : null,
            height: decoded.height >= decoded.width ? maxDim : null,
            interpolation: img.Interpolation.linear,
          )
        : decoded;

    final jpegBytes = img.encodeJpg(resized, quality: 85);
    return base64Encode(jpegBytes);
  }

  /// Parse response từ Ollama thành [OllamaBusinessCardResult].
  OllamaBusinessCardResult _parseOllamaResponse(String raw) {
    // Ollama có thể trả kèm markdown code block, tách ra.
    var text = raw.trim();
    // Bỏ ```json ... ``` hoặc ``` ... ```
    final codeBlockMatch = RegExp(
      r'```(?:json)?\s*([\s\S]*?)```',
    ).firstMatch(text);
    if (codeBlockMatch != null) {
      text = codeBlockMatch.group(1)!.trim();
    }

    // Thử parse JSON trực tiếp.
    try {
      final map = jsonDecode(text) as Map<String, dynamic>;
      return OllamaBusinessCardResult(
        name: _stringOrNull(map['name']),
        phone: _normalizePhone(_stringOrNull(map['phone']) ?? ''),
        email: _stringOrNull(map['email']),
        company: _stringOrNull(map['company']),
        address: _stringOrNull(map['address']),
        position: _stringOrNull(map['position']),
        website: _stringOrNull(map['website']),
      );
    } catch (_) {
      // JSON parse fail → fallback.
      return const OllamaBusinessCardResult();
    }
  }

  String? _stringOrNull(dynamic value) {
    if (value == null) return null;
    final s = value.toString().trim();
    return s.isEmpty ? null : s;
  }

  /// Chuẩn hoá số điện thoại.
  String _normalizePhone(String raw) {
    if (raw.isEmpty) return raw;
    final hasPlus = raw.trim().startsWith('+');
    final digits = raw.replaceAll(RegExp(r'[^\d]'), '');
    if (hasPlus) return '+$digits';
    if (digits.startsWith('84') && digits.length >= 10) {
      return '0${digits.substring(2)}';
    }
    return digits;
  }

  void dispose() {
    _dio.close();
  }
}

/// Exception khi không kết nối được Ollama.
class OllamaConnectionException implements Exception {
  const OllamaConnectionException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Exception tổng quát khi gọi Ollama.
class OllamaException implements Exception {
  const OllamaException(this.message);
  final String message;
  @override
  String toString() => message;
}
