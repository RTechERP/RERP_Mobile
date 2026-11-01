part of 'crm_dashboard_bloc.dart';

/// Event cho Bloc Dashboard CRM.
@freezed
class CrmDashboardEvent with _$CrmDashboardEvent {
  const factory CrmDashboardEvent.init() = _Init;
  const factory CrmDashboardEvent.refresh() = _Refresh;
  const factory CrmDashboardEvent.changeDateRange({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) = _ChangeDateRange;
}
