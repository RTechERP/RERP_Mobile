part of 'approve_timesheet_bloc.dart';

@CopyWith()
class ApproveTimesheetState extends BaseBlocState {
  const ApproveTimesheetState({required super.status, super.message});
  factory ApproveTimesheetState.init() =>
      const ApproveTimesheetState(status: BaseStateStatus.init);
  @override
  List get props => [status, message];
}
