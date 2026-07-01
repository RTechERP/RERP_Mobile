part of 'approve_timesheet_bloc.dart';

@freezed
class ApproveTimesheetEvent with _$ApproveTimesheetEvent {
  /// Init cho bloc. Mặc định là Senior (backward-compat).
  /// TBP truyền `role: ApproveTimesheetRole.tbp` + `employeeId` để filter API
  /// theo `IDApprovedTP` và lưu lại employeeId dùng khi submit approve.
  const factory ApproveTimesheetEvent.init({
    @Default(ApproveTimesheetRole.senior) ApproveTimesheetRole role,
    int? employeeId,
  }) = _Init;

  /// Bật / tắt chế độ chọn nhiều.
  const factory ApproveTimesheetEvent.toggleSelectionMode() =
      _ToggleSelectionMode;

  /// Toggle chọn 1 phiếu (id theo `ApproveTimesheetItem.id`).
  const factory ApproveTimesheetEvent.toggleSelection(int id) = _ToggleSelection;

  /// Chọn tất cả / bỏ chọn tất cả các phiếu trong 1 nhóm TType.
  const factory ApproveTimesheetEvent.toggleSelectGroup(int tType) =
      _ToggleSelectGroup;

  /// Chọn / bỏ chọn tất cả phiếu trên toàn màn hình.
  const factory ApproveTimesheetEvent.toggleSelectAll() = _ToggleSelectAll;

  /// Replace selection theo tập `tTypes` (dùng cho bottom sheet filter).
  /// Set rỗng → clear selection.
  const factory ApproveTimesheetEvent.setSelectionByTypes(Set<int> tTypes) =
      _SetSelectionByTypes;

  /// Lọc hiển thị các nhóm theo `tTypes` (không ảnh hưởng `selectedIds`).
  /// Set rỗng → bỏ filter, hiển thị tất cả nhóm.
  const factory ApproveTimesheetEvent.setFilterTTypes(Set<int> tTypes) =
      _SetFilterTTypes;

  /// Xoá toàn bộ lựa chọn + thoát selection mode.
  const factory ApproveTimesheetEvent.clearSelection() = _ClearSelection;

  /// Senior duyệt hàng loạt (isApproved = true).
  const factory ApproveTimesheetEvent.seniorApprove() = _SeniorApprove;

  /// Senior huỷ duyệt hàng loạt (isApproved = false, không cần lý do).
  const factory ApproveTimesheetEvent.seniorUnapprove() = _SeniorUnapprove;

  /// Senior từ chối hàng loạt kèm lý do (ghi DecilineApproveSenior + ReasonDecilineSenior).
  const factory ApproveTimesheetEvent.seniorDecline(String reason) =
      _SeniorDecline;

  /// TBP duyệt hàng loạt (isApproved = true).
  const factory ApproveTimesheetEvent.tbpApprove() = _TbpApprove;

  /// TBP huỷ duyệt hàng loạt (isApproved = false, không cần lý do).
  const factory ApproveTimesheetEvent.tbpUnapprove() = _TbpUnapprove;

  /// TBP từ chối hàng loạt kèm lý do (ghi DecilineApprove + ReasonDeciline).
  const factory ApproveTimesheetEvent.tbpDecline(String reason) = _TbpDecline;

  /// Duyệt Senior hộ cho các phiếu chưa Senior duyệt (TBP bypass).
  /// Items là subset của `state.items` đã được user chọn trong bottom sheet.
  /// Items này sẽ được submit `/approve-senior-new` với IsSeniorApproved=true,
  /// trước khi submit TBP approve.
  const factory ApproveTimesheetEvent.tbpSeniorBypassApprove(
    List<ApproveTimesheetItem> items,
  ) = _TbpSeniorBypassApprove;
}

/// Loại role đang gọi bloc. Senior và TBP khác nhau filter API + payload.
enum ApproveTimesheetRole {
  /// Senior: filter theo `SeniorID` (lấy từ `getApproveSeniorInfo`).
  senior,

  /// TBP: filter theo `IDApprovedTP = user.employeeId`.
  tbp,
}
