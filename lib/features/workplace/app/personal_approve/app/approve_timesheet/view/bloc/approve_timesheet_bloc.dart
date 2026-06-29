import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/error.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/approve_timesheet_model.dart';
import '../../data/repository/approve_timesheet_repo.dart';

part 'approve_timesheet_event.dart';
part 'approve_timesheet_state.dart';
part 'approve_timesheet_bloc.g.dart';
part 'approve_timesheet_bloc.freezed.dart';

@injectable
class ApproveTimesheetBloc
    extends BaseBloc<ApproveTimesheetEvent, ApproveTimesheetState> {
  final LogUtils _log;
  final ApproveTimesheetRepo _approveTimesheetRepo;

  ApproveTimesheetBloc(this._approveTimesheetRepo, this._log)
      : super(ApproveTimesheetState.init()) {
    on<ApproveTimesheetEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        toggleSelectionMode: () => _onToggleSelectionMode(emit),
        toggleSelection: (id) => _onToggleSelection(emit, id),
        toggleSelectGroup: (tType) => _onToggleSelectGroup(emit, tType),
        toggleSelectAll: () => _onToggleSelectAll(emit),
        setSelectionByTypes: (tTypes) =>
            _onSetSelectionByTypes(emit, tTypes),
        setFilterTTypes: (tTypes) => _onSetFilterTTypes(emit, tTypes),
        clearSelection: () => _onClearSelection(emit),
        seniorApprove: () => _onSeniorApprove(emit),
        seniorUnapprove: () => _onSeniorUnapprove(emit),
        seniorDecline: (reason) => _onSeniorDecline(emit, reason),
      );
    });
  }

  Future<void> _onInit(Emitter<ApproveTimesheetState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final seniorResult = await _approveTimesheetRepo.getApproveSeniorInfo();

    if (emit.isDone) return;

    final seniorId = seniorResult.fold(
      (error) => null,
      (list) => list.isNotEmpty ? list.first.leaderId : null,
    );

    if (seniorId == null) {
      emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Không lấy được thông tin Senior',
        ),
      );
      return;
    }

    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    final payload = {
      "FilterText": "",
      "DateStart": startOfMonth.toUtc().toIso8601String(),
      "DateEnd": endOfMonth.toUtc().toIso8601String(),
      "IDApprovedTP": 0,
      "Status": 0,
      "DeleteFlag": 0,
      "EmployeeID": 0,
      "TType": 0,
      "StatusSenior": -1,
      "StatusHR": -1,
      "StatusBGD": -1,
      "UserTeamID": 0,
      "SeniorID": seniorId,
    };

    final result = await _approveTimesheetRepo.getApproveTimesheet(
      payload: payload,
    );

    if (emit.isDone) return;

    result.fold(
      (error) => emit(
        state.copyWith(
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ),
      ),
      (items) => emit(
        state.copyWith(
          status: BaseStateStatus.success,
          items: items,
          seniorId: seniorId,
        ),
      ),
    );
  }

  Future<void> _onSeniorApprove(Emitter<ApproveTimesheetState> emit) async {
    if (state.seniorId == null || state.selectedIds.isEmpty) return;
    emit(state.copyWith(isSeniorApproving: true));
    final result = await _approveTimesheetRepo.approveSenior(
      items: state.selectedItems,
      isApproved: true,
      seniorId: state.seniorId!,
    );
    _onBatchResult(emit, result);
  }

  Future<void> _onSeniorUnapprove(Emitter<ApproveTimesheetState> emit) async {
    if (state.seniorId == null || state.selectedIds.isEmpty) return;
    emit(state.copyWith(isSeniorApproving: true));
    final result = await _approveTimesheetRepo.approveSenior(
      items: state.selectedItems,
      isApproved: false,
      seniorId: state.seniorId!,
    );
    _onBatchResult(emit, result);
  }

  Future<void> _onSeniorDecline(
    Emitter<ApproveTimesheetState> emit,
    String reason,
  ) async {
    if (state.seniorId == null || state.selectedIds.isEmpty) return;
    emit(state.copyWith(isSeniorApproving: true));
    final result = await _approveTimesheetRepo.declineSenior(
      items: state.selectedItems,
      seniorId: state.seniorId!,
      reason: reason,
    );
    _onBatchResult(emit, result);
  }

  Future<void> _onBatchResult(
    Emitter<ApproveTimesheetState> emit,
    Either<BaseError, bool> result,
  ) async {
    result.fold(
      (error) => emit(state.copyWith(
        isSeniorApproving: false,
        status: BaseStateStatus.failed,
        message: error.getErrorMessage,
      )),
      (_) {
        final remaining = state.items
                ?.where((e) => !state.selectedIds.contains(e.id))
                .toList() ??
            [];
        emit(state.copyWith(
          isSeniorApproving: false,
          status: BaseStateStatus.success,
          items: remaining,
          selectedIds: const <int>{},
          selectionMode: false,
        ));
        add(const ApproveTimesheetEvent.init());
      },
    );
  }

  Future<void> _onToggleSelectionMode(
      Emitter<ApproveTimesheetState> emit) async {
    final nextMode = !state.selectionMode;
    emit(state.copyWith(
      selectionMode: nextMode,
      selectedIds: nextMode ? state.selectedIds : const <int>{},
    ));
  }

  Future<void> _onToggleSelection(
    Emitter<ApproveTimesheetState> emit,
    int id,
  ) async {
    final next = Set<int>.from(state.selectedIds);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    final nextMode = state.selectionMode || next.isNotEmpty;
    emit(state.copyWith(
      selectedIds: next,
      selectionMode: nextMode,
    ));
  }

  Future<void> _onToggleSelectGroup(
    Emitter<ApproveTimesheetState> emit,
    int tType,
  ) async {
    final list = state.items?.where((e) => e.tType == tType) ?? const [];
    final ids = list.where((e) => e.id != null).map((e) => e.id!).toList();
    if (ids.isEmpty) return;

    final next = Set<int>.from(state.selectedIds);
    final allSelected = ids.every(next.contains);
    if (allSelected) {
      next.removeAll(ids);
    } else {
      next.addAll(ids);
    }
    emit(state.copyWith(
      selectedIds: next,
      selectionMode: true,
    ));
  }

  Future<void> _onToggleSelectAll(
      Emitter<ApproveTimesheetState> emit) async {
    final next = Set<int>.from(state.selectedIds);
    if (state.isAllSelected) {
      next.clear();
    } else {
      final ids = state.items
              ?.where((e) => e.id != null)
              .map((e) => e.id!) ??
          const Iterable<int>.empty();
      next.addAll(ids);
    }
    emit(state.copyWith(
      selectedIds: next,
      selectionMode: next.isNotEmpty,
    ));
  }

  Future<void> _onClearSelection(
      Emitter<ApproveTimesheetState> emit) async {
    emit(state.copyWith(
      selectedIds: const <int>{},
      selectionMode: false,
    ));
  }

  Future<void> _onSetSelectionByTypes(
    Emitter<ApproveTimesheetState> emit,
    Set<int> tTypes,
  ) async {
    final items = state.items ?? const <ApproveTimesheetItem>[];
    final Set<int> next = {};
    for (final t in tTypes) {
      for (final e in items) {
        if (e.tType == t && e.id != null) next.add(e.id!);
      }
    }
    emit(state.copyWith(
      selectedIds: next,
      selectionMode: next.isNotEmpty,
    ));
  }

  Future<void> _onSetFilterTTypes(
    Emitter<ApproveTimesheetState> emit,
    Set<int> tTypes,
  ) async {
    emit(state.copyWith(filteredTTypes: tTypes));
  }
}
