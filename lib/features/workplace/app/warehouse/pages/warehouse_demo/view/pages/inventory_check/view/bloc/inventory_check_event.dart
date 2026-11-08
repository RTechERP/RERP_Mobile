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

  /// Lấy chi tiết một đợt kiểm kê (dùng để fill màn chỉnh sửa).
  const factory InventoryCheckEvent.getById(int id) = _GetById;

  /// Xoá một đợt kiểm kê (kèm toàn bộ chi tiết kiểm kê liên quan).
  const factory InventoryCheckEvent.delete(int id) = _Delete;

  /// Lấy phiếu kiểm kê kèm danh sách sản phẩm đã kiểm kê.
  const factory InventoryCheckEvent.fetchSheet(int countId) = _FetchSheet;

  /// Tìm kiếm trong danh sách sản phẩm của phiếu (lọc cục bộ).
  const factory InventoryCheckEvent.searchSheet(String keyword) = _SearchSheet;

  /// Đổi bộ lọc sắp xếp danh sách sản phẩm của phiếu (lọc cục bộ).
  ///
  /// `null` = không lọc (hiển thị tất cả).
  const factory InventoryCheckEvent.filterSheet(
    InventoryCheckSheetFilter? filter,
  ) = _FilterSheet;

  /// Tải nhóm sản phẩm RTC để bổ sung sản phẩm vào phiếu kiểm kê.
  const factory InventoryCheckEvent.fetchProductGroupsRtc({
    required int warehouseId,
    required int warehouseType,
  }) = _FetchProductGroupsRtc;

  /// Lọc danh sách sản phẩm của phiếu theo nhóm sản phẩm (hãng).
  ///
  /// `null` = không lọc theo nhóm sản phẩm.
  const factory InventoryCheckEvent.filterSheetProductGroup(int? groupId) =
      _FilterSheetProductGroup;

  /// Lưu kết quả kiểm kê thực tế cho các dòng sản phẩm trong phiếu.
  ///
  /// [changedItems] là danh sách dòng chi tiết cần cập nhật, mỗi dòng gồm
  /// `ID`, `ProductRTCID`, `QuantityActual`, `Note`.
  const factory InventoryCheckEvent.saveCountDetails({
    required int countId,
    required List<Map<String, dynamic>> changedItems,
  }) = _SaveCountDetails;

  /// Xác nhận hoàn thành / mở lại một đợt kiểm kê.
  ///
  /// [isComplete] = `true` → hoàn thành, `false` → mở lại.
  const factory InventoryCheckEvent.confirmComplete({
    required int id,
    required bool isComplete,
  }) = _ConfirmComplete;
}
