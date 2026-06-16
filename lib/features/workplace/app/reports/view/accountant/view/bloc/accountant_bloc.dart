import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../../features/auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';

part 'accountant_event.dart';
part 'accountant_state.dart';
part 'accountant_bloc.freezed.dart';
part 'accountant_bloc.g.dart';

@injectable
class AccountantBloc extends BaseBloc<AccountantEvent, AccountantState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  AccountantBloc(this._reportRepo, this._authRepo, this._log)
      : super(AccountantState.init()) {
    on<AccountantEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        searchKeyword: (keyword) => _onSearchKeyword(keyword, emit),
        refresh: () => _onRefresh(emit),
        resetSubmitStatus: () => _onResetSubmitStatus(emit),
        submit: (employeeId, items) => _onSubmit(employeeId, items, emit),
        deleteReport: (id) => _onDeleteReport(id, emit),
        resetDeleteStatus: () => _onResetDeleteStatus(emit),
      );
    });
  }

  Future<void> _onResetSubmitStatus(Emitter<AccountantState> emit) async {
    if (!state.submitSuccess && !state.isSubmitting && state.message == null) {
      return;
    }
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }

  Future<void> _onSubmit(
    int? passedEmployeeId,
    List<AccountantSubmitItem> items,
    Emitter<AccountantState> emit,
  ) async {
    if (state.isSubmitting) return;

    emit(state.copyWith(
      isSubmitting: true,
      submitSuccess: false,
      message: null,
    ));

    int? employeeId = passedEmployeeId;
    if (employeeId == null || employeeId == 0) {
      final userRes = await _authRepo.getCurrentUser();
      employeeId = await userRes.fold(
        (l) async {
          _log.logE('Get current user failed: ${l.getErrorMessage}');
          emit(state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            message: l.getErrorMessage,
          ));
          return null;
        },
        (user) async => user?.employeeId,
      );
      if (employeeId == null || employeeId == 0) {
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          message: 'Không xác định được nhân viên hiện tại',
        ));
        return;
      }
    }

    final payload = items.map((e) {
      final dt = e.reportDate;
      final dateStr =
          '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}'
          'T'
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}';
      return <String, dynamic>{
        'Id': 0,
        'EmployeeID': employeeId,
        'ReportDate': dateStr,
        'Content': e.content,
        'Result': e.result,
        'NextPlan': e.nextPlan,
        'PendingIssues': e.pendingIssues,
        'Urgent': e.urgent,
        'MistakeOrViolation': e.mistakeOrViolation,
      };
    }).toList();

    final res = await _reportRepo.saveReportAccounting(payload: payload);

    await res.fold(
      (l) async {
        _log.logE('Save accountant report failed: ${l.getErrorMessage}');
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          status: BaseStateStatus.success,
          message: r,
        ));
      },
    );
  }

  Future<void> _onInit(Emitter<AccountantState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, deleteSuccess: false));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (l) async {
        _log.logE('Get current user failed: ${l.getErrorMessage}');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        final now = DateTime.now();
        final start = DateTime(now.year, now.month - 1, now.day);
        final end = DateTime(now.year, now.month, now.day, 23, 59, 59);

        emit(
          state.copyWith(
            employeeId: user.employeeId,
            fullName: user.fullName,
            chucVu: user.positionName,
            page: 1,
            hasReachedMax: false,
            reports: const [],
            dateStart: start,
            dateEnd: end,
            keyword: '',
          ),
        );

        await _fetchReports(
          emit: emit,
          isLoadMore: false,
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<AccountantState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        page: 1,
        hasReachedMax: false,
        reports: const [],
        dateStart: dateStart,
        dateEnd: dateEnd,
        keyword: '',
      ),
    );

    await _fetchReports(emit: emit, isLoadMore: false);
  }

  Future<void> _onSearchKeyword(
    String keyword,
    Emitter<AccountantState> emit,
  ) async {
    emit(
      state.copyWith(
        keyword: keyword,
        page: 1,
        hasReachedMax: false,
        reports: const [],
        status: BaseStateStatus.loading,
      ),
    );

    await _fetchReports(emit: emit, isLoadMore: false);
  }

  Future<void> _onRefresh(Emitter<AccountantState> emit) async {
    emit(
      state.copyWith(
        page: 1,
        hasReachedMax: false,
        reports: const [],
        status: BaseStateStatus.loading,
      ),
    );

    await _fetchReports(emit: emit, isLoadMore: false);
  }

  Future<void> _onDeleteReport(int id, Emitter<AccountantState> emit) async {
    emit(state.copyWith(
      isDeleting: true,
      deleteSuccess: false,
      status: BaseStateStatus.loading,
    ));

    final result = await _reportRepo.deleteReportAccounting(id: id);

    result.fold(
      (error) {
        _log.logE('Delete accountant report failed: ${error.getErrorMessage}');
        emit(state.copyWith(
          isDeleting: false,
          deleteSuccess: false,
          status: BaseStateStatus.failed,
          message: error.getErrorMessage,
        ));
      },
      (message) {
        final updatedReports =
            state.reports.where((e) => e.id != id).toList();

        emit(state.copyWith(
          reports: updatedReports,
          isDeleting: false,
          deleteSuccess: true,
          status: BaseStateStatus.success,
          message: message,
        ));
      },
    );
  }

  Future<void> _onResetDeleteStatus(Emitter<AccountantState> emit) async {
    if (!state.deleteSuccess && (state.message == null || state.isDeleting)) {
      return;
    }
    emit(state.copyWith(
      deleteSuccess: false,
      message: null,
      isDeleting: false,
    ));
  }

  Future<void> _fetchReports({
    required Emitter<AccountantState> emit,
    required bool isLoadMore,
  }) async {
    if (state.dateStart == null || state.dateEnd == null) return;

    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    }

    final res = await _reportRepo.getAccountantReport(
      dateStart: state.dateStart!,
      dateEnd: state.dateEnd!,
      page: state.page,
      size: state.size,
      filterText: state.keyword,
      employeeId: state.employeeId ?? 0,
    );

    res.fold(
      (l) {
        _log.logE('Get accountant report failed: ${l.getErrorMessage}');
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        final newList = isLoadMore ? [...state.reports, ...r] : r;
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            reports: newList,
            hasReachedMax: r.length < state.size,
            isLoadingMore: false,
          ),
        );
      },
    );
  }
}
