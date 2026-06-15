part of 'accountant_bloc.dart';

@freezed
class AccountantEvent with _$AccountantEvent {
  const factory AccountantEvent.init() = _Init;

  const factory AccountantEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;

  const factory AccountantEvent.searchKeyword(String keyword) =
      _SearchKeyword;

  const factory AccountantEvent.refresh() = _Refresh;
}
