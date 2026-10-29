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

  /// Có bao gồm lead đang mở hay không.
  final bool includeOpen;

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
    this.includeOpen = true,
    this.detail,
    this.detailStatus = BaseStateStatus.init,
    this.detailMessage,
    this.files = const [],
    this.filesStatus = BaseStateStatus.init,
    this.filesMessage,
    this.filesLeadId,
  });

  factory LeadMarketingState.init() => const LeadMarketingState(
        status: BaseStateStatus.init,
      );

  /// Danh sách phiếu lead sau khi áp dụng từ khoá tìm kiếm.
  ///
  /// Tìm theo mã lead, tên công ty, nguồn lead, nhân viên marketing/sale
  /// và thông tin liên hệ.
  List<LeadMarketingItem> get displayLeads {
    if (keyword.isEmpty) return leads;

    final kw = keyword.toLowerCase();
    return leads.where((item) {
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
    }).toList();
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
        includeOpen,
        detail,
        detailStatus,
        detailMessage,
        files,
        filesStatus,
        filesMessage,
        filesLeadId,
      ];
}
