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

  const factory AccountantEvent.resetSubmitStatus() = _ResetSubmitStatus;

  const factory AccountantEvent.submit({
    int? employeeId,
    required List<AccountantSubmitItem> items,
  }) = _Submit;
}

class AccountantSubmitItem {
  final DateTime reportDate;
  final String content;
  final String result;
  final String nextPlan;
  final String pendingIssues;
  final String urgent;
  final String mistakeOrViolation;

  const AccountantSubmitItem({
    required this.reportDate,
    required this.content,
    required this.result,
    required this.nextPlan,
    required this.pendingIssues,
    required this.urgent,
    required this.mistakeOrViolation,
  });
}
