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
}
