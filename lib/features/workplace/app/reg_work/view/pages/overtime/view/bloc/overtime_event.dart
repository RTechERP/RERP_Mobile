part of 'overtime_bloc.dart';

@freezed
class OvertimeEvent with _$OvertimeEvent {
  const factory OvertimeEvent.init() = _Init;
  const factory OvertimeEvent.initAdd() = _InitAdd;
  const factory OvertimeEvent.submitBatch({
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
    required List<OvertimeAddSlip> slips,
    /// File đính kèm đầu tiên (nếu có): {fileName, originPath}
    Map<String, String?>? fileInfo,
  }) = _SubmitBatch;
  const factory OvertimeEvent.onCancelSubmit({required int id}) = _OnCancelSubmit;
  const factory OvertimeEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory OvertimeEvent.clearSubmitState() = _ClearSubmitState;
  const factory OvertimeEvent.fetchDetail({required int id}) = _FetchDetail;
  const factory OvertimeEvent.submitEdit({
    required int id,
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
    required OvertimeAddSlip slip,
    Map<String, String?>? fileInfo,
  }) = _SubmitEdit;

  /// Tải danh sách hạng mục công việc của một dự án.
  ///
  /// Gọi khi người dùng chọn dự án — kết quả cache theo `projectId` trong state.
  const factory OvertimeEvent.loadProjectItems({required int projectId}) =
      _LoadProjectItems;

  /// Tải danh sách hạng mục công việc **đầy đủ** của một dự án (`status = -1`).
  ///
  /// Dùng ở màn chi tiết/sửa phiếu: hạng mục đã lưu có thể đã hoàn thành nên
  /// không nằm trong danh sách "đang thực hiện" (`status = 2`).
  const factory OvertimeEvent.loadProjectItemsAll({required int projectId}) =
      _LoadProjectItemsAll;
}
