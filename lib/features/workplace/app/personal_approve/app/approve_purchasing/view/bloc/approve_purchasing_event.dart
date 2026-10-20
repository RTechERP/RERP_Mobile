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

  /// Áp dụng bộ lọc (project + supplier) — chỉ chạy client-side trên
  /// cache `itemsByType`, không gọi lại API.
  const factory ApprovePurchasingEvent.applyFilter({
    int? projectId,
    int? supplierId,
  }) = _ApplyFilter;

  /// Reset bộ lọc về mặc định (không lọc gì cả).
  const factory ApprovePurchasingEvent.resetFilter() = _ResetFilter;

  /// Cập nhật từ khóa tìm kiếm (mã SP / tên SP / note).
  const factory ApprovePurchasingEvent.changeSearchKeyword({
    required String keyword,
  }) = _ChangeSearchKeyword;
}
