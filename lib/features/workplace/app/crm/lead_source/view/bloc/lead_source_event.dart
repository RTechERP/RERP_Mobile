part of 'lead_source_bloc.dart';

/// Các sự kiện của Bloc Nguồn Lead.
@freezed
class LeadSourceEvent with _$LeadSourceEvent {
  /// Khởi tạo màn danh sách.
  const factory LeadSourceEvent.init() = _Init;

  /// Refresh danh sách.
  const factory LeadSourceEvent.refresh() = _Refresh;

  /// Lưu nguồn lead (thêm/sửa).
  const factory LeadSourceEvent.save(LeadSourceItem source) = _Save;

  /// Xoá nguồn lead.
  const factory LeadSourceEvent.delete(int id) = _Delete;

  /// Clear trạng thái sau khi lưu.
  const factory LeadSourceEvent.clearSaveState() = _ClearSaveState;

  /// Clear trạng thái sau khi xoá.
  const factory LeadSourceEvent.clearDeleteState() = _ClearDeleteState;
}
