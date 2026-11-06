part of 'inventory_check_bloc.dart';

@freezed
class InventoryCheckEvent with _$InventoryCheckEvent {
  /// Tải (hoặc tải lại) danh sách đợt kiểm kê theo khoảng ngày hiện tại.
  const factory InventoryCheckEvent.fetch() = _Fetch;

  /// Tải danh sách nhân viên được giao kiểm kê.
  const factory InventoryCheckEvent.fetchEmployees() = _FetchEmployees;

  /// Tìm theo từ khoá (mã đợt, tên đợt, tên NV, ghi chú). Lọc cục bộ.
  const factory InventoryCheckEvent.search(String keyword) = _Search;

  /// Chọn nhân viên kiểm kê để lọc. `null` = không lọc theo nhân viên.
  const factory InventoryCheckEvent.selectEmployee(int? employeeId) =
      _SelectEmployee;

  /// Lọc theo kho. `null` = tất cả kho.
  const factory InventoryCheckEvent.changeWarehouseFilter(int? warehouseId) =
      _ChangeWarehouseFilter;

  /// Đổi khoảng ngày lọc và tải lại danh sách.
  const factory InventoryCheckEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Sinh mã đợt kiểm kê theo ngày đã chọn.
  const factory InventoryCheckEvent.generateCode(DateTime date) = _GenerateCode;

  /// Lưu đợt kiểm kê mới.
  const factory InventoryCheckEvent.save(InventoryCountSavePayload payload) =
      _Save;
}
