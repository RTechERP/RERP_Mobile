part of 'approve_timesheet_bloc.dart';

@freezed
class ApproveTimesheetEvent with _$ApproveTimesheetEvent {
  /// Init cho bloc. Mặc định là Senior (backward-compat).
  /// TBP truyền `role: ApproveTimesheetRole.tbp` + `employeeId` để filter API
  /// theo `IDApprovedTP` và lưu lại employeeId dùng khi submit approve.
  ///
  /// `tType` (optional): khi user vào từ menu Phê duyệt → 1 loại phiếu cụ thể
  /// → API filter theo `TType` trong payload (chỉ trả về nhóm phiếu đó).
  /// `null` / `0` → lấy tất cả.
  const factory ApproveTimesheetEvent.init({
    @Default(ApproveTimesheetRole.senior) ApproveTimesheetRole role,
    int? employeeId,
    @Default(0) int? status,
    int? tType,
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

  /// Lọc theo trạng thái duyệt (chỉ dùng cho TBP).
  /// -1 = tất cả, 0 = chưa duyệt, 1 = đã duyệt.
  const factory ApproveTimesheetEvent.setFilterStatus(int? status) =
      _SetFilterStatus;

  /// Lọc dữ liệu theo khoảng ngày (gửi kèm `DateStart` / `DateEnd` lên API).
  /// Khi nhận event này, bloc sẽ set state + tự động gọi lại `init` để
  /// reload danh sách với range mới.
  const factory ApproveTimesheetEvent.setDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _SetDateRange;

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
  /// sau đó submit TBP approve/unapprove cho đúng phiếu.
  const factory ApproveTimesheetEvent.tbpSeniorBypassApprove(
    List<ApproveTimesheetItem> items,
    bool isApproved,
  ) = _TbpSeniorBypassApprove;
}

/// Loại role đang gọi bloc. Senior và TBP khác nhau filter API + payload.
enum ApproveTimesheetRole {
  /// Senior: filter theo `SeniorID` (lấy từ `getApproveSeniorInfo`).
  senior,

  /// TBP: filter theo `IDApprovedTP = user.employeeId`.
  tbp,
}
