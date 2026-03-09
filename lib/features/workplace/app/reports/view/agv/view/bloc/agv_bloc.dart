import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';
import '../../data/agv_model.dart';

part 'agv_event.dart';
part 'agv_state.dart';
part 'agv_bloc.g.dart';
part 'agv_bloc.freezed.dart';

@injectable
class AgvBloc extends BaseBloc<AgvEvent, AgvState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;
  AgvBloc(this._reportRepo, this._authRepo, this._log)
    : super(AgvState.init()) {
    on<AgvEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        updateDate: (picked) => _onUpdateDate(picked, emit),
        updateWork:
            (
              index,
              projectId,
              projectName,
              totalHours,
              totalHourOT,
              content,
              results,
              backlog,
              problem,
              problemSolve,
              note,
              dateReport,
              code,
              location,
            ) => _onUpdateWork(
              index,
              projectId: projectId,
              projectName: projectName,
              totalHours: totalHours,
              totalHourOT: totalHourOT,
              content: content,
              results: results,
              backlog: backlog,
              problem: problem,
              problemSolve: problemSolve,
              note: note,
              dateReport: dateReport,
              code: code,
              location: location,
              emit: emit,
            ),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        loadDetailData: (dailyID) => _onLoadDetailData(dailyID, emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(dailyID, pickedDate, emit),

        selectReport: (dailyID) => _onSelectReport(dailyID, emit),
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
        submitReport: (pickedDate) => _onSubmitReport(pickedDate, emit),
        addWork: () => _onAddWork(emit),

        removeWork: (index) => _onRemoveWork(index, emit),

        expandWork: (index) => _onExpandWork(index, emit),
        getProject: () => _onGetProject(emit),
        selectProject: (project) => _onSelectProject(project, emit),
        updateLocation: (type, value) => _onUpdateLocation(type, value, emit),
        updatePlanNextDay: (planNextDay) => _onUpdatePlanNextDay(planNextDay, emit),
      );
    });
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<AgvState> emit,
  }) async {
    final userId = state.userId;
    final departmentId = state.departmentId;
    final teamId = state.teamId;

    if (userId == null && departmentId == null && teamId == null) {
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

  Future<void> _onInit(Emitter<AgvState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final projectRes = await _reportRepo.getProject();

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
          ),
        );

        final now = DateTime.now();
        final start = now;
        final end = DateTime(now.year, now.month, now.day + 1);

        await _loadDailyReport(start: start, end: end, emit: emit);
      },
    );
    projectRes.fold(
      (l) => _log.logE('Get film detail failed: $l'),
      (r) => emit(state.copyWith(projects: r)),
    );
  }

  bool _isSubmittingReport = false;

  Future<void> _onSubmitReport(
    DateTime pickedDate,
    Emitter<AgvState> emit,
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

      if (state.works.isEmpty) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final payload = state.works.map<Map<String, dynamic>>((w) {
        return {
          'ID': 0,
          'MasterID': 0,
          'UserReport': userId,
          'DateReport': dateStr,

          // đúng format backend
          'ProjectID': w.projectItemId ?? 0,
          'ProjectItemID': 0,

          'Content': w.content,
          'Results': w.results,
          'Problem': w.problem ?? '',
          'ProblemSolve': w.problemSolve ?? '',
          'PlanNextDay': state.planNextDay ?? '',
          'Note': w.note ?? '',
          'Backlog': w.backlog ?? '',

          'TotalHours': (w.totalHours).toInt(),
          'TotalHourOT': (w.totalHourOT ?? 0).toInt(),
          'PercentComplete': 0,

          'Location': state.location ?? 'VP RTC',

          'Type': 0,
          'ReportLate': 0,
          'StatusResult': 0,
          'WorkPlanDetailID': 0,
          'OldProjectID': 0,
          'DeleteFlag': 0,
          'Confirm': false,
        };
      }).toList();

      _log.logD('Payload: ${jsonEncode(payload)}');

      final res = await _reportRepo.saveReportAgvAd(
        payload: payload,
      );

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

  _onResetSubmitFlags(Emitter<AgvState> emit) {
    emit(state.copyWith(submitSuccess: false));
    emit(state.copyWith(isSubmitting: false));
  }

  _onUpdateDate(DateTime? picked, Emitter<AgvState> emit) {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);

    emit(state.copyWith(dateReport: safeDate));
  }

  Future<void> _onUpdateWork(
    int index, {
    int? projectId,
    String? projectName,
    int? totalHours,
    int? totalHourOT,
    String? content,
    String? results,
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    DateTime? dateReport,
    String? code,
    dynamic location,
    required Emitter<AgvState> emit,
  }) async {
    final works = [...state.works];

    if (works.isEmpty) {
      works.add(
        const AgvWork(
          code: '',
          totalHours: 0,
          userId: 0,
          fullName: '',
          results: '',
          planNextDay: '',
          positionName: '',
          content: '',
          mission: '',
          projectItemCode: '',
        ),
      );
    }

    if (index < 0 || index >= works.length) return;

    final old = works[index];

    /// project
    final effectiveProjectId = projectId ?? old.projectItemId;

    ProjectResponse? project;

    if (effectiveProjectId != null) {
      project = state.projects.firstWhere(
        (e) => e.id == effectiveProjectId,
        orElse: () => ProjectResponse(id: 0, projectCode: '', projectName: ''),
      );
    }

    final effectiveProjectName =
        projectName ?? project?.projectName ?? old.projectName;

    final effectiveProjectCode =
        code ?? project?.projectCode ?? old.projectCode;

    works[index] = old.copyWith(
      projectItemId: effectiveProjectId,
      projectCode: effectiveProjectCode,
      projectName: effectiveProjectName,

      totalHours: totalHours?.toDouble() ?? old.totalHours,
      totalHourOT: totalHourOT?.toDouble() ?? old.totalHourOT,

      content: content ?? old.content,
      results: results ?? old.results,
      backlog: backlog ?? old.backlog,
      problem: problem ?? old.problem,
      problemSolve: problemSolve ?? old.problemSolve,
      note: note ?? old.note,

      dateReport: dateReport?.toIso8601String() ?? old.dateReport,
      location: location ?? old.location,
    );

    emit(state.copyWith(works: works));
  }

  Future<void> _onSelectReport(int dailyID, Emitter<AgvState> emit) async {
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

  Future<void> _onDeleteReport(int dailyID, Emitter<AgvState> emit) async {
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
    Emitter<AgvState> emit,
  ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyReport(start: start, end: end, emit: emit);
  }

  Future<void> _onLoadDetailData(int dailyID, Emitter<AgvState> emit) async {
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
    Emitter<AgvState> emit,
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
          'ID': 0,
          'MasterID': 0,
          'UserReport': userId,
          'DateReport': dateStr,

          'ProjectID': w.projectItemId,
          'ProjectItemID': w.projectItemId,

          'Content': w.content,
          'Results': w.results,
          'Problem': w.problem ?? '',
          'ProblemSolve': w.problemSolve ?? '',
          'PlanNextDay': w.planNextDay,
          'Note': w.note ?? '',
          'Backlog': w.backlog ?? '',

          'TotalHours': w.totalHours.toInt(),
          'TotalHourOT': (w.totalHourOT ?? 0).toInt(),
          'PercentComplete': 0,

          'Location': w.location ?? 'VP RTC',

          'Type': 0,
          'ReportLate': 0,
          'StatusResult': 0,
          'WorkPlanDetailID': 0,
          'OldProjectID': 0,
          'DeleteFlag': 0,
          'Confirm': false,
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
    Emitter<AgvState> emit,
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

  _onResetCopy(Emitter<AgvState> emit) {
    emit(state.copyWith(copyReports: [], copyError: null));
  }

  _onAddWork(Emitter<AgvState> emit) {
    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    final newWorks = [
      ...state.works,
      AgvWork.empty(
        dateReport: dateStr,
        projectId: 0,
        userId: 0,
        code: '',

        fullName: '',
        projectItemId: 0,
      ),
    ];

    emit(
      state.copyWith(works: newWorks, expandedWorkIndex: newWorks.length - 1),
    );
  }

  _onRemoveWork(int index, Emitter<AgvState> emit) {
    final newWorks = [...state.works];

    if (index < 0 || index >= newWorks.length) return;

    newWorks.removeAt(index);

    emit(state.copyWith(works: newWorks, expandedWorkIndex: null));
  }

  _onExpandWork(int index, Emitter<AgvState> emit) {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  Future<void> _onGetProject(Emitter<AgvState> emit) async {
    /// emit trước để UI hiển thị
    emit(
      state.copyWith(
        works: [
          AgvWork(
            id: DateTime.now().microsecondsSinceEpoch,
            code: '',
            totalHours: 0,
            userId: 0,
            fullName: '',
            results: '',
            planNextDay: '',
            positionName: '',
            content: '',
            mission: '',
            projectItemCode: '',
          ),
        ],
        expandedWorkIndex: 0,
      ),
    );

    /// call API chạy ngầm
    final res = await _reportRepo.getProject();

    res.fold((l) {}, (r) {
      emit(state.copyWith(projects: r));
    });
  }

  _onSelectProject(ProjectResponse project, Emitter<AgvState> emit) {
    emit(state.copyWith(selectedProject: project));
  }

  _onUpdateLocation(String type, String? value, Emitter<AgvState> emit) {
    emit(
      state.copyWith(
        locationType: type,
        location: type == 'rtc' ? 'VP RTC' : (value ?? ''),
      ),
    );
  }

  _onUpdatePlanNextDay(String planNextDay, Emitter<AgvState> emit) {
    emit(state.copyWith(planNextDay: planNextDay));
  }
}
