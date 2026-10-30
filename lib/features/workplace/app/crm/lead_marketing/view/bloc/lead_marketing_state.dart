part of 'lead_marketing_bloc.dart';

/// State cho màn Lead Marketing của CRM.
@CopyWith()
class LeadMarketingState extends BaseBlocState {
  /// Danh sách phiếu lead gốc từ API.
  final List<LeadMarketingItem> leads;

  /// Quyền của người dùng hiện tại trong module Lead.
  final LeadRoleContext? roleContext;

  /// Ngày bắt đầu đang lọc.
  final DateTime? dateStart;

  /// Ngày kết thúc đang lọc.
  final DateTime? dateEnd;

  /// Từ khoá tìm kiếm hiện tại.
  final String keyword;

  /// Chế độ xem gửi lên API (`1` = danh sách chi tiết).
  final int viewMode;

  /// Loại lead đang lọc (`0` = tất cả).
  final int leadType;

  /// ID nguồn lead đang lọc (`0` = tất cả).
  final int leadSourceId;

  /// ID nhân viên marketing đang lọc (`0` = tất cả).
  final int marketingEmployeeId;

  /// ID nhân viên sale đang lọc (`0` = tất cả).
  final int saleEmployeeId;

  /// Có bao gồm lead đang mở hay không.
  final bool includeOpen;

  /// Giai đoạn đang lọc (null = tất cả).
  final LeadStage? stageFilter;

  /// Danh sách nguồn lead dùng cho bộ lọc.
  final List<LeadSource> sources;

  /// Danh sách nhân viên marketing dùng cho bộ lọc.
  final List<LeadEmployee> marketingEmployees;

  /// Danh sách nhân viên sale dùng cho bộ lọc.
  final List<LeadEmployee> saleEmployees;

  /// Chi tiết phiếu lead đang xem (null khi chưa tải hoặc tải lỗi).
  final LeadDetail? detail;

  /// Trạng thái tải chi tiết phiếu lead.
  final BaseStateStatus detailStatus;

  /// Thông báo lỗi khi tải chi tiết phiếu lead thất bại.
  final String? detailMessage;

  /// Danh sách file đính kèm của phiếu lead đang xem.
  final List<LeadFile> files;

  /// Trạng thái tải danh sách file đính kèm.
  final BaseStateStatus filesStatus;

  /// Thông báo lỗi khi tải danh sách file đính kèm thất bại.
  final String? filesMessage;

  /// ID của phiếu lead mà [files] đang thuộc về.
  final int? filesLeadId;

  /// Danh sách file PO đính kèm của phiếu lead đang xem.
  final List<LeadFile> filesPo;

  /// Trạng thái tải danh sách file PO.
  final BaseStateStatus filesPoStatus;

  /// Thông báo lỗi khi tải danh sách file PO thất bại.
  final String? filesPoMessage;

  /// ID của phiếu lead mà [filesPo] đang thuộc về.
  final int? filesPoLeadId;

  /// Danh sách nhóm hàng (loại PO) dùng khi tạo phiếu lead.
  final List<LeadPoType> poTypes;

  /// Danh sách lĩnh vực của khách hàng.
  final List<LeadCustomerIndustry> customerIndustries;

  /// Danh sách ngành nghề của khách hàng.
  final List<LeadCustomerSpecialization> customerSpecializations;

  /// Danh sách lĩnh vực kinh doanh.
  final List<LeadBusinessField> businessFields;

  /// Danh sách tỉnh/thành.
  final List<LeadProvince> provinces;

  /// Danh sách khách hàng.
  final List<LeadCustomer> customers;

  /// Chi tiết khách hàng đang chọn trong form tạo phiếu lead.
  final LeadCustomer? customerDetail;

  /// Trạng thái tải chi tiết khách hàng.
  final BaseStateStatus customerDetailStatus;

  /// Thông báo lỗi khi tải chi tiết khách hàng thất bại.
  final String? customerDetailMessage;

  /// Trạng thái đang kiểm tra trùng lặp + lưu phiếu lead.
  final BaseStateStatus submitStatus;

  /// Thông báo kết quả lưu phiếu lead (thành công / thất bại).
  final String? submitMessage;

  /// Kết quả lưu phiếu lead sau khi thành công (null nếu chưa lưu).
  final LeadSaveResult? saveResult;

  /// Danh sách bản ghi lead bị trùng phát hiện bởi API check-duplicate.
  ///
  /// Không rỗng → UI hiện dialog xác nhận có lưu trùng hay không.
  final List<LeadDuplicateInfo> duplicates;

  /// Thông tin người dùng hiện tại — dùng để mặc định NV marketing phụ trách.
  final User? currentUser;

