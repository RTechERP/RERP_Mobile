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

  /// Lấy tiến độ kiểm kê theo vị trí kho & vị trí Modula.
  ///
  /// Trả về 3 danh sách: vị trí kho, tủ Modula cha, ô Modula chi tiết —
  /// mỗi danh sách kèm số tổng / đã kiểm / chưa kiểm.
  const factory InventoryCheckEvent.fetchLocationProgress({
    required int countId,
    @Default(0) int warehouseId,
    @Default(-1) int modulaLocationId,
    String? keyword,
  }) = _FetchLocationProgress;

  /// Chọn nhóm vị trí (1 trong 3 ô của card "Tiến độ theo vị trí") để lọc
  /// danh sách sản phẩm.
  ///
  /// - [InventoryLocationGroup.noLocation] → sản phẩm chưa có vị trí kho lẫn
  ///   vị trí Modula.
  /// - [InventoryLocationGroup.productLocation] → toàn bộ sản phẩm của đợt.
  /// - [InventoryLocationGroup.modula] → sản phẩm đang có vị trí Modula.
  const factory InventoryCheckEvent.selectLocationScope(
    InventoryLocationGroup group,
  ) = _SelectLocationScope;

  /// Chọn vị trí kho để lọc danh sách sản phẩm.
  ///
  /// [productLocationId] = `null` → bỏ lọc; `0` → sản phẩm chưa có vị trí;
  /// `> 0` → vị trí cụ thể.
  const factory InventoryCheckEvent.selectProductLocation(int? productLocationId) =
      _SelectProductLocation;

  /// Chọn tủ Modula (tray) để lọc danh sách sản phẩm.
  ///
  /// [modulaLocationId] = `null` → bỏ lọc; `0` → chưa có vị trí Modula;
  /// `> 0` → tủ cụ thể.
  const factory InventoryCheckEvent.selectModulaLocation(int? modulaLocationId) =
      _SelectModulaLocation;

  /// Chọn ô Modula chi tiết để lọc danh sách sản phẩm.
  ///
  /// Theo quy ước API, khi chọn ô chi tiết thì chỉ truyền
  /// `modulaLocationDetailId`, còn `modulaLocationId` giữ ở -1 (bỏ lọc).
  /// `null` → bỏ lọc.
  const factory InventoryCheckEvent.selectModulaLocationDetail({
    int? detailId,
  }) = _SelectModulaLocationDetail;

  /// Bỏ lọc theo vị trí (xem toàn bộ sản phẩm của đợt kiểm kê).
  const factory InventoryCheckEvent.clearLocationFilter() =
      _ClearLocationFilter;

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

  /// Tìm đợt kiểm kê theo mã đợt vừa quét (barcode/QR in trên phiếu).
  ///
  /// Kết quả trả về qua [InventoryCheckState.openedCountFromScan] để UI mở
  /// thẳng màn chi tiết phiếu; không tìm thấy thì qua
  /// [InventoryCheckState.scanCountMessage].
  const factory InventoryCheckEvent.findCountByCode(String code) =
      _FindCountByCode;

  /// Xoá cờ đợt kiểm kê đã mở từ quét + thông báo quét (sau khi UI xử lý).
  const factory InventoryCheckEvent.clearScanCountResult() =
      _ClearScanCountResult;

  /// Bật chế độ quét PDA trong phiếu kiểm kê.
  ///
  /// [mode] = [InventoryScanMode.product] → lọc ra đúng sản phẩm vừa quét.
  /// [mode] = [InventoryScanMode.location] → lọc ra tất cả sản phẩm cùng mã
  /// vị trí vừa quét.
  const factory InventoryCheckEvent.startSheetScan(InventoryScanMode mode) =
      _StartSheetScan;

  /// Xử lý mã vừa quét trong phiếu kiểm kê.
  const factory InventoryCheckEvent.sheetScanned(String code) = _SheetScanned;

  /// Tắt chế độ quét PDA trong phiếu kiểm kê và bỏ lọc theo mã quét.
  const factory InventoryCheckEvent.stopSheetScan() = _StopSheetScan;

  /// Xác nhận hoàn thành / mở lại một đợt kiểm kê.
  ///
  /// [isComplete] = `true` → hoàn thành, `false` → mở lại.
  const factory InventoryCheckEvent.confirmComplete({
    required int id,
    required bool isComplete,
  }) = _ConfirmComplete;
}
