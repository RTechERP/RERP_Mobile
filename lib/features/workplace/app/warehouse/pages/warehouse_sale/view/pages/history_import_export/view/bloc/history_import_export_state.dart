part of 'history_import_export_bloc.dart';

/// Bộ lọc loại phiếu của lịch sử nhập/xuất, so khớp với `statusText` từ API
/// (vd. "Phiếu Nhập", "Phiếu Xuất").
enum HistoryTypeFilter {
  all('Tất cả', null),
  import('Phiếu nhập', 'nhập'),
  export('Phiếu xuất', 'xuất');

  const HistoryTypeFilter(this.label, this.keyword);

  /// Nhãn hiển thị trên menu lọc.
  final String label;

  /// Từ khoá cần có trong `statusText` (null = không lọc).
  final String? keyword;

  /// Trả về true nếu [item] thuộc loại phiếu đang chọn.
  bool matches(HistoryImportExportResponse item) {
    final key = keyword;
    if (key == null) return true;
    return (item.statusText ?? '').toLowerCase().contains(key);
  }
}

/// State của màn Lịch sử nhập/xuất kho.
@CopyWith()
class HistoryImportExportState extends BaseBlocState {
  /// Danh sách dòng lịch sử nhập/xuất từ API.
  final List<HistoryImportExportResponse> items;

  /// Từ khoá đang tìm kiếm (rỗng = không tìm).
  final String searchKeyword;

  /// Loại phiếu đang lọc (tất cả / nhập / xuất).
  final HistoryTypeFilter typeFilter;

  /// Khoảng ngày đang lọc.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Mã kho đang lọc (HN/HCM/BN).
  final String warehouseCode;

  const HistoryImportExportState({
    required super.status,
    super.message,
    this.items = const [],
    this.searchKeyword = '',
    this.typeFilter = HistoryTypeFilter.all,
    this.dateStart,
    this.dateEnd,
    this.warehouseCode = 'HN',
  });

  /// Mặc định: 1 tháng gần nhất tính đến hôm nay.
  factory HistoryImportExportState.init() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return HistoryImportExportState(
      status: BaseStateStatus.init,
      dateStart: DateTime(today.year, today.month - 1, today.day),
      dateEnd: today,
    );
  }

  /// Số dòng thuộc loại phiếu [filter] trong danh sách đã tải.
  int countOf(HistoryTypeFilter filter) => filter == HistoryTypeFilter.all
      ? items.length
      : items.where(filter.matches).length;

  /// Danh sách sau khi áp dụng bộ lọc loại phiếu.
  List<HistoryImportExportResponse> get visibleItems =>
      typeFilter == HistoryTypeFilter.all
      ? items
      : items.where(typeFilter.matches).toList();

  @override
  List get props => [
    status,
    message,
    items,
    searchKeyword,
    typeFilter,
    dateStart,
    dateEnd,
    warehouseCode,
  ];
}
