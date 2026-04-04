part of 'work_category_bloc.dart';

typedef WorkCategorySubmitSlip = ({
  int projectId,
  int typeProjectItem,
  int parentId,
  String mission,
  DateTime planStartDate,
  DateTime planEndDate,
  int employeeIdRequest,
  int employeeCreateId,
  double totalDayPlan,
  String note,
});

@freezed
class WorkCategoryEvent with _$WorkCategoryEvent {
  const factory WorkCategoryEvent.init() = _Init;
  const factory WorkCategoryEvent.initAdd() = _InitAdd;
  const factory WorkCategoryEvent.fetchParents({int? projectId}) = _FetchParents;
  const factory WorkCategoryEvent.submitBatch({
    required List<WorkCategorySubmitSlip> slips,
  }) = _SubmitBatch;
  const factory WorkCategoryEvent.onCancelSubmit({required int id}) =
      _OnCancelSubmit;
  const factory WorkCategoryEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory WorkCategoryEvent.clearSubmitState() = _ClearSubmitState;
  const factory WorkCategoryEvent.fetchDetail({required int id}) = _FetchDetail;
  const factory WorkCategoryEvent.submitEdit({
    required int id,
    required WorkCategorySubmitSlip slip,
  }) = _SubmitEdit;
}
