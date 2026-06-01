part of 'idea_registration_bloc.dart';

@freezed
class IdeaRegistrationEvent with _$IdeaRegistrationEvent {
  const factory IdeaRegistrationEvent.init() = _Init;

  const factory IdeaRegistrationEvent.refresh() = _Refresh;

  const factory IdeaRegistrationEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory IdeaRegistrationEvent.initAdd() = _InitAdd;

  const factory IdeaRegistrationEvent.initDetail(int id) = _InitDetail;

  const factory IdeaRegistrationEvent.initEdit({
    required int id,
    required IdeaItem item,
  }) = _InitEdit;

  const factory IdeaRegistrationEvent.changeDateStart(DateTime? date) =
      _ChangeDateStart;

  const factory IdeaRegistrationEvent.changeDateEnd(DateTime? date) =
      _ChangeDateEnd;

  const factory IdeaRegistrationEvent.changeDepartment({
    required int? id,
    String? name,
  }) = _ChangeDepartment;

  const factory IdeaRegistrationEvent.changeCatalog({
    required int? id,
    String? name,
  }) = _ChangeCatalog;

  const factory IdeaRegistrationEvent.updateDetail({
    required int index,
    required String description,
    String? note,
  }) = _UpdateDetail;

  const factory IdeaRegistrationEvent.submit({
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required int? departmentId,
    required int? catalogId,
    required List<IdeaDetailRow> details,
  }) = _Submit;

  const factory IdeaRegistrationEvent.editSubmit({
    required int id,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required int? departmentId,
    required int? catalogId,
    required List<IdeaDetailRow> details,
  }) = _EditSubmit;

  const factory IdeaRegistrationEvent.clearSubmitState() =
      _ClearSubmitState;

  const factory IdeaRegistrationEvent.deleteIdea({required int id}) =
      _DeleteIdea;

  const factory IdeaRegistrationEvent.clearDeleteSuccess() =
      _ClearDeleteSuccess;
}
