import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/lead_sale_model.dart';

/// Repository trừu tượng cho màn Lead Marketing của CRM.
abstract class LeadSaleRepo {
  /// Lấy danh sách nhân viên sale.
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleEmployees();

  /// Lấy danh sách nhân viên marketing.
  Future<Either<BaseError, List<LeadSaleEmployee>>> getMarketingEmployees();

  /// Lấy danh sách nguồn lead.
  Future<Either<BaseError, List<LeadSaleSource>>> getLeadSources();

  /// Lấy quyền của người dùng hiện tại trong module Lead.
  Future<Either<BaseError, LeadSaleRoleContext>> getRoleContext();

  /// Lấy danh sách phiếu lead theo khoảng thời gian và các bộ lọc.
  Future<Either<BaseError, List<LeadSaleItem>>> getLeadData({
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
  Future<Either<BaseError, LeadSaleDetail>> getLeadDetail({required int id});

  /// Lấy danh sách file đính kèm của phiếu lead.
  ///
  /// [customerContactId] là ID của phiếu lead.
  Future<Either<BaseError, List<LeadSaleFile>>> getLeadFiles({
    required int customerContactId,
    required int fileType,
  });

  /// Lưu file đính kèm của phiếu lead.
  ///
  /// [files] là danh sách file cần lưu; [fileType] là nhóm file (1 = file
  /// thường, 2 = file PO).
  Future<Either<BaseError, List<LeadSaleFile>>> saveLeadFiles({
    required int customerContactId,
    required int fileType,
    required List<PlatformFile> files,
    String note = '',
  });

  /// Xoá file đính kèm của phiếu lead.
  ///
  /// [customerContactFileId] là ID của file cần xoá.
  Future<Either<BaseError, void>> deleteLeadFile({
    required int customerContactFileId,
  });

  /// Lấy danh sách nhóm hàng (loại PO).
  Future<Either<BaseError, List<LeadSalePoType>>> getLeadPoTypes();

  /// Lấy danh sách lĩnh vực của khách hàng.
  Future<Either<BaseError, List<LeadSaleCustomerIndustry>>>
  getCustomerIndustries();

  /// Lấy danh sách ngành nghề của khách hàng.
  Future<Either<BaseError, List<LeadSaleCustomerSpecialization>>>
  getCustomerSpecializations();

  /// Lấy danh sách lĩnh vực kinh doanh.
  Future<Either<BaseError, List<LeadSaleBusinessField>>> getBusinessFields();

  /// Lấy danh sách tỉnh/thành.
  Future<Either<BaseError, List<LeadSaleProvince>>> getCustomerProvinces();

  /// Lấy danh sách khách hàng.
  Future<Either<BaseError, List<LeadSaleCustomer>>> getCustomers();

  /// Lấy chi tiết khách hàng.
  Future<Either<BaseError, LeadSaleCustomer>> getCustomerDetail({
    required int id,
  });

  /// Kiểm tra trùng lặp phiếu lead trước khi lưu.
  ///
  /// [excludeLeadId] là ID phiếu đang sửa (0 khi tạo mới) để không tự
  /// trùng với chính nó.
  Future<Either<BaseError, LeadSaleDuplicateCheckResult>> checkDuplicate({
    required String phone,
    String? email,
    String? taxCode,
    String? companyName,
    int excludeLeadId = 0,
  });

  /// Lưu phiếu lead (thêm mới hoặc cập nhật).
  Future<Either<BaseError, LeadSaleSaveResult>> saveData({
    required Map<String, dynamic> payload,
  });

  /// Xoá phiếu lead.
  ///
  /// [ids] là danh sách ID phiếu cần xoá. Trả về danh sách ID đã xoá
  /// thành công.
  Future<Either<BaseError, List<int>>> deleteLeads({required List<int> ids});

  /// Ghi hoạt động lên phiếu lead.
  Future<Either<BaseError, LeadSaleActivitySaveResult>> saveActivity({
    required Map<String, dynamic> payload,
  });

  /// Mở lại lead đã không thành công.
  Future<Either<BaseError, List<int>>> reopenLeads({
    required List<int> ids,
    required String note,
  });

  /// Hoàn trả lead về cho Marketing.
  ///
  /// [leadId] là ID phiếu cần hoàn trả, [reason] là lý do người dùng nhập.
  /// Trả về thông báo từ API.
  Future<Either<BaseError, String?>> returnLead({
    required int leadId,
    required String reason,
  });

  /// Xác nhận lead không thành công — chuyển lead sang Thất bại.
  ///
  /// [leadId] là ID phiếu, [lostReason] là lý do không thành công.
  /// Trả về thông báo từ API.
  Future<Either<BaseError, String?>> closeLead({
    required int leadId,
    required String lostReason,
  });

  /// Lấy danh sách loại nhóm dùng cho hoạt động của phiếu lead.
  Future<Either<BaseError, List<LeadSaleActivityType>>> getActivityTypes();

  /// Lấy danh sách Leader Sale nhận bàn giao.
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleLeaders();

  /// Lấy danh sách Admin Sale.
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleAdmins();

  /// Lấy ID Admin Sale tương ứng với Leader Sale đã chọn.
  Future<Either<BaseError, int>> getAdminSaleId({required int leaderSaleId});

  /// Bàn giao lead cho Leader Sale.
  ///
  /// [ids] là danh sách ID phiếu cần bàn giao. Trả về kết quả gồm thông báo
  /// từ API và danh sách ID đã bàn giao thành công.
  Future<Either<BaseError, LeadSaleHandoverResult>> handoverLeads({
    required List<int> ids,
    required int leaderEmployeeId,
    required int adminSaleId,
    required String note,
  });
}
