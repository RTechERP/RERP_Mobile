import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';
import '../../data/lxcp_model.dart';

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
        lxcpUpdateWork:
            (
              index,
              quantity,
              timeActual,
              performanceActual,
              percentage,
              kmNumber,
              totalLate,
              totalTimeLate,
              reasonLate,
              statusVehicle,
              propose,
              filmManagementDetailID,
            ) => _onLxcpUpdateXWork(
              index,
              quantity: quantity,
              timeActual: timeActual,
              performanceActual: performanceActual,
              percentage: percentage,
              kmNumber: kmNumber,
              totalLate: totalLate,
              totalTimeLate: totalTimeLate,
              reasonLate: reasonLate,
              statusVehicle: statusVehicle,
              propose: propose,
              filmManagementDetailID: filmManagementDetailID,
              emit: emit,
            ),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        changeLXCPDateRange: (dateStart, dateEnd) =>
            _onChangeLXCPDateRange(dateStart, dateEnd, emit),
        loadDetailData: (dailyID) => _onLoadDetailData(dailyID, emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(dailyID, pickedDate, emit),
        submitLXCPEditReport: (pickedDate, dailyID) => _onSubmitLXCPEditReport(dailyID, pickedDate, emit),


        selectReport: (dailyID) => _onSelectReport(dailyID, emit),
        selectLXCPReport: (dailyID) => _onSelectLXCPReport(dailyID, emit),
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
        submitReportLCXP: (pickedDate) => _onSubmitReportLXCP(pickedDate, emit),
        deleteReportLCXP: (id, isDeleted) =>
            _onDeleteReportLXCP(id, isDeleted, emit),
        addWork: () => _onAddWork(emit),

        removeWork: (index) => _onRemoveWork(index, emit),

        expandWork: (index) => _onExpandWork(index, emit),
        getFilmDetail: () => _onGetFilmDetail(emit),
        selectFilmDetail: (film) => _onSelectFilmDetail(film, emit),

      );
    });
  }

  Future<void> _loadDailyHRReport({
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

  Future<void> _loadDailyLXCPReport({
    required DateTime start,
    required DateTime end,
    required Emitter<HrState> emit,
  }) async {
    final employeeId = state.employeeID;

    if (employeeId == null) {
      emit(state.copyWith(status: BaseStateStatus.failed));
      return;
    }

    final res = await _reportRepo.getLXCPDailyReport(
      dateStart: start,
      dateEnd: end,
      keyword: state.keyword ?? '',
      employeeId: employeeId.toString(),
    );

    res.fold(
      (l) {
        emit(state.copyWith(status: BaseStateStatus.failed));
      },
      (r) {
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            lxcpReports: r.data?.hrAll,
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
        final start = DateTime(now.year, now.month, now.day-1);
        final end = DateTime(now.year, now.month, now.day);

        await _loadDailyHRReport(start: start, end: end, emit: emit);
      },
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: $l'),
      (r) => emit(state.copyWith(departs: r)),
    );
  }

  Future<void> _onInitLxcp(Emitter<HrState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final filmRes = await _reportRepo.getFilmDetail();

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
            positionId: user.positionId,

            /// auto có sẵn công việc 1
            works: [
              LxCpWork(
                id: DateTime.now().microsecondsSinceEpoch,
                workContent: '',
              ),
            ],

            /// auto mở
            expandedWorkIndex: 0,
          ),
        );

        final now = DateTime.now();
        final start = now;
        final end = DateTime(now.year, now.month, now.day + 1);

        await _loadDailyLXCPReport(start: start, end: end, emit: emit);
      },
    );
    filmRes.fold(
      (l) => _log.logE('Get film detail failed: $l'),
      (r) => emit(state.copyWith(filmDetail: r)),
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

  Future<void> _onSubmitReportLXCP(
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

      final payload = state.works.map((w) {
        return {
          'ID': 0,
          'EmployeeID': state.employeeID,
          'DateReport': dateStr,
          'FilmManagementDetailID': w.filmManagementDetailId,
          'Quantity': w.quantity,
          'TimeActual': w.timeActual ?? 0,
          'PerformanceActual': w.performanceActual,
          'Percentage': w.percentage,
          'KmNumber': w.kmNumber,
          'TotalLate': w.totalLate,
          'TotalTimeLate': w.totalTimeLate,
          'ReasonLate': w.reasonLate,
          'StatusVehicle': w.statusVehicle,
          'Propose': w.propose,
          'IsDeleted': false,
        };
      }).toList();

      final res = await _reportRepo.saveReportLXCP(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Submit API failed: $l');
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
        },
        (r) async {
          _log.logI('✅ Submit LXCP report success');
          emit(state.copyWith(isSubmitting: false, submitSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Submit exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End submit LXCP report');
    }
  }

  Future<void> _onDeleteReportLXCP(
    int? id,
    bool isDeleted,
    Emitter<HrState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isDeleting: true, deleteSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isDeleting: false));
        return;
      }

      final payload = [
        {
          'ID': id,
          'EmployeeID': state.employeeID,
          'DateReport': state.dateReport,
          'FilmManagementDetailID': state.filmManagementDetailID,
          'Quantity': state.quantity,
          'TimeActual': state.timeActual ?? 0,
          'PerformanceActual': state.performanceActual,
          'Percentage': state.percentage,
          'KmNumber': state.kmNumber,
          'TotalLate': state.totalLate,
          'TotalTimeLate': state.totalTimeLate,
          'ReasonLate': state.reasonLate,
          'StatusVehicle': state.statusVehicle,
          'Propose': state.propose,
          'IsDeleted': isDeleted,
        },
      ];

      final res = await _reportRepo.saveReportLXCP(payload: payload);

      await res.fold(
        (l) async {
          _log.logE('❌ Delete API failed: $l');
          emit(state.copyWith(isDeleting: false, deleteSuccess: false));
        },
        (r) async {
          _log.logI('✅ Delete LXCP success');
          emit(state.copyWith(isDeleting: false, deleteSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Delete exception: $e');
      _log.logE('$s');
      emit(state.copyWith(isDeleting: false, deleteSuccess: false));
    } finally {
      _isSubmittingReport = false;
      _log.logI('🏁 End delete LXCP');
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

  Future<void> _onLxcpUpdateXWork(
      int index, {
        int? quantity,
        int? timeActual,
        int? performanceActual,
        int? percentage,
        int? kmNumber,
        int? totalLate,
        int? totalTimeLate,
        String? reasonLate,
        String? statusVehicle,
        String? propose,
        int? filmManagementDetailID,
        required Emitter<HrState> emit,
      }) async {

    final newWorks = [...state.works];

    /// nếu chưa có work thì tạo mới
    if (newWorks.isEmpty) {
      newWorks.add(LxCpWork());
    }

    if (index < 0 || index >= newWorks.length) return;

    final old = newWorks[index];

    final effectiveFilmId =
        filmManagementDetailID ?? old.filmManagementDetailId;

    FilmDetailResponse? film;

    if (effectiveFilmId != null) {
      try {
        film = state.filmDetail.firstWhere(
              (e) => e.filmManagementID == effectiveFilmId,
        );
      } catch (_) {
        film = null;
      }
    }

    final q = quantity ?? old.quantity ?? 0;
    final t = timeActual ?? old.timeActual ?? 0;

    final performanceAVG = film?.performanceAVG ?? 0;

    /// performanceActual = timeActual / quantity
    double performanceActualCalc = 0;
    if (q > 0) {
      performanceActualCalc = double.parse((t / q).toStringAsFixed(2));
    }

    /// percentage = performanceAVG / performanceActual
    double percentageCalc = 0;
    if (performanceActualCalc > 0 && performanceAVG > 0) {
      percentageCalc =
          double.parse((performanceAVG / performanceActualCalc).toStringAsFixed(2));
    }
    newWorks[index] = old.copyWith(
      quantity: q,
      timeActual: t,
      performanceActual: performanceActualCalc.toInt(),
      percentage: percentageCalc.toInt(),
      kmNumber: kmNumber ?? old.kmNumber,
      totalLate: totalLate ?? old.totalLate,
      totalTimeLate: totalTimeLate ?? old.totalTimeLate,
      reasonLate: reasonLate ?? old.reasonLate,
      statusVehicle: statusVehicle ?? old.statusVehicle,
      propose: propose ?? old.propose,
      filmManagementDetailId: effectiveFilmId,
      performanceAvg: performanceAVG,   // THIẾU DÒNG NÀY
    );

    emit(state.copyWith(works: newWorks));
  }

  Future<void> _onSelectReport(int dailyID, Emitter<HrState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final res = await _reportRepo.getByIdNull(dailyID: dailyID);

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

  Future<void> _onSelectLXCPReport(int dailyID, Emitter<HrState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);

    final res = await _reportRepo.getLXCPById(dailyID: dailyID);

    await res.fold(
          (l) async {
        _log.logE('Get LXCP detail failed: $l');
        emit(state.copyWith(isLoadingDetail: false));
      },
          (detail) async {
        _log.logI('✅ Detail Report: $detail');

        emit(
          state.copyWith(
            isLoadingDetail: false,
            selectedLXCPReportDetail: detail,
            positionId: user?.positionId,   // bổ sung
            works: [
              LxCpWork(
                filmManagementDetailId: detail.filmManagementDetailID,
                quantity: detail.quantity,
                timeActual: detail.timeActual?.toInt(),
                performanceActual: detail.performanceActual?.toInt(),
                percentage: detail.percentage?.toInt(),
                kmNumber: detail.kmNumber?.toInt(),
                totalLate: detail.totalLate,
                totalTimeLate: detail.totalTimeLate?.toInt(),
                reasonLate: detail.reasonLate,
                statusVehicle: detail.statusVehicle,
                propose: detail.propose,
              )
            ],
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

    await _loadDailyHRReport(start: start, end: end, emit: emit);
  }

  Future<void> _onChangeLXCPDateRange(
      DateTime dateStart,
      DateTime dateEnd,
      Emitter<HrState> emit,
      ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyLXCPReport(start: start, end: end, emit: emit);
  }

  Future<void> _onLoadDetailData(int dailyID, Emitter<HrState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final detailRes = await _reportRepo.getByIdNull(dailyID: dailyID);

    await detailRes.fold(
      (l) async {
        emit(state.copyWith(isLoadingDetail: false));
      },
      (detail) async {
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

      final res = await _reportRepo.saveReportHR(payload: payload);

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

  Future<void> _onSubmitLXCPEditReport(
      int dailyID,
      DateTime pickedDate,
      Emitter<HrState> emit,
      ) async {
    if (_isSavingReport) return;
    _isSavingReport = true;

    try {
      emit(state.copyWith(isSaving: true, saveSuccess: false));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      if (state.works.isEmpty) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final payload = state.works.map((w) {
        return {
          'ID': dailyID,
          'EmployeeID': state.employeeID,
          'DateReport': dateStr,
          'FilmManagementDetailID': w.filmManagementDetailId,
          'Quantity': w.quantity,
          'TimeActual': w.timeActual ?? 0,
          'PerformanceActual': w.performanceActual,
          'Percentage': w.percentage,
          'KmNumber': w.kmNumber,
          'TotalLate': w.totalLate,
          'TotalTimeLate': w.totalTimeLate,
          'ReasonLate': w.reasonLate,
          'StatusVehicle': w.statusVehicle,
          'Propose': w.propose,
          'IsDeleted': false,
        };
      }).toList();


      _log.logI('📦 LXCP EDIT PAYLOAD: $payload');
      _log.logI('📊 WORKS LENGTH: ${state.works.length}');

      final res = await _reportRepo.saveReportLXCP(payload: payload);

      res.fold(
            (l) {
          _log.logE('❌ Edit API failed: $l');
          emit(state.copyWith(isSaving: false, saveSuccess: false));
        },
            (r) {
          _log.logI('✅ Edit LXCP report success');
          emit(state.copyWith(isSaving: false, saveSuccess: true));
        },
      );
    } catch (e, s) {
      _log.logE('❌ Edit exception: $e');
      _log.logE('$s');

      emit(state.copyWith(isSaving: false, saveSuccess: false));
    } finally {
      _isSavingReport = false;
      _log.logI('🏁 End edit LXCP report');
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
      keyword: keyword,
      teamId: teamId,
      userId: userId,
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

  _onAddWork(Emitter<HrState> emit) {
    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    final newWorks = [
      ...state.works,
      LxCpWork.empty(employeeId: state.employeeID ?? 0, dateReport: dateStr),
    ];

    emit(
      state.copyWith(works: newWorks, expandedWorkIndex: newWorks.length - 1),
    );
  }

  _onRemoveWork(int index, Emitter<HrState> emit) {
    final newWorks = [...state.works];

    if (index < 0 || index >= newWorks.length) return;

    newWorks.removeAt(index);

    emit(state.copyWith(works: newWorks, expandedWorkIndex: null));
  }

  _onExpandWork(int index, Emitter<HrState> emit) {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  Future<void> _onGetFilmDetail(Emitter<HrState> emit)async{
    final res = await _reportRepo.getFilmDetail();

    res.fold(
          (l) {},
          (r) {
        emit(state.copyWith(filmDetail: r));
      },
    );
  }

   _onSelectFilmDetail(
      FilmDetailResponse film,
      Emitter<HrState> emit,
      ) {
    emit(
      state.copyWith(
        selectedFilmDetail: film,
      ),
    );
  }
}
