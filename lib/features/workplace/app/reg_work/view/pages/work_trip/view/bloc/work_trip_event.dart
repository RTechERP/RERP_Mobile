part of 'work_trip_bloc.dart';

@freezed
class WorkTripEvent with _$WorkTripEvent {
  const factory WorkTripEvent.init() = _Init;
  const factory WorkTripEvent.initAdd() = _InitAdd;
  const factory WorkTripEvent.submit(WorkTripSubmitData data) = _Submit;
  const factory WorkTripEvent.onCancelSubmit({required int id}) =
      _OnCancelSubmit;
  const factory WorkTripEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
  const factory WorkTripEvent.clearSubmitState() = _ClearSubmitState;
  const factory WorkTripEvent.fetchDetail({required int id}) = _FetchDetail;
  const factory WorkTripEvent.editSubmit({
    required int id,
    required WorkTripSubmitData data,
  }) = _EditSubmit;
  /// Lấy chi tiết để sao chép sang trang thêm mới.
  const factory WorkTripEvent.fetchCopy({required int id}) = _FetchCopy;
  /// Xoá dữ liệu sao chép sau khi đã navigate.
  const factory WorkTripEvent.clearCopyData() = _ClearCopyData;
}
