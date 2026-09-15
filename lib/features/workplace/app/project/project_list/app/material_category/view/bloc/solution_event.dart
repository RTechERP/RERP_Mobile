part of 'solution_bloc.dart';

@freezed
class SolutionEvent with _$SolutionEvent {
  const factory SolutionEvent.init() = _Init;
  const factory SolutionEvent.refresh() = _Refresh;
}
