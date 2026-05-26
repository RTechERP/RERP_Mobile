part of 'work_requirement_bloc.dart';

@freezed
class WorkRequirementEvent with _$WorkRequirementEvent {
  const factory WorkRequirementEvent.init() = _Init;

  const factory WorkRequirementEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory WorkRequirementEvent.refresh() = _Refresh;

  const factory WorkRequirementEvent.initAdd() = _InitAdd;

  const factory WorkRequirementEvent.updateFormField({
    required int rowIndex,
    required String field,
    required String value,
  }) = _UpdateFormField;

  const factory WorkRequirementEvent.changeDateRequest(DateTime? date) =
      _ChangeDateRequest;

  const factory WorkRequirementEvent.changeDeadline(DateTime? date) =
      _ChangeDeadline;

  const factory WorkRequirementEvent.changeRequiredDepartment({
    required int? id,
    String? name,
  }) = _ChangeRequiredDepartment;

  const factory WorkRequirementEvent.changeCoordinationDepartment({
    required int? id,
    String? name,
  }) = _ChangeCoordinationDepartment;

  const factory WorkRequirementEvent.changeApprover({
    required int? id,
    String? displayName,
  }) = _ChangeApprover;

  const factory WorkRequirementEvent.changeAttachments(List<String> names) =
      _ChangeAttachments;

  const factory WorkRequirementEvent.submit({
    required int approvedTBPId,
    required DateTime dateRequest,
    required DateTime deadlineRequest,
    required int requiredDepartmentId,
    required List<WorkRequirementDetailItem> details,
    int? coordinationDepartmentId,
  }) = _Submit;

  const factory WorkRequirementEvent.clearSubmitState() =
      _ClearSubmitState;
}
