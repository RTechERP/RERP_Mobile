part of 'history_import_export_bloc.dart';

@freezed
class HistoryImportExportEvent with _$HistoryImportExportEvent {
  /// Cập nhật mã kho (HN/HCM/BN) lấy từ màn chọn khu vực. Không gọi API.
  const factory HistoryImportExportEvent.setWarehouseCode(String? code) =
      _SetWarehouseCode;

  /// Tải (hoặc tải lại) danh sách theo bộ lọc hiện tại.
  const factory HistoryImportExportEvent.fetch() = _Fetch;

  /// Tìm theo từ khoá (mã phiếu, mã/tên sản phẩm, dự án...) rồi tải lại.
  const factory HistoryImportExportEvent.search(String keyword) = _Search;

  /// Xoá từ khoá tìm kiếm và tải lại danh sách.
  const factory HistoryImportExportEvent.clearSearch() = _ClearSearch;

  /// Đổi bộ lọc loại phiếu (nhập/xuất). Lọc cục bộ, không gọi API.
  const factory HistoryImportExportEvent.changeTypeFilter(
    HistoryTypeFilter filter,
  ) = _ChangeTypeFilter;

  /// Đổi khoảng ngày lọc và tải lại danh sách.
  const factory HistoryImportExportEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
}
