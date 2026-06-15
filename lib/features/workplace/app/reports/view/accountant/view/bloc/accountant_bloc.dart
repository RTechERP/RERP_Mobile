import 'package:copy_with_extension/copy_with_extension.dart';
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
      );
    });
  }

  Future<void> _onInit(Emitter<AccountantState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

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
