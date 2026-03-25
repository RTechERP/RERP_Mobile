part of 'lunch_bloc.dart';

@freezed
class LunchEvent with _$LunchEvent{
  const factory LunchEvent.init() = _Init;
  const factory LunchEvent.submit({
    required int quantity,
    required int location,
    required String note,
    DateTime? dateOrder,
  }) = _Submit;
  const factory LunchEvent.onCancelSubmit({
    required int id,
  }) = _OnCancelSubmit;
  const factory LunchEvent.onEditSubmit({
    required int id,
    required int quantity,
    required int location,
    required String note,
    DateTime? dateOrder,
  }) = _OnEditSubmit;
  const factory LunchEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory LunchEvent.clearSubmitState() = _ClearSubmitState;
}