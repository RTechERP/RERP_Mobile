part of 'work_requirement_bloc.dart';

@freezed
class WorkRequirementEvent with _$WorkRequirementEvent {
  const factory WorkRequirementEvent.init() = _Init;

  const factory WorkRequirementEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory WorkRequirementEvent.refresh() = _Refresh;
}