  const LeadMarketingState({
    required super.status,
    super.message,
    this.leads = const [],
    this.roleContext,
    this.dateStart,
    this.dateEnd,
    this.keyword = '',
    this.viewMode = 1,
    this.leadType = 0,
    this.leadSourceId = 0,
    this.marketingEmployeeId = 0,
    this.saleEmployeeId = 0,
    this.includeOpen = true,
    this.stageFilter,
    this.sources = const [],
    this.marketingEmployees = const [],
    this.saleEmployees = const [],
    this.detail,
    this.detailStatus = BaseStateStatus.init,
    this.detailMessage,
    this.files = const [],
    this.filesStatus = BaseStateStatus.init,
    this.filesMessage,
    this.filesLeadId,
    this.filesPo = const [],
    this.filesPoStatus = BaseStateStatus.init,
    this.filesPoMessage,
    this.filesPoLeadId,
    this.poTypes = const [],
    this.customerIndustries = const [],
    this.customerSpecializations = const [],
    this.businessFields = const [],
    this.provinces = const [],
    this.customers = const [],
    this.customerDetail,
    this.customerDetailStatus = BaseStateStatus.init,
    this.customerDetailMessage,
    this.submitStatus = BaseStateStatus.init,
    this.submitMessage,
    this.saveResult,
    this.duplicates = const [],
    this.currentUser,
  });

  factory LeadMarketingState.init() => const LeadMarketingState(
        status: BaseStateStatus.init,
      );

  /// Danh sách phiếu lead sau khi áp dụng từ khoá tìm kiếm và lọc giai đoạn.
  ///
  /// Tìm theo mã lead, tên công ty, nguồn lead, nhân viên marketing/sale
  /// và thông tin liên hệ.
  List<LeadMarketingItem> get displayLeads {
    var result = leads;

    // Lọc theo giai đoạn — null nghĩa là không lọc.
    if (stageFilter != null) {
      final stage = stageFilter!;
      result = result
          .where((item) => stage.matches(item.stageName))
          .toList();
    }

    if (keyword.isEmpty) return result;

    return result.where((item) => _matchesKeyword(item, keyword)).toList();
  }

  /// Số phiếu lead theo từng giai đoạn, dùng cho badge trong bộ lọc.
  ///
  /// Đếm trên tập đã lọc từ khoá (không lọc giai đoạn) để người dùng thấy
  /// được số lượng thực tế của từng giai đoạn.
  Map<LeadStage?, int> get stageCounts {
    final base = keyword.isEmpty
        ? leads
        : leads.where((item) => _matchesKeyword(item, keyword)).toList();

    final counts = <LeadStage?, int>{null: base.length};
    for (final stage in LeadStage.values) {
      counts[stage] = base.where((item) => stage.matches(item.stageName)).length;
    }
    return counts;
  }

  /// Kiểm tra một phiếu lead có khớp từ khoá tìm kiếm hay không.
  bool _matchesKeyword(LeadMarketingItem item, String keyword) {
    final kw = keyword.toLowerCase();
    final leadCode = (item.leadCode ?? '').toLowerCase();
    final companyName = (item.companyName ?? '').toLowerCase();
    final customerName = (item.customerName ?? '').toLowerCase();
    final sourceName = (item.leadSourceName ?? '').toLowerCase();
    final marketingName = (item.marketingEmployeeName ?? '').toLowerCase();
    final saleName = (item.saleEmployeeName ?? '').toLowerCase();
    final contactName = (item.contactName ?? '').toLowerCase();
    final contactPhone = (item.contactPhone ?? '').toLowerCase();

    return leadCode.contains(kw) ||
        companyName.contains(kw) ||
        customerName.contains(kw) ||
        sourceName.contains(kw) ||
        marketingName.contains(kw) ||
        saleName.contains(kw) ||
        contactName.contains(kw) ||
        contactPhone.contains(kw);
  }

  @override
  List get props => [
        status,
        message,
        leads,
        roleContext,
        dateStart,
        dateEnd,
        keyword,
        viewMode,
        leadType,
        leadSourceId,
        marketingEmployeeId,
        saleEmployeeId,
        includeOpen,
        stageFilter,
        sources,
        marketingEmployees,
        saleEmployees,
        detail,
        detailStatus,
        detailMessage,
        files,
        filesStatus,
        filesMessage,
        filesLeadId,
        filesPo,
        filesPoStatus,
        filesPoMessage,
        filesPoLeadId,
        poTypes,
        customerIndustries,
        customerSpecializations,
        businessFields,
        provinces,
        customers,
        customerDetail,
        customerDetailStatus,
        customerDetailMessage,
        submitStatus,
        submitMessage,
        saveResult,
        duplicates,
        currentUser,
      ];
}
