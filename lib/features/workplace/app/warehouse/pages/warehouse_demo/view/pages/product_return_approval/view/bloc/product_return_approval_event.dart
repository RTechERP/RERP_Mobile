part of 'product_return_approval_bloc.dart';

@freezed
class ProductReturnApprovalEvent with _$ProductReturnApprovalEvent {
  /// Tải (hoặc tải lại) danh sách phiếu trả sản phẩm theo bộ lọc hiện tại.
  const factory ProductReturnApprovalEvent.fetch() = _Fetch;

  /// Tải danh sách nhân viên được giao duyệt trả sản phẩm.
  const factory ProductReturnApprovalEvent.fetchEmployees() = _FetchEmployees;

  /// Tìm theo từ khoá (mã / tên sản phẩm, tên người mượn). Lọc cục bộ.
  const factory ProductReturnApprovalEvent.search(String keyword) = _Search;

  /// Chọn nhân viên để lọc. `null` = không lọc theo nhân viên.
  const factory ProductReturnApprovalEvent.selectEmployee(int? employeeId) =
      _SelectEmployee;

  /// Lọc theo kho. `null` = không lọc theo kho.
  const factory ProductReturnApprovalEvent.changeWarehouseFilter(
    int? warehouseId,
  ) = _ChangeWarehouseFilter;

  /// Đổi khoảng ngày lọc và tải lại danh sách.
  const factory ProductReturnApprovalEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Bật / tắt chọn 1 phiếu trong danh sách.
  const factory ProductReturnApprovalEvent.toggleSelection(int id) =
      _ToggleSelection;

  /// Chọn tất cả các phiếu đang hiển thị.
  const factory ProductReturnApprovalEvent.selectAll() = _SelectAll;

  /// Bỏ chọn tất cả.
  const factory ProductReturnApprovalEvent.clearSelection() = _ClearSelection;

  /// Duyệt các phiếu đang chọn.
  ///
  /// Với mỗi phiếu: gọi API chi tiết trước để lấy `ID`, sau đó truyền `ID`
  /// đó vào payload của API duyệt.
  const factory ProductReturnApprovalEvent.approveSelected() = _ApproveSelected;

  /// Duyệt 1 phiếu cụ thể (dùng khi bấm nút duyệt trong bottom sheet chi tiết).
  const factory ProductReturnApprovalEvent.approveSingle(int id) =
      _ApproveSingle;
}
