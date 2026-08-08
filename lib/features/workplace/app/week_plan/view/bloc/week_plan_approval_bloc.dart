import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../data/repository/week_plan_repo.dart';

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
        toggleSelectTask: (taskId) => _onToggleSelectTask(emit, taskId),
        clearSelection: () => _onClearSelection(emit),
        approveTask: (taskId, review, completionRating) =>
            _onApproveTask(emit, taskId, review, completionRating),
        rejectTask: (taskId, reason) =>
            _onRejectTask(emit, taskId, reason),
        bulkApproveTasks: (taskIds, review, completionRating) =>
            _onBulkApproveTasks(emit, taskIds, review, completionRating),
        bulkRejectTasks: (taskIds, reason) =>
            _onBulkRejectTasks(emit, taskIds, reason),
        clearApprovalState: () => _onClearApprovalState(emit),
      );
    });
  }

  //---(Selection)---//
  Future<void> _onToggleSelectTask(
    Emitter<WeekPlanApprovalState> emit,
    int taskId,
  ) async {
    final selected = Set<int>.from(state.selectedTaskIds);
    if (selected.contains(taskId)) {
      selected.remove(taskId);
    } else {
      selected.add(taskId);
    }
    emit(state.copyWith(selectedTaskIds: selected));
  }

  Future<void> _onClearSelection(Emitter<WeekPlanApprovalState> emit) async {
    emit(state.copyWith(selectedTaskIds: const {}));
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
          needsRefresh: true,
        ));
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
          needsRefresh: true,
        ));
      },
    );
  }

  _onClearApprovalState(Emitter<WeekPlanApprovalState> emit) {
    emit(WeekPlanApprovalState.init());
  }

  Future<void> _onBulkApproveTasks(
    Emitter<WeekPlanApprovalState> emit,
    List<int> taskIds,
    String? review,
    int? completionRating,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _weekPlanRepo.approveProjectTask(
      projectTaskIds: taskIds,
      isApproved: true,
      review: review,
      completionRating: completionRating,
    );

    await res.fold(
      (err) async {
        _log.logE('Bulk approve tasks failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('Bulk approve tasks success: $taskIds');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          approvalSuccess: true,
          needsRefresh: true,
        ));
      },
    );
  }

  Future<void> _onBulkRejectTasks(
    Emitter<WeekPlanApprovalState> emit,
    List<int> taskIds,
    String reason,
  ) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _weekPlanRepo.approveProjectTask(
      projectTaskIds: taskIds,
      isApproved: false,
      review: reason,
    );

    await res.fold(
      (err) async {
        _log.logE('Bulk reject tasks failed: $err');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: err.getErrorMessage,
        ));
      },
      (data) async {
        _log.logI('Bulk reject tasks success: $taskIds');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          approvalSuccess: true,
          needsRefresh: true,
        ));
      },
    );
  }
}
