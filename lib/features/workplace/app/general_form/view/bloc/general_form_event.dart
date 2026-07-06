part of 'general_form_bloc.dart';

@freezed
class GeneralFormEvent with _$GeneralFormEvent {
  const factory GeneralFormEvent.init() = _Init;
  const factory GeneralFormEvent.fetchByDepartment({
    required int departmentId,
  }) = _FetchByDepartment;
  const factory GeneralFormEvent.search({
    String? keyword,
    int? departmentId,
  }) = _Search;
  const factory GeneralFormEvent.changeDepartment({
    required int departmentId,
  }) = _ChangeDepartment;
  const factory GeneralFormEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
}
