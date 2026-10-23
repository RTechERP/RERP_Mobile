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

  /// Thoát chế độ chọn và xoá hết lựa chọn hiện tại.
  const factory ApprovePurchasingEvent.exitSelectionMode() =
      _ExitSelectionMode;

  /// Toggle chọn / bỏ chọn 1 card. Khi bỏ chọn hết tự thoát mode.
  const factory ApprovePurchasingEvent.toggleSelection({
    required int itemId,
  }) = _ToggleSelection;

  /// Chọn tất cả card con đang hiển thị (sau filter hiện tại).
  const factory ApprovePurchasingEvent.selectAllVisible() = _SelectAllVisible;

  /// Bỏ chọn tất cả (giữ nguyên chế độ chọn).
  const factory ApprovePurchasingEvent.clearSelection() = _ClearSelection;

  /// Duyệt / huỷ duyệt các phiếu đang được chọn.
  /// [isApproved] = `true` → duyệt, `false` → huỷ duyệt. Server dùng
  /// giá trị này để set trạng thái `IsApprovedBGD`.
  const factory ApprovePurchasingEvent.approveSelected({
    required bool isApproved,
  }) = _ApproveSelected;

  /// UI phát sau khi đã hiện snackbar của `approveFeedback` lần đầu —
  /// để bloc về `null` tránh show lại khi rebuild.
  const factory ApprovePurchasingEvent.clearApproveFeedback() =
      _ClearApproveFeedback;

  /// Tải lịch sử giá của 1 sản phẩm theo từ khoá (thường là mã SP).
  /// [keyword] là mã sản phẩm dùng làm query `keyword` của API.
  const factory ApprovePurchasingEvent.loadPriceHistory({
    required String keyword,
  }) = _LoadPriceHistory;

  /// Xoá lịch sử giá khỏi state (sau khi user đóng bottom sheet).
  const factory ApprovePurchasingEvent.clearPriceHistory() = _ClearPriceHistory;
}
