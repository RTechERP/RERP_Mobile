part of 'project_list_bloc.dart';

@freezed
class ProjectListEvent with _$ProjectListEvent {
  const factory ProjectListEvent.init() = _Init;
  const factory ProjectListEvent.refresh() = _Refresh;
  const factory ProjectListEvent.search({
    String? keyword,
  }) = _Search;
  const factory ProjectListEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;
  const factory ProjectListEvent.changeDateRange({
    DateTime? dateStart,
    DateTime? dateEnd,
  }) = _ChangeDateRange;
}
