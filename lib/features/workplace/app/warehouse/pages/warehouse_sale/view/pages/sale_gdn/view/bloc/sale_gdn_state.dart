part of 'sale_gdn_bloc.dart';

@CopyWith()
class SaleGdnState extends BaseBlocState {
  /// Danh sách phiếu xuất kho từ API BillExport.
  final List<BillExporResponse> gdns;

  /// Từ khoá đang tìm kiếm (số phiếu / khách hàng /...).
  final String searchKeyword;

  /// Khoảng thời gian lọc hiện tại.
  final DateTime? dateStart;
  final DateTime? dateEnd;

  /// Mã kho đang lọc.
  final String warehouseCode;

  /// Trạng thái loading riêng cho tìm kiếm.
  final bool isSearching;

  /// Danh sách loại kho từ API.
  final List<TypeWarehouseResponse> warehouseTypes;

  /// Danh sách ID loại kho đang chọn (rỗng = chọn tất cả).
  final List<int> selectedWarehouseTypeIds;

  /// Trạng thái đang chọn (-1 = tất cả).
  final int selectedStatus;

  const SaleGdnState({
    required super.status,
    super.message,
    this.gdns = const [],
    this.searchKeyword = '',
    this.isSearching = false,
    this.dateStart,
    this.dateEnd,
    this.warehouseCode = 'HN',
    this.warehouseTypes = const [],
    this.selectedWarehouseTypeIds = const [],
    this.selectedStatus = -1,
  });

  factory SaleGdnState.init() {
    final now = DateTime.now();
    return SaleGdnState(
      status: BaseStateStatus.init,
      dateStart: DateTime(now.year, now.month, 1),
      dateEnd: DateTime(now.year, now.month, now.day, 23, 59, 59, 999),
    );
  }

  @override
  List get props => [
        status,
        message,
        gdns,
        searchKeyword,
        isSearching,
        dateStart,
        dateEnd,
        warehouseCode,
        warehouseTypes,
        selectedWarehouseTypeIds,
        selectedStatus,
      ];
}
