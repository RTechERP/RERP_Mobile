import 'dart:io';

import 'package:dio/dio.dart';
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
  Future<List<BusinessCardModel>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    // TODO: Implement with real API when backend is ready
    // final response = await get<List<dynamic>>(
    //   ApiEndPoint.getBusinessCard,
    //   query: {...},
    // );
    // return (response ?? []).map((e) => BusinessCardModel.fromJson(e)).toList();

    final filtered = _filter(_fakeData, keyword: keyword, isFavorite: isFavorite);
    return filtered;
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
    final bytes = await file.readAsBytes();

    // Create multipart file
    final fileName = cleanPath.split('/').last;
    final multipartFile = MultipartFile.fromBytes(
      bytes,
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
