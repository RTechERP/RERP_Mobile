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
}
