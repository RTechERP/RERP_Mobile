import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';

import '../../../../../../base/network/errors/error.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../../../../../common/config/index.dart';
import '../../../../../../common/logger/index.dart';
import '../models/business_card_model.dart';

/// Lỗi riêng của vision — truyền message thân thiện cho UI.
class BusinessCardVisionException implements Exception {
  const BusinessCardVisionException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Exception cho image encode.
class BusinessCardImageException implements Exception {
  const BusinessCardImageException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Service thống nhất cho danh thiếp.
///
/// Đóng gói 2 nhóm chức năng:
/// - CRUD: lấy danh sách, filter.
/// - Vision: encode ảnh + gọi Ollama trích xuất thông tin danh thiếp.
@lazySingleton
class BusinessCardService {
  BusinessCardService(this._dio, this._log);

  // ignore: unused_field — reserved cho HTTP call CRUD khi backend sẵn sàng.
  final Dio _dio;
  final LogUtils _log;

  // -------------------------------------------------------------------------
  // CRUD
  // -------------------------------------------------------------------------

  /// Lấy danh sách danh thiếp, hỗ trợ filter theo phòng ban / từ khoá /
  /// yêu thích.
  Future<Either<BaseError, List<BusinessCardModel>>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    try {
      // final response = await _dio.get<List<dynamic>>(
      //   ApiEndpoints.businessCards,
      //   queryParameters: {...},
      // );
      // final list = (response.data ?? [])
      //     .map((e) => BusinessCardModel.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // return right(list);

      final filtered =
          _filter(_fakeData, keyword: keyword, isFavorite: isFavorite);
      return right(filtered);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError('Lỗi không xác định: $e'));
    }
  }

  List<BusinessCardModel> _filter(
    List<BusinessCardModel> source, {
    String? keyword,
    int? isFavorite,
  }) {
    Iterable<BusinessCardModel> result = source;

    if (keyword != null && keyword.isNotEmpty) {
      final q = keyword.toLowerCase();
      result = result.where(
        (c) =>
            (c.fullName?.toLowerCase().contains(q) ?? false) ||
            (c.departmentName?.toLowerCase().contains(q) ?? false) ||
            (c.chucVu?.toLowerCase().contains(q) ?? false),
      );
    }

    if (isFavorite == 1) {
      result = result.where((c) => c.isFavorite ?? false);
    }

    return result.toList();
  }

  // -------------------------------------------------------------------------
  // Vision
  // -------------------------------------------------------------------------

