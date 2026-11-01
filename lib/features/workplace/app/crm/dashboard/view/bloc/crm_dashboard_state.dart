part of 'crm_dashboard_bloc.dart';

/// State cho màn Dashboard CRM.
@CopyWith()
class CrmDashboardState extends BaseBlocState {
  final CrmDashboardData? data;
  final DateTime dateStart;
  final DateTime dateEnd;

  const CrmDashboardState({
    required super.status,
    super.message,
    this.data,
    required this.dateStart,
    required this.dateEnd,
  });

  factory CrmDashboardState.init() {
    final now = DateTime.now();
    return CrmDashboardState(
      status: BaseStateStatus.init,
      dateStart: DateTime(now.year, now.month, 1),
      dateEnd: DateTime(now.year, now.month + 1, 0),
    );
  }

  @override
  List get props => [status, message, data, dateStart, dateEnd];
}
