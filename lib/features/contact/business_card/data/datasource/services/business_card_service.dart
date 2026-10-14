import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';

import '../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../base/network/models/base_data.dart';
import '../../../../../../common/constants.dart';
import '../models/business_card_model.dart';

/// Service thống nhất cho danh thiếp.
///
/// Đóng gói 2 nhóm chức năng:
/// - CRUD: lấy danh sách, filter.
/// - Scan: gửi ảnh lên API /rio/scan-business-card để trích xuất thông tin.
@lazySingleton
class BusinessCardService extends DioBaseApiService {
  BusinessCardService(super.dio);

  /// Lấy danh sách danh thiếp, hỗ trợ filter theo từ khoá / yêu thích.
  ///
  /// Hiện tại trả về danh sách rỗng — chưa có API backend. Khi nào cần
  /// tính năng xem danh sách danh thiếp thì bổ sung lại.
  Future<List<BusinessCardModel>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    return const <BusinessCardModel>[];
  }

  /// Trích xuất thông tin danh thiếp từ ảnh qua API /rio/scan-business-card.
  ///
  /// [imagePath]: đường dẫn file ảnh (file:// hoặc path thuần).
  Future<BaseData<ScanBusinessCardResponse>> scanBusinessCardImage({
    required String imagePath,
  }) async {
    // Clean path if starts with file://
    String cleanPath = imagePath;
    if (cleanPath.startsWith('file://')) {
      cleanPath = Uri.parse(cleanPath).toFilePath();
    }

    // Read file bytes
    final file = File(cleanPath);
    if (!file.existsSync()) {
      throw Exception('File ảnh không tồn tại');
    }
    final originalBytes = await file.readAsBytes();

    // Resize ảnh trước khi upload — Qwen2.5-VL với n_ctx=4096 chỉ chứa
    // được ~650 image tokens (cạnh dài ~1024 px). Ảnh gốc từ camera
    // 4000×3000 px vượt context, gây lỗi "exceed_context_size_error".
    final resizedBytes = _resizeForAiOcr(originalBytes);

    // Create multipart file
    final fileName = cleanPath.split('/').last;
    final multipartFile = MultipartFile.fromBytes(
      resizedBytes,
      filename: fileName.isEmpty ? 'image.jpg' : fileName,
    );

    // Build form data
    final formData = FormData.fromMap({
      'image': multipartFile,
    });

    return post<BaseData<ScanBusinessCardResponse>>(
      ApiEndPoint.scanBusinessCard,
      body: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
      parser: (json) => BaseData<ScanBusinessCardResponse>.fromJson(
        json as Map<String, dynamic>,
        (data) => ScanBusinessCardResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Resize ảnh về cạnh dài tối đa [_maxEdgePx] để vừa context của Qwen2.5-VL.
  ///
  /// - Cạnh dài 1024 px → ~650 image tokens (cộng prompt ~3000 tokens = 3650,
  ///   nằm trong n_ctx=4096).
  /// - Giữ aspect ratio, encode JPEG quality 85 (giảm ~80% size, mắt thường
  ///   không phân biệt được).
  /// - Nếu ảnh đầu vào nhỏ hơn ngưỡng → trả về bytes gốc để tránh upscale
  ///   làm giảm chất lượng.
  static const int _maxEdgePx = 1024;
  static const int _jpegQuality = 85;

  Uint8List _resizeForAiOcr(Uint8List bytes) {
    try {
      final decoded = img.decodeImage(bytes);
      if (decoded == null) return bytes;

      final longestEdge =
          decoded.width > decoded.height ? decoded.width : decoded.height;
      if (longestEdge <= _maxEdgePx) return bytes;

      final resized = img.copyResize(
        decoded,
        width: decoded.width >= decoded.height ? _maxEdgePx : null,
        height: decoded.height > decoded.width ? _maxEdgePx : null,
        interpolation: img.Interpolation.cubic,
      );
      return Uint8List.fromList(img.encodeJpg(resized, quality: _jpegQuality));
    } catch (_) {
      // Decode/encode lỗi → fallback gửi ảnh gốc, để backend xử lý.
      return bytes;
    }
  }

}
