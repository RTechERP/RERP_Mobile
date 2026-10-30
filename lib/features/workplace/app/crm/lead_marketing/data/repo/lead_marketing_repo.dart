import 'package:dartz/dartz.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/lead_marketing_model.dart';

/// Repository trừu tượng cho màn Lead Marketing của CRM.
abstract class LeadMarketingRepo {
  /// Lấy danh sách nhân viên sale.
  Future<Either<BaseError, List<LeadEmployee>>> getSaleEmployees();

  /// Lấy danh sách nhân viên marketing.
  Future<Either<BaseError, List<LeadEmployee>>> getMarketingEmployees();

  /// Lấy danh sách nguồn lead.
  Future<Either<BaseError, List<LeadSource>>> getLeadSources();

  /// Lấy quyền của người dùng hiện tại trong module Lead.
  Future<Either<BaseError, LeadRoleContext>> getRoleContext();

  /// Lấy danh sách phiếu lead theo khoảng thời gian và các bộ lọc.
  Future<Either<BaseError, List<LeadMarketingItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int leadType,
    required int leadSourceId,
    required int marketingEmployeeId,
    required int saleEmployeeId,
    required bool includeOpen,
  });

  /// Lấy chi tiết phiếu lead kèm hoạt động, lịch sử và quyền thao tác.
  Future<Either<BaseError, LeadDetail>> getLeadDetail({
    required int id,
  });

  /// Lấy danh sách file đính kèm của phiếu lead.
  ///
  /// [customerContactId] là ID của phiếu lead.
  Future<Either<BaseError, List<LeadFile>>> getLeadFiles({
    required int customerContactId,
    required int fileType,
  });

  /// Lấy danh sách nhóm hàng (loại PO).
  Future<Either<BaseError, List<LeadPoType>>> getLeadPoTypes();

  /// Lấy danh sách lĩnh vực của khách hàng.
  Future<Either<BaseError, List<LeadCustomerIndustry>>> getCustomerIndustries();

  /// Lấy danh sách ngành nghề của khách hàng.
  Future<Either<BaseError, List<LeadCustomerSpecialization>>>
      getCustomerSpecializations();

  /// Lấy danh sách lĩnh vực kinh doanh.
  Future<Either<BaseError, List<LeadBusinessField>>> getBusinessFields();

  /// Lấy danh sách tỉnh/thành.
  Future<Either<BaseError, List<LeadProvince>>> getCustomerProvinces();

  /// Lấy danh sách khách hàng.
  Future<Either<BaseError, List<LeadCustomer>>> getCustomers();

  /// Lấy chi tiết khách hàng.
  Future<Either<BaseError, LeadCustomer>> getCustomerDetail({
    required int id,
  });

  /// Kiểm tra trùng lặp phiếu lead trước khi lưu.
  ///
  /// [excludeLeadId] là ID phiếu đang sửa (0 khi tạo mới) để không tự
  /// trùng với chính nó.
  Future<Either<BaseError, LeadDuplicateCheckResult>> checkDuplicate({
    required String phone,
    String? email,
    String? taxCode,
    String? companyName,
    int excludeLeadId = 0,
  });

  /// Lưu phiếu lead (thêm mới hoặc cập nhật).
  Future<Either<BaseError, LeadSaveResult>> saveData({
    required Map<String, dynamic> payload,
  });

  /// Xoá phiếu lead.
  ///
  /// [ids] là danh sách ID phiếu cần xoá. Trả về danh sách ID đã xoá
  /// thành công.
  Future<Either<BaseError, List<int>>> deleteLeads({
    required List<int> ids,
  });

  /// Ghi hoạt động lên phiếu lead.
  Future<Either<BaseError, LeadActivitySaveResult>> saveActivity({
    required Map<String, dynamic> payload,
  });

  /// Lấy danh sách loại nhóm dùng cho hoạt động của phiếu lead.
  Future<Either<BaseError, List<LeadActivityType>>> getActivityTypes();
}
