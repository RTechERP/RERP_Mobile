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
}
