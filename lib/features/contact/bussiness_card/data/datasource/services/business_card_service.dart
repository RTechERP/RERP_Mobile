import 'package:injectable/injectable.dart';

import '../models/business_card_model.dart';

@injectable
class BusinessCardService {
  BusinessCardService();

  Future<List<BusinessCardModel>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final fakeData = _generateFakeData();

    List<BusinessCardModel> filtered = fakeData;

    if (keyword != null && keyword.isNotEmpty) {
      final q = keyword.toLowerCase();
      filtered = filtered
          .where(
            (c) =>
                (c.fullName?.toLowerCase().contains(q) ?? false) ||
                (c.departmentName?.toLowerCase().contains(q) ?? false) ||
                (c.chucVu?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    }

    if (isFavorite == 1) {
      filtered = filtered.where((c) => c.isFavorite == true).toList();
    }

    return filtered;
  }

  List<BusinessCardModel> _generateFakeData() {
    return [
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
}
