import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';

part 'hr_event.dart';
part 'hr_state.dart';
part 'hr_bloc.g.dart';
part 'hr_bloc.freezed.dart';

@injectable
class HrBloc extends BaseBloc<HrEvent, HrState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;
  HrBloc(this._reportRepo, this._authRepo, this._log) : super(HrState.init()) {
    on<HrEvent>((event, emit) async {
      await event.when(
        initAd: () => _onInitAd(emit),
        initLxcp: () => _onInitLxcp(emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        updateDate: (picked) => _onUpdateDate(picked, emit),
        updateWork: (content, results, note, backlog, planNextDay) =>
            _onUpdateWork(content, results, note, backlog, planNextDay, emit),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        loadDetailData: (dailyID) => _onLoadDetailData(dailyID, emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(dailyID, pickedDate, emit),

        selectReport: (dailyID) => _onSelectReport(dailyID, emit),
        submitReport: (pickedDate) => _onSubmitReport(pickedDate, emit),
        copyReport:
            (dateStart, dateEnd, keyword, teamId, userId, departmentId) =>
                _onCopyReport(
                  dateStart,
                  dateEnd,
                  teamId,
                  userId,
                  keyword,
                  departmentId,
                  emit,
                ),
        resetCopyReport: () => _onResetCopy(emit),
      );
    });
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<HrState> emit,
  }) async {
    final teamId = state.teamId;
    final userId = state.userId;
    final departmentId = state.departmentId;

    if (teamId == null || userId == null || departmentId == null) {
      emit(state.copyWith(status: BaseStateStatus.failed));
      return;
    }

    final res = await _reportRepo.getDailyReportTech(
      dateStart: start,
      dateEnd: end,
      keyword: state.keyword ?? '',
      teamId: teamId.toString(),
      userId: userId.toString(),
      departmentId: departmentId.toString(),
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            reports: r,
            dateStart: start,
            dateEnd: end,
          ),
        );
      },
    );
  }

  Future<void> _onInitAd(Emitter<HrState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final departRes = await _reportRepo.getDepart();

    await userRes.fold(
      (l) async {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (user) async {
        if (user == null) {
          emit(state.copyWith(status: BaseStateStatus.failed));
          return;
        }

        emit(
          state.copyWith(
            userId: user.id,
            fullName: user.fullName,
            departmentId: user.departmentId,
            teamId: user.teamOfUser,
            employeeID: user.employeeId,
            positionName: user.positionName,
            departmentName: user.departmentName,
          ),
        );

        final now = DateTime.now();
        final start = now;
        final end = DateTime(now.year, now.month, now.day + 1);

        await _loadDailyReport(start: start, end: end, emit: emit);
      },
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: $l'),
      (r) => emit(state.copyWith(departs: r)),
    );
  }

  Future<void> _onInitLxcp(Emitter<HrState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // TODO: call API LXCP
    await Future.delayed(const Duration(milliseconds: 500));

    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        lxcpList: const [], // fake data tạm
      ),
    );
  }

  bool _isSubmittingReport = false;

  Future<void> _onSubmitReport(
    DateTime pickedDate,
    Emitter<HrState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      final payload = <String, dynamic>{
        'ID': 0,
        'MasterID': 0,
        'UserReport': userId,
        'DateReport': dateStr,
        'Content': state.content ?? '',
        'Results': state.results ?? '',
        'PlanNextDay': state.planNextDay ?? '',
        'Note': state.note ?? '',
        'Backlog': state.backlog ?? '',
      };

      final res = await _reportRepo.saveReportHR(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit HR report success');
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit HR report');
    }
  }

  _onResetSubmitFlags(Emitter<HrState> emit) {
    emit(state.copyWith(submitSuccess: false, sendMailSuccess: false));
    emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
  }

  _onUpdateDate(DateTime? picked, Emitter<HrState> emit) {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);

    emit(state.copyWith(dateReport: safeDate));
  }

  Future<void> _onUpdateWork(
    String? content,
    String? results,
    String? note,
    String? backlog,
    String? planNextDay,
    Emitter<HrState> emit,
  ) async {
    emit(
      state.copyWith(
        content: content ?? state.content,
        results: results ?? state.results,
        note: note ?? state.note,
        backlog: backlog ?? state.backlog,
        planNextDay: planNextDay ?? state.planNextDay,
      ),
    );
  }

  Future<void> _onSelectReport(int dailyID, Emitter<HrState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final res = await _reportRepo.getById(dailyID: dailyID);

    await res.fold(
      (l) async {
        _log.logE('Get detail failed: $l');
        emit(state.copyWith(isLoadingDetail: false));
      },
      (detail) async {
        // _log.logI('✅ Detail Report: $detail');

        emit(
          state.copyWith(
            isLoadingDetail: false,
            selectedReportDetail: detail, // DetailReportResponse
          ),
        );
      },
    );
  }

  Future<void> _onDeleteReport(int dailyID, Emitter<HrState> emit) async {
    emit(
      state.copyWith(
        isDeleting: true,
        deleteSuccess: false,
        status: BaseStateStatus.loading,
      ),
    );

    final result = await _reportRepo.deleteReportById(dailyID: dailyID);

    result.fold(
      (error) {
        emit(state.copyWith(isDeleting: false, deleteSuccess: false));
      },
      (message) {
        /// remove khỏi list hiện tại (không cần gọi lại API)
        final updatedReports = state.reports
            .where((e) => e.id != dailyID)
            .toList();

        emit(
          state.copyWith(
            reports: updatedReports,
            isDeleting: false,
            deleteSuccess: true,
            status: BaseStateStatus.success,
            message: message,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<HrState> emit,
  ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyReport(start: start, end: end, emit: emit);
  }

  Future<void> _onLoadDetailData(int dailyID, Emitter<HrState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final detailRes = await _reportRepo.getById(dailyID: dailyID);

    await detailRes.fold(
      (l) async {
        emit(state.copyWith(isLoadingDetail: false));
      },
      (detail) async {
        final userRes = await _authRepo.getCurrentUser();
        final projectRes = await _reportRepo.getProject();

        final user = userRes.getOrElse(() => null);
        emit(
          state.copyWith(
            isLoadingDetail: false,
            planNextDay: detail.planNextDay,
            problem: detail.problem,
            problemSolve: detail.problemSolve,
            backlog: detail.backlog,
            note: detail.note,
            dateReport: DateTime.tryParse(detail.dateReport),
            expandedWorkIndex: 0,
          ),
        );
      },
    );
  }

  bool _isSavingReport = false;

  Future<void> _onSubmitEditReport(
    int dailyID,
    DateTime pickedDate,
    Emitter<HrState> emit,
  ) async {
    if (_isSavingReport) {
      _log.logW('Submit blocked - already saving');
      return;
    }

    _isSavingReport = true;

    try {
      _log.logI('Start submit edit report - dailyID: $dailyID');

      emit(state.copyWith(isSaving: true, saveSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        _log.logE('Submit failed - userId null');
        emit(state.copyWith(isSaving: false, saveSuccess: false));
        return;
      }

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      final payload = <String, dynamic>{
        'ID': dailyID, // FIX: dùng dailyID thay vì 0
        'UserReport': userId,
        'DateReport': dateStr,
        'Content': state.content ?? '',
        'Results': state.results ?? '',
        'PlanNextDay': state.planNextDay ?? '',
        'Note': state.note ?? '',
      };

      _log.logI('Submit payload: $payload');

      final res = await _reportRepo.saveReportMarketing(payload: payload);

      res.fold(
        (l) {
          _log.logE('Submit edit failed - dailyID: $dailyID - error: $l');

          emit(state.copyWith(isSaving: false, saveSuccess: false));
        },
        (r) {
          _log.logI('Submit edit success - dailyID: $dailyID');

          emit(state.copyWith(isSaving: false, saveSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('Submit edit exception - dailyID: $dailyID - error: $e');
      _log.logE(s.toString());

      emit(state.copyWith(isSaving: false, saveSuccess: false));
    } finally {
      _isSavingReport = false;
    }
  }

  Future<void> _onCopyReport(
    DateTime dateStart,
    DateTime dateEnd,
    int teamId,
    int userId,
    String keyword,
    int departmentId,
    Emitter<HrState> emit,
  ) async {
    emit(state.copyWith(isCopyLoading: true, status: BaseStateStatus.loading));

    final result = await _reportRepo.copyHrReport(
      dateStart: dateStart,
      dateEnd: dateEnd,
      teamId: teamId,
      userId: userId,
      keyword: keyword,
      departmentId: departmentId,
    );

    result.fold(
      (error) {
        emit(
          state.copyWith(isCopyLoading: false, status: BaseStateStatus.failed),
        );
      },
      (data) {
        // _log.logI('Copy report success: $data');
        emit(
          state.copyWith(
            isCopyLoading: false,
            copyReports: List.from(data),
            status: BaseStateStatus.success,
          ),
        );
      },
    );
  }

  _onResetCopy(Emitter<HrState> emit) {
    emit(state.copyWith(copyReports: [], copyError: null));
  }
}
