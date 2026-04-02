part of 'overnight_bloc.dart';

typedef OvernightSubmitSlip = ({
  DateTime timeStart,
  DateTime endTime,
  double breakHours,
  String location,
  String reason,
});

@freezed
class OvernightEvent with _$OvernightEvent {
  const factory OvernightEvent.init() = _Init;
  const factory OvernightEvent.initAdd() = _InitAdd;
  const factory OvernightEvent.submitBatch({
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
    required List<OvernightSubmitSlip> slips,
  }) = _SubmitBatch;
  const factory OvernightEvent.onCancelSubmit({required int id}) =
      _OnCancelSubmit;
  const factory OvernightEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory OvernightEvent.clearSubmitState() = _ClearSubmitState;
  const factory OvernightEvent.fetchDetail({required int id}) = _FetchDetail;
  const factory OvernightEvent.submitEdit({
    required int id,
    required int approvedId,
    required DateTime dateRegister,
    required bool isProblem,
  }) = _SubmitEdit;
}