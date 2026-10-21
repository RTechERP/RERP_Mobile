part of 'approve_purchasing_bloc.dart';

/// Event cho màn Duyệt phiếu yêu cầu mua hàng.
@freezed
class ApprovePurchasingEvent with _$ApprovePurchasingEvent {
  /// Tải danh sách loại phiếu mua + toàn bộ phiếu của page hiện tại.
  /// Bloc sẽ tự set khoảng ngày mặc định (tháng hiện tại) nếu state
  /// chưa có.
  const factory ApprovePurchasingEvent.init() = _Init;

  /// Thay đổi khoảng ngày lọc — gọi lại API `get-all` với range mới.
  const factory ApprovePurchasingEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  /// Đổi tab (đổi loại phiếu mua) — chỉ tra cache `itemsByType`
  /// trong state, KHÔNG gọi lại API. Dữ liệu đã được load 1 lần
  /// bằng `init` / `changeDateRange` / `refresh`.
  const factory ApprovePurchasingEvent.selectTab({
    required int requestTypeId,
  }) = _SelectTab;

  /// Pull-to-refresh / reload toàn bộ danh sách phiếu.
  const factory ApprovePurchasingEvent.refresh() = _Refresh;

  /// Chọn dự án để lọc — chỉ chạy client-side trên cache `itemsByType`,
  /// không gọi lại API. Truyền `null` để bỏ lọc theo dự án.
  const factory ApprovePurchasingEvent.selectProject({
    required int? projectId,
  }) = _SelectProject;

  /// Chọn nhà cung cấp để lọc — chỉ chạy client-side trên cache
  /// `itemsByType`. Truyền `null` để bỏ lọc theo nhà cung cấp.
  const factory ApprovePurchasingEvent.selectSupplier({
    required int? supplierId,
  }) = _SelectSupplier;

  /// Reset bộ lọc về mặc định (không lọc gì cả).
  const factory ApprovePurchasingEvent.resetFilter() = _ResetFilter;

  /// Cập nhật từ khóa tìm kiếm.
  const factory ApprovePurchasingEvent.changeSearchKeyword({
    required String keyword,
  }) = _ChangeSearchKeyword;

  /// Chọn sản phẩm để lọc (lưu `code - name`, giá trị rỗng = bỏ lọc).
  const factory ApprovePurchasingEvent.selectProduct({
    required String product,
  }) = _SelectProduct;

  /// Chọn trạng thái duyệt BGĐ (`all` / `pending` / `approved`).
  const factory ApprovePurchasingEvent.selectApprovalFilter({
    required PurchasingApprovalFilter filter,
  }) = _SelectApprovalFilter;
}
