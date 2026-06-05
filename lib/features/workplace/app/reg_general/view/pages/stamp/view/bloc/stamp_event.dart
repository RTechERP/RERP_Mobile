part of 'stamp_bloc.dart';

@freezed
class StampEvent with _$StampEvent {
  const factory StampEvent.init() = _Init;

  const factory StampEvent.initAdd() = _InitAdd;

  const factory StampEvent.initDetail({required int id}) = _InitDetail;

  const factory StampEvent.initEdit({required int id}) = _InitEdit;

  const factory StampEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory StampEvent.loadFormOptions() = _LoadFormOptions;

  const factory StampEvent.changeRegisterDate(DateTime registerDate) =
      _ChangeRegisterDate;

  const factory StampEvent.changeUrgent(bool isUrgent) = _ChangeUrgent;

  const factory StampEvent.changeDeadline(DateTime? deadline) = _ChangeDeadline;

  const factory StampEvent.changeDocumentType({
    required int? id,
    String? name,
  }) = _ChangeDocumentType;

  const factory StampEvent.changeDocumentName(String name) = _ChangeDocumentName;

  const factory StampEvent.changeDocumentQuantity(int quantity) =
      _ChangeDocumentQuantity;

  const factory StampEvent.changeDocumentTotalPage(int totalPage) =
      _ChangeDocumentTotalPage;

  const factory StampEvent.changeApproved({
    required int? id,
    String? name,
  }) = _ChangeApproved;

  const factory StampEvent.changeEmployeeSign({
    required int? id,
    String? name,
  }) = _ChangeEmployeeSign;

  const factory StampEvent.changeSealRegulation({
    required int? id,
    String? name,
  }) = _ChangeSealRegulation;

  const factory StampEvent.changeTaxCompany({
    required int? id,
    String? name,
  }) = _ChangeTaxCompany;

  const factory StampEvent.submitStamp() = _SubmitStamp;

  const factory StampEvent.clearSubmitState() = _ClearSubmitState;

  const factory StampEvent.deleteStamp({required int id}) = _DeleteStamp;

  const factory StampEvent.clearDeleteState() = _ClearDeleteState;
}
