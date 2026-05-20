part of 'contract_registration_bloc.dart';

@freezed
class ContractRegistrationEvent with _$ContractRegistrationEvent {
  const factory ContractRegistrationEvent.init() = _Init;

  const factory ContractRegistrationEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory ContractRegistrationEvent.searchContracts({
    String? keyword,
  }) = _SearchContracts;

  const factory ContractRegistrationEvent.initAdd() = _InitAdd;

  const factory ContractRegistrationEvent.clearSubmitResult() =
      _ClearSubmitResult;

  const factory ContractRegistrationEvent.fetchReceivers() =
      _FetchReceivers;

  const factory ContractRegistrationEvent.submitContract({
    required DateTime registedDate,
    required int taxCompanyId,
    required int documentTypeId,
    required String contractType,
    required int employeeReceiverId,
    required int documentQuantity,
    required String documentName,
    required bool isScan,
    String? folderPath,
  }) = _SubmitContract;

  const factory ContractRegistrationEvent.initDetail({
    required int id,
  }) = _InitDetail;

  const factory ContractRegistrationEvent.updateContract({
    required int id,
    required DateTime registedDate,
    required int taxCompanyId,
    required int documentTypeId,
    required String contractType,
    required int employeeReceiverId,
    required int documentQuantity,
    required String documentName,
    required bool isScan,
    String? folderPath,
  }) = _UpdateContract;

  const factory ContractRegistrationEvent.deleteContract({
    required int id,
  }) = _DeleteContract;

  const factory ContractRegistrationEvent.clearDeleteSuccess() =
      _ClearDeleteSuccess;
}
