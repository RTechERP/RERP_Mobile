import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../base/bloc/index.dart';
import '../../../../../../../../di/injection.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../data/repository/week_plan_repo.dart';
import 'week_plan_bloc.dart';

part 'week_plan_approval_state.dart';
part 'week_plan_approval_event.dart';
part 'week_plan_approval_bloc.freezed.dart';
part 'week_plan_approval_bloc.g.dart';

@injectable
class WeekPlanApprovalBloc
    extends Bloc<WeekPlanApprovalEvent, WeekPlanApprovalState> {
  final WeekPlanRepo _weekPlanRepo;
  final LogUtils _log;

  WeekPlanApprovalBloc(
    this._weekPlanRepo,
    this._log,
  ) : super(WeekPlanApprovalState.init()) {
    on<WeekPlanApprovalEvent>((event, emit) async {
      await event.when(
        approveTask: (taskId, review, completionRating) =>
            _onApproveTask(emit, taskId, review, completionRating),
        rejectTask: (taskId, reason) =>
            _onRejectTask(emit, taskId, reason),
        clearApprovalState: () => _onClearApprovalState(emit),
      );
    });
  }

  Future<void> _onApproveTask(
    Emitter<WeekPlanApprovalState> emit,
    int taskId,
    String? review,
    int? completionRating,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _weekPlanRepo.approveProjectTask(
      projectTaskIds: [taskId],
      isApproved: true,
      review: review,
      completionRating: completionRating,
    );

    await res.fold(
      (err) async {
        _log.logE('Approve task failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('Approve task success: $taskId');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          approvalSuccess: true,
          approvalTaskId: taskId,
          approvalIsApprove: true,
        ));
        _refreshList();
      },
    );
  }

  Future<void> _onRejectTask(
    Emitter<WeekPlanApprovalState> emit,
    int taskId,
    String reason,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _weekPlanRepo.approveProjectTask(
      projectTaskIds: [taskId],
      isApproved: false,
      review: reason,
    );

    await res.fold(
      (err) async {
        _log.logE('Reject task failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('Reject task success: $taskId');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          approvalSuccess: true,
          approvalTaskId: taskId,
          approvalIsApprove: false,
        ));
        _refreshList();
      },
    );
  }

  _refreshList() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    getIt<WeekPlanBloc>().add(
      WeekPlanEvent.changeDateRange(
        dateStart: startOfMonth,
        dateEnd: endOfMonth,
      ),
    );
  }

  _onClearApprovalState(Emitter<WeekPlanApprovalState> emit) {
    emit(state.copyWith(
      approvalSuccess: false,
      approvalTaskId: null,
      approvalIsApprove: null,
    ));
  }
}