  /// Trích xuất thông tin danh thiếp từ ảnh qua Ollama.
  ///
  /// [imagePath]: đường dẫn file ảnh (file:// hoặc path thuần).
  /// [ollamaUrl]: base URL của Ollama (đã resolve ở tầng repo/caller).
  Future<Either<BaseError, BusinessCardVisionResult>> scanBusinessCardImage({
    required String imagePath,
    required String ollamaUrl,
    String model = 'qwen2.5vl:latest',
  }) async {
    // 1. Encode + resize ảnh.
    String base64Image;
    try {
      base64Image = _encodeImage(imagePath);
    } catch (e) {
      return left(BaseError.httpUnknownError(
        e is BusinessCardImageException
            ? e.message
            : 'Lỗi đọc ảnh: $e',
      ));
    }

    // 2. Gọi Ollama vision API.
    final dio = Dio(BaseOptions(
      baseUrl: ollamaUrl,
      connectTimeout: const Duration(seconds: ApiConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: 90),
      sendTimeout: const Duration(seconds: 30),
      headers: const {'Content-Type': 'application/json'},
    ));

    try {
      final response = await dio.post<dynamic>(
        '/api/generate',
        data: {
          'model': model,
          'prompt': _visionPrompt,
          'images': [base64Image],
          'stream': false,
          'format': 'json',
          'options': {
            'num_predict': 400,
            'temperature': 0.1,
            'top_k': 20,
          },
          'keep_alive': '5m',
        },
      );

      _log.logD(
        '[Vision] status=${response.statusCode} '
        'ollamaUrl=$ollamaUrl model=$model',
      );

      if (response.statusCode != 200 || response.data == null) {
        return left(BaseError.httpUnknownError('Phản hồi không hợp lệ'));
      }

      return right(_parseResponse(response.data));
    } on DioException catch (e) {
      _log.logE('[Vision] DioException: ${e.type} | ${e.message}');
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return left(BaseError.httpUnknownError(
          'Lỗi kết nối server',
        ));
      }
      return left(e.baseError);
    } catch (e) {
      _log.logE('[Vision] Unexpected error: $e');
      return left(
          BaseError.httpInternalServerError('Lỗi không xác định: $e'));
    }
  }

  /// Encode ảnh thành base64 JPEG, resize tối đa 1024px.
  String _encodeImage(String filePath, {int maxDim = 1024}) {
    String cleanPath = filePath;
    if (cleanPath.startsWith('file://')) {
      cleanPath = Uri.parse(cleanPath).toFilePath();
    }
    final file = File(cleanPath);
    if (!file.existsSync()) {
      throw const BusinessCardImageException('File ảnh không tồn tại');
    }
    final bytes = file.readAsBytesSync();
    return _encodeImageBytes(bytes, maxDim: maxDim);
  }

  String _encodeImageBytes(Uint8List originalBytes, {int maxDim = 1024}) {
    final decoded = img.decodeImage(originalBytes);
    if (decoded == null) {
      throw const BusinessCardImageException('Không decode được ảnh');
    }
    final shouldResize =
        decoded.width > maxDim || decoded.height > maxDim;
    final resized = shouldResize
        ? img.copyResize(
            decoded,
            width: decoded.width > decoded.height ? maxDim : null,
            height: decoded.height >= decoded.width ? maxDim : null,
            interpolation: img.Interpolation.linear,
          )
        : decoded;
    return base64Encode(img.encodeJpg(resized, quality: 85));
  }

  /// Parse response từ Ollama thành [BusinessCardVisionResult].
  BusinessCardVisionResult _parseResponse(dynamic data) {
    String raw;
    if (data is Map) {
      raw = (data['response'] ?? '').toString();
      if (raw.isEmpty && data['thinking'] != null) {
        raw = data['thinking'].toString();
      }
    } else if (data is String) {
      raw = data;
    } else {
      raw = jsonEncode(data);
    }

    // Strip markdown code block nếu có.
    final match =
        RegExp(r'```(?:json)?\s*([\s\S]*?)```').firstMatch(raw.trim());
    final text = (match?.group(1) ?? raw).trim();

    try {
      final map = jsonDecode(text) as Map<String, dynamic>;
      return BusinessCardVisionResult(
        name: _stringOrNull(map['name']),
        phone: _normalizePhone(_stringOrNull(map['phone']) ?? ''),
        email: _stringOrNull(map['email']),
        company: _stringOrNull(map['company']),
        address: _stringOrNull(map['address']),
        position: _stringOrNull(map['position']),
        website: _stringOrNull(map['website']),
      );
    } catch (_) {
      return const BusinessCardVisionResult();
    }
  }

  String? _stringOrNull(dynamic value) {
    if (value == null) return null;
    final s = value.toString().trim();
    return s.isEmpty ? null : s;
  }

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

  /// Prompt ép Ollama trả JSON thuần.
  static const String _visionPrompt = '''
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

  // -------------------------------------------------------------------------
  // Fake data (dev)
  // -------------------------------------------------------------------------

  /// Dữ liệu mẫu — chỉ dùng cho dev. Sẽ được loại bỏ khi có API thật.
  static final List<BusinessCardModel> _fakeData = [
    const BusinessCardModel(
      stt: 1,
      fullName: 'Nguyễn Văn An',
      departmentName: 'Phòng Kỹ thuật',
      chucVu: 'Trưởng phòng',
      sdtCaNhan: '0901234567',
      emailCongTy: 'an.nv@company.com',
      emailCaNhan: 'an.nguyen@gmail.com',
      code: 'EMP001',
      address: '123 Nguyễn Trãi, Q.1, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: true,
    ),
    const BusinessCardModel(
      stt: 2,
      fullName: 'Trần Thị Bình',
      departmentName: 'Phòng Nhân sự',
      chucVu: 'Chuyên viên',
      sdtCaNhan: '0902345678',
      emailCongTy: 'binh.tt@company.com',
      code: 'EMP002',
      address: '789 Điện Biên Phủ, Q.Bình Thạnh, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
    const BusinessCardModel(
      stt: 3,
      fullName: 'Lê Minh Cường',
      departmentName: 'Phòng Kinh doanh',
      chucVu: 'Phó phòng',
      sdtCaNhan: '0903456789',
      emailCongTy: 'cuong.lm@company.com',
      emailCaNhan: 'cuong.le@yahoo.com',
      code: 'EMP003',
      address: '321 Trần Hưng Đạo, Q.5, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: true,
    ),
    const BusinessCardModel(
      stt: 4,
      fullName: 'Phạm Thị Dung',
      departmentName: 'Phòng Tài chính',
      chucVu: 'Kế toán trưởng',
      sdtCaNhan: '0904567890',
      emailCongTy: 'dung.pt@company.com',
      code: 'EMP004',
      address: '654 Võ Văn Tần, Q.3, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
    const BusinessCardModel(
      stt: 5,
      fullName: 'Hoàng Văn Em',
      departmentName: 'Phòng Kỹ thuật',
      chucVu: 'Kỹ sư',
      sdtCaNhan: '0905678901',
      emailCongTy: 'em.hv@company.com',
      code: 'EMP005',
      address: '987 Lý Thường Kiệt, Q.10, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
    const BusinessCardModel(
      stt: 6,
      fullName: 'Đặng Thị Phương',
      departmentName: 'Phòng Marketing',
      chucVu: 'Trưởng nhóm',
      sdtCaNhan: '0906789012',
      emailCongTy: 'phuong.dt@company.com',
      emailCaNhan: 'phuongdt@gmail.com',
      code: 'EMP006',
      address: '147 Nguyễn Oanh, Q.Gò Vấp, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: true,
    ),
    const BusinessCardModel(
      stt: 7,
      fullName: 'Vũ Minh Giang',
      departmentName: 'Phòng Kinh doanh',
      chucVu: 'Nhân viên',
      sdtCaNhan: '0907890123',
      emailCongTy: 'giang.vm@company.com',
      code: 'EMP007',
      address: '258 Phan Xích Long, Q.Phú Nhuận, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
    const BusinessCardModel(
      stt: 8,
      fullName: 'Bùi Thị Hà',
      departmentName: 'Phòng Nhân sự',
      chucVu: 'Quản lý',
      sdtCaNhan: '0908901234',
      emailCongTy: 'ha.bt@company.com',
      code: 'EMP008',
      address: '369 Trần Đại Nghĩa, Q.1, TP.HCM',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
    const BusinessCardModel(
      stt: 9,
      fullName: 'Đỗ Văn Hùng',
      departmentName: 'Phòng IT',
      chucVu: 'Team Lead',
      sdtCaNhan: '0909012345',
      emailCongTy: 'hung.dv@company.com',
      emailCaNhan: 'hungdo@gmail.com',
      code: 'EMP009',
      address: '741 Trần Cao Vân, Q.Thanh Khê, Đà Nẵng',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: true,
    ),
    const BusinessCardModel(
      stt: 10,
      fullName: 'Ngô Thị Mai',
      departmentName: 'Phòng Kế toán',
      chucVu: 'Kế toán',
      sdtCaNhan: '0910123456',
      emailCongTy: 'mai.nt@company.com',
      code: 'EMP010',
      address: '852 Cái Khế, Q.Ninh Kiều, Cần Thơ',
      companyName: 'Công ty TNHH RERP',
      companyAddress: '456 Lê Lợi, Q.3, TP.HCM',
      companyPhone: '02812345678',
      imagePath: '',
      isFavorite: false,
    ),
  ];
}
