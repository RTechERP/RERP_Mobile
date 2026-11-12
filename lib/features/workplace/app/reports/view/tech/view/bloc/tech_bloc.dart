import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../auth/data/repository/auth_repo.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../../../data/repository/report_repo.dart';
import '../../../../../reg_work/view/pages/overtime/data/datasource/models/overtime_model.dart';
import '../../../../../reg_work/view/pages/overtime/data/repository/overtime_repo.dart';
import '../../data/tech_location.dart';
import '../../data/tech_model.dart';
import '../../data/tech_problem_status.dart';

part 'tech_event.dart';
part 'tech_state.dart';
part 'tech_bloc.g.dart';
part 'tech_bloc.freezed.dart';

@injectable
class TechBloc extends BaseBloc<TechEvent, TechState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  /// Repo làm thêm — tái sử dụng để lấy danh sách người duyệt / loại làm thêm.
  final OvertimeRepo _overtimeRepo;

  TechBloc(this._reportRepo, this._authRepo, this._log, this._overtimeRepo)
    : super(TechState.init()) {
    on<TechEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: (copyItems, rtcProject) =>
            _onInitAdd(copyItems, rtcProject, emit),

        /// ===== PROJECT =====
        addEmptyProject: () => _onAddEmptyProject(emit),

        bindProjectFromApi: (tempId, apiProject) =>
            _onBindProjectFromApi(tempId, apiProject, emit),

        removeProject: (tempId) => _onRemoveProject(tempId, emit),

        selectProject: (tempId) => _onSelectProject(tempId, emit),

        updateProjectName: (tempId, newName) =>
            _onUpdateProjectName(tempId, newName, emit),

        /// ===== WORK =====
        addWork: () => _onAddWork(emit),

        removeWork: (index) => _onRemoveWork(index, emit),

        expandWork: (index) => _onExpandWork(index, emit),

        updateWork:
            (
              index,
              totalHours,
              totalHourOT,
              percentComplete,
              content,
              results,
              mission,
              projectItemId,
              code,
              backlog,
              problem,
              problemSolve,
              note,
              location,
            ) => _onUpdateWork(
              index,
              totalHours: totalHours,
              totalHourOT: totalHourOT,
              percentComplete: percentComplete,
              content: content,
              results: results,
              mission: mission,
              projectItemId: projectItemId,
              code: code,
              backlog: backlog,
              problem: problem,
              problemSolve: problemSolve,
              note: note,
              location: location,
              emit: emit,
            ),

        updateDate: (picked) => _onUpdateDate(picked, emit),

        updateLocation: (type, value) => _onUpdateLocation(type, value, emit),

        /// ===== OVERTIME =====
        toggleOvertime: (index, enabled) =>
            _onToggleOvertime(index, enabled, emit),

        addOvertimeSession: (index) => _onAddOvertimeSession(index, emit),

        removeOvertimeSession: (index, sessionIndex) =>
            _onRemoveOvertimeSession(index, sessionIndex, emit),

        updateOvertimeSession:
            (
              index,
              sessionIndex,
              timeStart,
              endTime,
              location,
              typeId,
              approvedId,
              overnight,
              reason,
            ) => _onUpdateOvertimeSession(
              index,
              sessionIndex,
              timeStart: timeStart,
              endTime: endTime,
              location: location,
              typeId: typeId,
              approvedId: approvedId,
              overnight: overnight,
              reason: reason,
              emit: emit,
            ),

        submitReport: (pickedDate) => _onSubmitReport(pickedDate, emit),

        updatePlanNextDay: (planNextDay) =>
            _onUpdatePlanNextDay(planNextDay, emit),
        sendMailReport: (pickedDate, context, shareText) =>
            _onSendMailReport(pickedDate, context, emit, shareText),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        selectReport: (dailyID) => _onSelectReport(dailyID, emit),

        loadDetailData: (dailyID) => _onLoadDetailData(dailyID, emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(dailyID, pickedDate, emit),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
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
        updateExtraInfo: (problem, problemSolve, backlog, note) =>
            _onUpdateExtraInfo(problem, problemSolve, backlog, note, emit),
        loadHistoryProblems: (projectItemId) =>
            _onLoadHistoryProblems(projectItemId, emit),
        clearAutoOpenOvertime: () => _onClearAutoOpenOvertime(emit),
        clearPendingProjectItemEdit: () => _onClearPendingProjectItemEdit(emit),
        recheckProjectItem: (projectItemId) =>
            _onRecheckProjectItem(projectItemId, emit),
      );
    }, transformer: (events, mapper) => events.asyncExpand(mapper));
  }

  // ================== HANDLERS ==================

  /// Tải các phát sinh của một hạng mục công việc.
  ///
  /// Kết quả được cache theo `projectItemId` nên mở/đóng card nhiều lần
  /// không gọi lại API. Bỏ qua khi đang tải hoặc đã có cache.
  Future<void> _onLoadHistoryProblems(
    int projectItemId,
    Emitter<TechState> emit,
  ) async {
    if (projectItemId <= 0) return;
    if (state.historyProblems.containsKey(projectItemId)) return;
    if (state.loadingHistoryProblemIds.contains(projectItemId)) return;

    emit(
      state.copyWith(
        loadingHistoryProblemIds: {
          ...state.loadingHistoryProblemIds,
          projectItemId,
        },
      ),
    );

    final res = await _reportRepo.getProjectHistoryProblemByProjectItem(
      projectItemId: projectItemId,
    );

    final loading = {...state.loadingHistoryProblemIds}..remove(projectItemId);

    res.fold(
      (l) {
        _log.logE('Get history problem failed: ${l.getErrorMessage}');
        emit(state.copyWith(loadingHistoryProblemIds: loading));
      },
      (problems) {
        emit(
          state.copyWith(
            loadingHistoryProblemIds: loading,
            historyProblems: {
              ...state.historyProblems,
              projectItemId: problems,
            },
          ),
        );
      },
    );
  }

  /// Reset tín hiệu tự mở bottom sheet làm thêm.
  Future<void> _onClearAutoOpenOvertime(Emitter<TechState> emit) async {
    if (state.autoOpenOvertimeIndex == null) return;
    emit(state.copyWith(autoOpenOvertimeIndex: null));
  }

  /// Reset tín hiệu chuyển sang màn chỉnh sửa hạng mục công việc.
  Future<void> _onClearPendingProjectItemEdit(Emitter<TechState> emit) async {
    if (state.pendingProjectItemEditId == null) return;
    emit(state.copyWith(pendingProjectItemEditId: null));
  }

  /// Kiểm tra lại một hạng mục công việc sau khi người dùng quay về từ màn
  /// chỉnh sửa hạng mục — cập nhật lại cờ "chưa đủ thông tin".
  Future<void> _onRecheckProjectItem(
    int projectItemId,
    Emitter<TechState> emit,
  ) async {
    if (projectItemId <= 0) return;

    final isIneligible = await _checkWorkItemEligibility(projectItemId);

    final ineligible = {...state.ineligibleProjectItemIds};
    if (isIneligible) {
      ineligible.add(projectItemId);
    } else {
      ineligible.remove(projectItemId);
    }

    emit(state.copyWith(ineligibleProjectItemIds: ineligible));
  }

  Future<void> _onUpdatePlanNextDay(
    String planNextDay,
    Emitter<TechState> emit,
  ) async {
    emit(state.copyWith(planNextDay: planNextDay));
  }

  Future<void> _onUpdateExtraInfo(
    String? problem,
    String? problemSolve,
    String? backlog,
    String? note,
    Emitter<TechState> emit,
  ) async {
    emit(
      state.copyWith(
        problem: problem ?? state.problem,
        problemSolve: problemSolve ?? state.problemSolve,
        backlog: backlog ?? state.backlog,
        note: note ?? state.note,
      ),
    );
  }

  Future<void> _loadDailyReport({
    required DateTime start,
    required DateTime end,
    required Emitter<TechState> emit,
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
        _log.logE('GetDailyReportTech failed: ${l.getErrorMessage}');
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

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<TechState> emit,
  ) async {
    final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
    final end = DateTime(dateEnd.year, dateEnd.month, dateEnd.day);

    emit(state.copyWith(status: BaseStateStatus.loading));

    await _loadDailyReport(start: start, end: end, emit: emit);
  }

  Future<void> _onInit(Emitter<TechState> emit) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        pendingMailDate: null,
        deleteSuccess: false,
        submitSuccess: false,
      ),
    );

    final userRes = await _authRepo.getCurrentUser();
    final departRes = await _reportRepo.getDepart();
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

        final now = DateTime.now();
        final startWeek = now.subtract(Duration(days: now.weekday - 1));
        final endWeek = startWeek.add(const Duration(days: 6));

        emit(
          state.copyWith(
            userId: user.id,
            fullName: user.fullName,
            departmentId: user.departmentId,
            teamId: user.teamOfUser,
            employeeID: user.employeeId,
            isProjectItemRequired: _requiredProjectItemDepartments.contains(
              user.departmentId,
            ),
            dateStart: DateTime(startWeek.year, startWeek.month, startWeek.day),
            dateEnd: DateTime(
              endWeek.year,
              endWeek.month,
              endWeek.day,
              23,
              59,
              59,
            ),
          ),
        );

        await _loadDailyReport(
          start: DateTime(startWeek.year, startWeek.month, startWeek.day),
          end: DateTime(endWeek.year, endWeek.month, endWeek.day, 23, 59, 59),
          emit: emit,
        );
      },
    );

    departRes.fold(
      (l) => _log.logE('Get depart failed: ${l.getErrorMessage}'),
      (r) => emit(state.copyWith(departs: r)),
    );

    projectRes.fold(
      (l) => _log.logE('Get project failed: ${l.getErrorMessage}'),
      (r) => emit(state.copyWith(rtcProject: r)),
    );
  }

  Future<void> _onInitAdd(
    List<CopyNullResponse> copyItems,
    List<ProjectResponse> rtcProject,
    Emitter<TechState> emit,
  ) async {
    // Luôn cần thông tin user (employeeID) để tải người duyệt mặc định
    // và ca làm thêm của ngày báo cáo.
    final userRes = await _authRepo.getCurrentUser();
    final user = userRes.getOrElse(() => null);

    // Luôn gọi API lấy danh sách dự án mới nhất — danh sách truyền từ màn
    // danh sách (`rtcProject`) chỉ là snapshot cũ, dùng nó sẽ làm mất dự án
    // vừa được tạo. Chỉ fallback về snapshot khi API lỗi.
    final projectRes = await _reportRepo.getProject();
    var projectList = projectRes.getOrElse(() => rtcProject);
    if (projectList.isEmpty) {
      projectList = rtcProject;
    }

    final departRes = await _reportRepo.getDepart();
    final departs = departRes.getOrElse(() => []);

    emit(
      state.copyWith(
        rtcProject: projectList,
        departs: departs,
        userId: user?.id,
        fullName: user?.fullName,
        departmentId: user?.departmentId,
        teamId: user?.teamOfUser,
        employeeID: user?.employeeId,
        isProjectItemRequired:
            user != null &&
            _requiredProjectItemDepartments.contains(user.departmentId),
      ),
    );

    if (copyItems.isEmpty) {
      add(const TechEvent.addEmptyProject());

      // Tải người duyệt mặc định + ca làm thêm của ngày báo cáo.
      await _loadOvertimeContext(DateTime.now(), emit);
      return;
    }

    emit(state.copyWith(status: BaseStateStatus.loading));

    final dateStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    List<TechProject> newProjects = [];
    var index = 1;

    final resolvedList = projectList;

    for (var copyItem in copyItems) {
      final apiProject = resolvedList
          .where((p) => p.projectCode == copyItem.projectCode)
          .firstOrNull;

      int? projectId;
      int projectItemId = 0;
      String pName = copyItem.projectName ?? '';

      String missionName = '';
      double percentComplete = 0.0;

      if (apiProject != null) {
        projectId = apiProject.id;
        pName = apiProject.projectName;

        final pitRes = await _reportRepo.getProjectItemByUser(
          projectId: projectId,
          status: -1,
        );
        final listPit = pitRes.getOrElse(() => []);

        final apiPit = listPit
            .where((pit) => pit.code == copyItem.projectItemCode)
            .firstOrNull;
        if (apiPit != null) {
          projectItemId = apiPit.id;
          missionName = apiPit.mission ?? '';
          percentComplete = apiPit.percentageActual ?? 0;
        }
      } else {
        pName = copyItem.projectCode ?? '${'report.project'.tr()} $index';
      }

      final work =
          TechWork.empty(
            code: copyItem.projectItemCode ?? '',
            projectId: projectId ?? 0,
            projectCode: copyItem.projectCode ?? '',
            projectName: pName,
            projectText: pName,
            userId: state.userId ?? 0,
            fullName: state.fullName ?? '',
            dateReport: dateStr,
            createdDate: DateTime.now(),
            projectItemId: projectItemId,
          ).copyWith(
            content: copyItem.mission ?? '',
            results: copyItem.results ?? '',
            backlog: copyItem.backlog,
            problem: copyItem.problem ?? '',
            problemSolve: copyItem.problemSolve ?? '',
            note: copyItem.note,
            mission: missionName,
            percentComplete: percentComplete,
          );

      final project = TechProject(
        tempId: const Uuid().v4(),
        projectId: projectId,
        projectCode: copyItem.projectCode ?? '...',
        name: pName,
        works: [work],
      );
      newProjects.add(project);
      index++;
    }

    emit(
      state.copyWith(
        projects: newProjects,
        selectedProject: newProjects.isNotEmpty ? newProjects.first : null,
        expandedWorkIndex: 0,
        status: BaseStateStatus.success,
        planNextDay: copyItems.isNotEmpty ? copyItems.first.planNextDay : '',
        problem: copyItems.isNotEmpty ? copyItems.first.problem : '',
        problemSolve: copyItems.isNotEmpty ? copyItems.first.problemSolve : '',
        note: copyItems.isNotEmpty ? copyItems.first.note : '',
        backlog: copyItems.isNotEmpty ? copyItems.first.backlog : '',
      ),
    );

    if (newProjects.isNotEmpty && newProjects.first.projectId != null) {
      final pitRes = await _reportRepo.getProjectItemByUser(
        projectId: newProjects.first.projectId!,
      );
      emit(state.copyWith(projectItem: pitRes.getOrElse(() => [])));
    }

    // Tải người duyệt mặc định + ca làm thêm của ngày báo cáo.
    await _loadOvertimeContext(DateTime.now(), emit);
  }
  // ================= PROJECT =================

  Future<void> _onAddEmptyProject(Emitter<TechState> emit) async {
    final projects = [...state.projects];
    final index = projects.length + 1;

    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    final emptyWork = TechWork.empty(
      code: '',
      projectId: 0,
      userId: state.userId ?? 0,
      fullName: state.fullName ?? '',
      dateReport: dateStr,
      createdDate: DateTime.now(),
      projectItemId: 0,
    );

    final newProject = TechProject(
      tempId: const Uuid().v4(),
      projectId: null,
      projectCode: '${'report.project'.tr()} $index',
      name: '${'report.project'.tr()} $index',
      works: [emptyWork],
    );

    emit(
      state.copyWith(
        projects: [...projects, newProject],
        selectedProject: newProject,
        expandedWorkIndex: 0,
      ),
    );
  }

  Future<void> _onRemoveProject(String tempId, Emitter<TechState> emit) async {
    final projects = state.projects.where((p) => p.tempId != tempId).toList();
    emit(
      state.copyWith(
        projects: projects,
        selectedProject: projects.isNotEmpty ? projects.first : null,
        expandedWorkIndex: null,
      ),
    );
  }

  Future<void> _onUpdateProjectName(
    String tempId,
    String newName,
    Emitter<TechState> emit,
  ) async {
    final projects = state.projects.map((p) {
      if (p.tempId == tempId) {
        return p.copyWith(name: newName);
      }
      return p;
    }).toList();

    final selected = state.selectedProject?.tempId == tempId
        ? state.selectedProject!.copyWith(name: newName)
        : state.selectedProject;

    TechProject? project;
    for (final p in state.projects) {
      if (p.tempId == tempId) {
        project = p;
        break;
      }
    }

    final reports = project?.projectId == null
        ? state.reports
        : state.reports.map((r) {
            if (r.id == project!.projectId) {
              return r.copyWith(projectName: newName);
            }
            return r;
          }).toList();

    emit(
      state.copyWith(
        projects: projects,
        reports: reports,
        selectedProject: selected,
      ),
    );
  }

  Future<void> _onSelectProject(String tempId, Emitter<TechState> emit) async {
    final project = state.projects.firstWhere((p) => p.tempId == tempId);

    final isSameProject = state.selectedProject?.tempId == tempId;

    if (isSameProject && state.projectItem.isNotEmpty) {
      emit(state.copyWith(selectedProject: project));
      emit(state.copyWith(selectedProject: project));
      return;
    }

    emit(state.copyWith(selectedProject: project, projectItem: const []));

    if (project.projectId == null) {
      return;
    }

    final res = await _reportRepo.getProjectItemByUser(
      projectId: project.projectId!,
    );

    await res.fold(
      (l) async {
        // _log.logE('Get project item failed: ${l.getErrorMessage}');
        emit(state.copyWith(projectItem: const []));
      },
      (r) async {
        emit(state.copyWith(projectItem: r));
      },
    );
  }

  Future<void> _onBindProjectFromApi(
    String tempId,
    ProjectResponse apiProject,
    Emitter<TechState> emit,
  ) async {
    final usedBackendIds = state.projects
        .where((p) => p.projectId != null)
        .map((p) => p.projectId)
        .toSet();

    if (usedBackendIds.contains(apiProject.id)) {
      return;
    }

    final projects = state.projects.map((p) {
      if (p.tempId == tempId) {
        return p.copyWith(
          projectId: apiProject.id,
          projectCode: apiProject.projectCode,
          name: apiProject.projectName,
          works: p.works
              .map(
                (w) => w.copyWith(
                  projectCode: apiProject.projectCode,
                  projectName: apiProject.projectName,
                  projectItemId: 0,
                  mission: '',
                  percentComplete: 0.0,
                ),
              )
              .toList(),
        );
      }
      return p;
    }).toList();

    final selected = projects.firstWhere((p) => p.tempId == tempId);

    emit(
      state.copyWith(
        projects: projects,
        selectedProject: selected,
        projectItem: const [],
        selectedProjectItem: null,
      ),
    );

    final res = await _reportRepo.getProjectItemByUser(
      projectId: apiProject.id,
    );

    await res.fold(
      (l) async {
        // _log.logE('Get project item failed: ${l.getErrorMessage}');
        emit(state.copyWith(projectItem: const []));
      },
      (r) async {
        emit(
          state.copyWith(
            projectItem: r,
            selectedProjectItem: r.isNotEmpty ? r.first : null,
          ),
        );
      },
    );
  }

  // ================= WORK =================

  /// Chuẩn hoá giờ hành chính khi thêm hạng mục mới.
  ///
  /// Theo spec, `TotalHours` là **giờ hành chính** và tổng trong ngày không
  /// được vượt quá `8.0` giờ → khi tổng vượt 8h thì chia tỉ lệ lại.
  List<TechWork> _normalizeWorkingHours(List<TechWork> works) {
    if (works.isEmpty) return works;

    final sumNormal = works.fold<double>(0, (s, w) => s + w.totalHours);

    if (sumNormal > 8) {
      final ratio = 8 / sumNormal;

      return works
          .map((w) => w.copyWith(totalHours: w.totalHours * ratio))
          .toList();
    }

    return works;
  }

  Future<void> _onAddWork(Emitter<TechState> emit) async {
    final project = state.selectedProject;
    if (project == null) return;

    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : '';

    TechProject? newSelectedProject;

    final newProjects = state.projects.map((p) {
      if (p.projectId == project.projectId) {
        final works = [
          ...p.works,
          TechWork.empty(
            code: '',
            projectId: p.projectId ?? 0,
            projectCode: p.projectCode ?? '',
            projectName: p.name ?? '',
            projectText: p.name ?? '',
            userId: state.userId ?? 0,
            fullName: state.fullName ?? '',
            dateReport: dateStr,
            createdDate: DateTime.now(),
            projectItemId: 0,
          ),
        ];
        final normalized = _normalizeWorkingHours(works);
        newSelectedProject = p.copyWith(works: normalized);
        return newSelectedProject!;
      }
      return p;
    }).toList();

    if (newSelectedProject == null) return;

    emit(
      state.copyWith(
        projects: newProjects,
        selectedProject: newSelectedProject,
        expandedWorkIndex: newSelectedProject!.works.length - 1,
      ),
    );
  }

  Future<void> _onRemoveWork(int index, Emitter<TechState> emit) async {
    final project = state.selectedProject;
    if (project == null) return;

    late TechProject newSelectedProject;

    final newProjects = state.projects.map((p) {
      if (p.tempId == project.tempId) {
        final newWorks = [...p.works];

        if (index < 0 || index >= newWorks.length) return p;

        newWorks.removeAt(index);

        newSelectedProject = p.copyWith(works: newWorks);
        return newSelectedProject;
      }
      return p;
    }).toList();

    emit(
      state.copyWith(
        projects: newProjects,
        selectedProject: newSelectedProject,
        expandedWorkIndex: null,
      ),
    );
  }

  Future<void> _onUpdateWork(
    int index, {
    double? totalHours,
    double? totalHourOT,
    double? percentComplete,
    String? content,
    String? results,
    String? mission,
    String? backlog,
    String? problem,
    String? problemSolve,
    String? note,
    int? projectItemId,
    String? dateReport,
    String? code,
    String? location,
    required Emitter<TechState> emit,
  }) async {
    final selected = state.selectedProject;
    if (selected == null) return;

    final newWorks = [...selected.works];
    if (index < 0 || index >= newWorks.length) return;

    final old = newWorks[index];

    // ✅ xác định projectItemId cuối cùng
    final effectiveProjectItemId = projectItemId ?? old.projectItemId;

    // ✅ tìm ProjectItemResponse tương ứng
    ProjectItemResponse? item;
    if (effectiveProjectItemId != null) {
      try {
        item = state.projectItem.firstWhere(
          (e) => e.id == effectiveProjectItemId,
        );
      } catch (_) {
        item = null;
      }
    }

    // ✅ xác định percentComplete cuối cùng
    double effectivePercent = old.percentComplete;

    if (percentComplete != null) {
      effectivePercent = percentComplete;
    } else if (projectItemId != null && projectItemId != old.projectItemId) {
      effectivePercent = item?.percentageActual ?? old.percentComplete;
    }

    newWorks[index] = old.copyWith(
      dateReport: dateReport ?? old.dateReport,
      totalHours: totalHours ?? old.totalHours,
      totalHourOT: totalHourOT ?? old.totalHourOT,
      percentComplete: effectivePercent,
      content: content ?? old.content,
      results: results ?? old.results,
      mission: mission ?? old.mission,
      backlog: backlog ?? old.backlog,
      problem: problem ?? old.problem,
      problemSolve: problemSolve ?? old.problemSolve,
      note: note ?? old.note,
      projectItemId: effectiveProjectItemId,
      code: code ?? old.code,
      location: location ?? old.location,
    );

    // Đổi hạng mục công việc → gắn lại các ca làm thêm tương ứng với hạng mục mới.
    int? autoOpenIndex;
    var ineligibleProjectItemId = 0;

    if (projectItemId != null && projectItemId != old.projectItemId) {
      final matched = state.dailyOvertimes
          .where(
            (ot) => ot.projectItemId == effectiveProjectItemId && !ot.isDeleted,
          )
          .toList();

      // Ca làm thêm mới tạo trên form (chưa lưu) → giữ lại, gắn sang hạng mục mới.
      final localSessions = old.overtimes
          .where((s) => s.id == 0)
          .map((s) => s.copyWith(projectItemId: effectiveProjectItemId ?? 0))
          .toList();

      final sessions = [...localSessions, ...matched];

      newWorks[index] = newWorks[index].copyWith(
        overtimes: sessions,
        hasOvertime: sessions.isNotEmpty,
        totalHourOT: _sumOvertimeHours(sessions),
      );

      // Hạng mục trùng với ca làm thêm đã đăng ký trước → tự tích "Có làm thêm"
      // và mở sheet để người dùng xem lại thông tin ca đã lấy từ API.
      if (matched.isNotEmpty) autoOpenIndex = index;

      // Hạng mục thiếu thông tin kế hoạch/actual → yêu cầu UI chuyển sang màn
      // chỉnh sửa hạng mục (Xem [_checkWorkItemEligibility]).
      if (effectiveProjectItemId != null && effectiveProjectItemId > 0) {
        final isIneligible = await _checkWorkItemEligibility(
          effectiveProjectItemId,
        );
        if (isIneligible) ineligibleProjectItemId = effectiveProjectItemId;
      }
    }

    // Cập nhật danh sách hạng mục không đủ thông tin theo kết quả vừa kiểm tra.
    final ineligible = {...state.ineligibleProjectItemIds};
    if (ineligibleProjectItemId > 0) {
      ineligible.add(ineligibleProjectItemId);
    } else if (projectItemId != null && projectItemId != old.projectItemId) {
      // Hạng mục mới đủ thông tin (hoặc không xác định) → bỏ cờ cũ.
      ineligible.remove(projectItemId);
    }

    emit(
      state.copyWith(
        projects: state.projects.map((p) {
          if (p.tempId == selected.tempId) {
            return p.copyWith(works: newWorks);
          }
          return p;
        }).toList(),
        selectedProject: selected.copyWith(works: newWorks),
        autoOpenOvertimeIndex: autoOpenIndex,
        ineligibleProjectItemIds: ineligible,
        pendingProjectItemEditId: ineligibleProjectItemId > 0
            ? ineligibleProjectItemId
            : null,
      ),
    );
  }

  Future<void> _onExpandWork(int index, Emitter<TechState> emit) async {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  /// Kiểm tra hạng mục công việc đã đủ thông tin để báo cáo hay chưa.
  ///
  /// BE trả về `false` khi hạng mục còn thiếu ngày kế hoạch / actual → người
  /// dùng phải cập nhật hạng mục trước khi được phép báo cáo.
  ///
  /// Trả về `true` nếu hạng mục **không** đủ thông tin, `false` nếu đủ hoặc
  /// không xác định được (fail-open).
  Future<bool> _checkWorkItemEligibility(int projectItemId) async {
    if (projectItemId <= 0) return false;

    final res = await _reportRepo.checkInformationReport(
      projectTaskId: projectItemId,
    );

    final bool? isEligible = res.fold((l) {
      _log.logE(
        'Check information report failed for projectItem $projectItemId: '
        '${l.getErrorMessage}',
      );
      return null;
    }, (data) => data);

    _log.logI(
      'check-information-report projectItem=$projectItemId '
      'eligible=$isEligible',
    );

    // Không xác định → fail-open, không chặn.
    if (isEligible == null) return false;
    return !isEligible;
  }

  /// Tìm `projectItemId` đầu tiên trong [projects] nằm trong danh sách
  /// [ineligibleProjectItemIds] (hạng mục thiếu ngày kế hoạch / actual).
  ///
  /// Trả về `null` nếu mọi hạng mục đều hợp lệ.
  int? _findIneligibleProjectItem(
    List<TechProject> projects,
    Set<int> ineligibleProjectItemIds,
  ) {
    if (ineligibleProjectItemIds.isEmpty) return null;

    for (final project in projects) {
      for (final work in project.works) {
        final projectItemId = work.projectItemId ?? 0;
        if (projectItemId > 0 &&
            ineligibleProjectItemIds.contains(projectItemId)) {
          return projectItemId;
        }
      }
    }

    return null;
  }

  /// Đổi ngày báo cáo → cập nhật ngày của các hạng mục + tải lại ca làm thêm.
  Future<void> _onUpdateDate(DateTime? picked, Emitter<TechState> emit) async {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);
    final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

    // Ngày báo cáo áp dụng cho mọi hạng mục của mọi dự án.
    final newProjects = state.projects
        .map(
          (p) => p.copyWith(
            works: p.works.map((w) => w.copyWith(dateReport: dateStr)).toList(),
          ),
        )
        .toList();

    final selected = state.selectedProject;
    final newSelected = selected == null
        ? null
        : newProjects.firstWhere(
            (p) => p.tempId == selected.tempId,
            orElse: () => selected,
          );

    emit(state.copyWith(projects: newProjects, selectedProject: newSelected));

    // Đổi ngày báo cáo → tải lại ca làm thêm đã đăng ký của ngày đó.
    await _loadOvertimeContext(safeDate, emit);
  }

  /// Cập nhật nơi làm việc.
  ///
  /// Với các lựa chọn cố định (Văn phòng / Nhà máy RTC / Tại nhà) thì
  /// `location` = chính text hiển thị. Với "Địa điểm công tác" thì `location`
  /// là địa chỉ do người dùng nhập, được lưu riêng ở `siteLocation` để
  /// không mất khi người dùng đổi lựa chọn rồi chọn lại.
  ///
  /// Đổi nơi làm việc → các ca làm thêm của hạng mục cũng đổi theo, để dữ
  /// liệu trong sheet khớp với nơi làm việc đang chọn.
  Future<void> _onUpdateLocation(
    String type,
    String? value,
    Emitter<TechState> emit,
  ) async {
    final siteLocation = type == TechLocation.site
        ? (value ?? state.siteLocation)
        : state.siteLocation;

    final location = type == TechLocation.site ? siteLocation : type;

    final overtimeLocation = TechLocation.overtimeLocationOf(type);

    final selected = state.selectedProject;
    if (selected == null) {
      emit(
        state.copyWith(
          locationType: type,
          siteLocation: siteLocation,
          location: location,
        ),
      );
      return;
    }

    // Đồng bộ địa điểm của các ca làm thêm theo nơi làm việc đang chọn.
    final works = selected.works.map((work) {
      if (work.overtimes.isEmpty) return work;

      final sessions = work.overtimes
          .map((s) => s.copyWith(location: overtimeLocation))
          .toList();

      return work.copyWith(overtimes: sessions);
    }).toList();

    emit(
      state.copyWith(
        locationType: type,
        siteLocation: siteLocation,
        location: location,
        projects: _replaceWorks(selected, works),
        selectedProject: selected.copyWith(works: works),
      ),
    );
  }

  // ================= OVERTIME (LÀM THÊM) =================

  /// Các phòng ban bắt buộc phải chọn Dự án + Hạng mục khi báo cáo kỹ thuật.
  static const _requiredProjectItemDepartments = [2, 9, 10, 23, 24, 25, 26, 27];

  /// Ngày báo cáo hiện tại (dùng làm mốc cho các rule của ca làm thêm).
  DateTime? get _currentReportDate {
    final reportDate = state.currentReportDate;
    if (reportDate != null) {
      return DateTime(reportDate.year, reportDate.month, reportDate.day);
    }
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// `true` khi ngày báo cáo nằm trong khoảng [hôm qua, hôm nay] — chỉ khi đó
  /// mới được tạo mới ca làm thêm (ca đã tồn tại vẫn xem/sửa được).
  bool _canCreateNewOvertimeOn(DateTime reportDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final day = DateTime(reportDate.year, reportDate.month, reportDate.day);

    return day == today || day == yesterday;
  }

  /// Lấy danh sách ca làm thêm đã đăng ký trong ngày và người duyệt mặc định.
  ///
  /// Gọi khi khởi tạo form tạo mới / sửa báo cáo, và mỗi khi ngày báo cáo đổi.
  Future<void> _loadOvertimeContext(
    DateTime reportDate,
    Emitter<TechState> emit,
  ) async {
    final employeeId = state.employeeID;

    var overtimes = <OvertimeSession>[];
    if (employeeId != null && employeeId > 0) {
      final res = await _reportRepo.getOvertimeByDate(
        dateRegister: reportDate,
        employeeId: employeeId,
      );
      overtimes = res.getOrElse(() => []).map(OvertimeSession.fromApi).toList();
    }

    var approveId = state.defaultApproveId;
    if (employeeId != null && employeeId > 0 && approveId == null) {
      final approveRes = await _overtimeRepo.getFillApprover(
        employeeID: employeeId,
        tableName: 'EmployeeOvertime',
      );
      approveId = approveRes
          .getOrElse(() => const FillApproverItem(approveId: 0))
          .approveId;
    }

    // Danh sách người duyệt để chọn trong bottom sheet khai báo ca làm thêm.
    var approvers = state.approvers;
    if (approvers.isEmpty) {
      final approverRes = await _overtimeRepo.getApprover();
      approvers = approverRes.getOrElse(() => const []);
    }

    // Danh sách loại làm thêm.
    var overtimeTypes = state.overtimeTypes;
    if (overtimeTypes.isEmpty) {
      final typeRes = await _overtimeRepo.getOvertimeType();
      overtimeTypes = typeRes.getOrElse(() => const []);
    }

    emit(
      state.copyWith(
        dailyOvertimes: overtimes,
        defaultApproveId: approveId,
        approvers: approvers,
        overtimeTypes: overtimeTypes,
        currentReportDate: DateTime(
          reportDate.year,
          reportDate.month,
          reportDate.day,
        ),
      ),
    );

    // Gắn các ca làm thêm đã đăng ký vào đúng hạng mục công việc tương ứng.
    _syncOvertimesToWorks(emit);
  }

  /// Gắn lại các ca làm thêm trong cache vào từng hạng mục công việc theo `ProjectItemID`.
  void _syncOvertimesToWorks(Emitter<TechState> emit) {
    final projects = state.projects.map((project) {
      return project.copyWith(
        works: project.works.map((work) {
          final matched = state.dailyOvertimes
              .where(
                (ot) =>
                    ot.projectItemId == work.projectItemId &&
                    work.projectItemId != 0 &&
                    !ot.isDeleted,
              )
              .toList();

          return work.copyWith(
            overtimes: matched,
            hasOvertime: matched.isNotEmpty,
            totalHourOT: _sumOvertimeHours(matched),
          );
        }).toList(),
      );
    }).toList();

    emit(
      state.copyWith(
        projects: projects,
        selectedProject: state.selectedProject == null
            ? null
            : projects.firstWhere(
                (p) => p.tempId == state.selectedProject!.tempId,
                orElse: () => state.selectedProject!,
              ),
      ),
    );
  }

  /// Tổng số giờ làm thêm của một danh sách ca làm thêm.
  double _sumOvertimeHours(List<OvertimeSession> sessions) {
    return sessions
        .where((s) => !s.isDeleted)
        .fold<double>(0, (sum, s) => sum + s.timeReality);
  }

  /// Bật/tắt khai báo làm thêm cho một hạng mục công việc.
  ///
  /// - Bật: luôn đảm bảo có ít nhất 1 phiếu làm thêm (tự tạo nếu chưa có).
  /// - Tắt: xoá toàn bộ phiếu làm thêm khỏi form, chỉ thao tác trên UI
  ///   (không gửi yêu cầu xoá lên BE).
  Future<void> _onToggleOvertime(
    int index,
    bool enabled,
    Emitter<TechState> emit,
  ) async {
    final selected = state.selectedProject;
    if (selected == null) return;
    if (index < 0 || index >= selected.works.length) return;

    final works = [...selected.works];
    final work = works[index];

    if (!enabled) {
      // Tắt → xoá toàn bộ phiếu làm thêm khỏi form.
      // Chỉ thao tác trên UI, không gửi yêu cầu xoá nào lên BE.
      final removedIds = work.overtimes
          .map((s) => s.id)
          .where((id) => id > 0)
          .toSet();

      // Ca đã tồn tại trên DB → đánh dấu xoá mềm để BE dọn khi lưu báo cáo.
      final deleted = [...state.deletedOvertimes];
      for (final session in work.overtimes) {
        if (session.id > 0) {
          deleted.add(session.copyWith(isDeleted: true));
        }
      }

      works[index] = work.copyWith(
        hasOvertime: false,
        overtimes: const [],
        totalHourOT: 0,
      );

      emit(
        state.copyWith(
          projects: _replaceWorks(selected, works),
          selectedProject: selected.copyWith(works: works),
          deletedOvertimes: deleted,
          dailyOvertimes: state.dailyOvertimes
              .where((ot) => !removedIds.contains(ot.id))
              .toList(),
        ),
      );
      return;
    }

    // Bật → luôn hiển thị ít nhất 1 phiếu làm thêm.
    // Ca mới chỉ được tạo khi ngày báo cáo nằm trong [hôm qua, hôm nay]
    // (đúng rule khai báo ca làm thêm) — nếu không thì giữ nguyên danh sách rỗng.
    final canCreateNew = _canCreateNewOvertimeOn(
      _currentReportDate ?? DateTime.now(),
    );

    final List<OvertimeSession> sessions;
    if (work.overtimes.isNotEmpty) {
      sessions = work.overtimes;
    } else if (canCreateNew) {
      sessions = [_buildNewOvertimeSession(selected, work, shiftIndex: 0)];
    } else {
      sessions = [];
    }

    works[index] = work.copyWith(
      hasOvertime: sessions.isNotEmpty,
      overtimes: sessions,
      totalHourOT: _sumOvertimeHours(sessions),
    );

    emit(
      state.copyWith(
        projects: _replaceWorks(selected, works),
        selectedProject: selected.copyWith(works: works),
      ),
    );
  }

  /// Thay thế danh sách works của project đang chọn trong `state.projects`.
  List<TechProject> _replaceWorks(TechProject selected, List<TechWork> works) {
    return state.projects
        .map((p) => p.tempId == selected.tempId ? p.copyWith(works: works) : p)
        .toList();
  }

  /// Tạo một phiếu làm thêm mới (chưa lưu) gắn với hạng mục công việc.
  ///
  /// [shiftIndex] là thứ tự ca (0 = Ca 1) — quyết định khung giờ mặc định.
  /// [previous] là ca làm thêm liền trước (nếu có) — dùng làm mốc giờ bắt đầu
  /// của Ca 3. Khung giờ luôn nằm trong ngày báo cáo (18:00 - 23:59).
  OvertimeSession _buildNewOvertimeSession(
    TechProject project,
    TechWork work, {
    int shiftIndex = 0,
    OvertimeSession? previous,
  }) {
    final reportDate = _currentReportDate ?? DateTime.now();
    final dayStart = DateTime(
      reportDate.year,
      reportDate.month,
      reportDate.day,
    );

    final (timeStart, endTime) = _defaultShiftTimes(
      dayStart: dayStart,
      shiftIndex: shiftIndex,
      previous: previous,
    );

    return OvertimeSession.newSession(
      employeeId: state.employeeID ?? 0,
      approvedId: state.defaultApproveId ?? 0,
      dateRegister: dayStart,
      projectId: project.projectId ?? 0,
      projectItemId: work.projectItemId ?? 0,
      timeStart: timeStart,
      endTime: endTime,
      // Địa điểm mặc định theo nơi làm việc đang chọn ở màn báo cáo.
      location: TechLocation.overtimeLocationOf(state.locationType),
      // Ca 1 (bắt đầu 18:00) mặc định có phụ cấp ăn tối.
      overnight: shiftIndex == 0,
    );
  }

  /// Khung giờ mặc định cho ca làm thêm mới.
  ///
  /// - Ca 1: `18:00` → thời điểm hiện tại (`DateTime.now`).
  /// - Ca 2: thời điểm hiện tại → hiện tại + 2 giờ.
  /// - Ca 3: giờ kết thúc Ca 2 → `23:59`.
  ///
  /// Ca làm thêm có thể kéo sang rạng sáng hôm sau (VD tới 1h30) nhưng vẫn
  /// thuộc báo cáo của ngày báo cáo → khi đang làm tiếp sau nửa đêm, mốc
  /// "hiện tại" được chiếu sang ngày kế tiếp.
  (DateTime, DateTime) _defaultShiftTimes({
    required DateTime dayStart,
    required int shiftIndex,
    OvertimeSession? previous,
  }) {
    final dayEnd = dayStart.add(const Duration(hours: 23, minutes: 59));
    final shift1Start = dayStart.add(const Duration(hours: 18));
    final windowEnd = dayStart.add(
      const Duration(days: 1, hours: OvertimeSession.maxOvertimeOverflowHours),
    );
    final nextDay = dayStart.add(const Duration(days: 1));

    final now = DateTime.now();
    var anchor = DateTime(
      dayStart.year,
      dayStart.month,
      dayStart.day,
      now.hour,
      now.minute,
    );

    // Đang làm tiếp sang rạng sáng hôm sau (báo cáo cho hôm qua) → mốc
    // "hiện tại" lấy theo ngày kế tiếp.
    if (!now.isBefore(nextDay) && !now.isAfter(windowEnd)) {
      anchor = DateTime(
        nextDay.year,
        nextDay.month,
        nextDay.day,
        now.hour,
        now.minute,
      );
    }
    if (anchor.isBefore(shift1Start)) anchor = shift1Start;
    if (anchor.isAfter(windowEnd)) anchor = windowEnd;

    DateTime start;
    DateTime end;

    if (shiftIndex <= 0) {
      // Ca 1: 18:00 → hiện tại; nếu chưa qua 18:00 thì mặc định 1 giờ.
      start = shift1Start;
      end = anchor.isAfter(shift1Start)
          ? anchor
          : shift1Start.add(const Duration(hours: 1));
    } else if (shiftIndex == 1) {
      // Ca 2: hiện tại → hiện tại + 2 giờ.
      start = anchor;
      end = anchor.add(const Duration(hours: 2));
    } else {
      // Ca 3: lấy giờ kết thúc Ca 2 làm giờ bắt đầu, kết thúc 23:59 — hoặc
      // hết khung giờ khi Ca 2 đã kéo sang rạng sáng hôm sau.
      start = previous?.endTime ?? anchor.add(const Duration(hours: 2));
      end = dayEnd.isAfter(start) ? dayEnd : windowEnd;
    }

    // Không cho ca vượt quá khung giờ cho phép.
    if (end.isAfter(windowEnd)) end = windowEnd;

    // Đảm bảo ca luôn có khoảng thời gian dương.
    if (!end.isAfter(start)) {
      end = windowEnd;
      start = windowEnd.subtract(const Duration(hours: 1));
    }

    return (start, end);
  }

  Future<void> _onAddOvertimeSession(int index, Emitter<TechState> emit) async {
    final selected = state.selectedProject;
    if (selected == null) return;
    if (index < 0 || index >= selected.works.length) return;

    final works = [...selected.works];
    final work = works[index];

    // Tối đa 3 ca làm thêm/ngày — vượt quá thì không tạo thêm ca mới.
    if (work.overtimes.length >= OvertimeSession.maxShifts) return;

    final sessions = [
      ...work.overtimes,
      _buildNewOvertimeSession(
        selected,
        work,
        shiftIndex: work.overtimes.length,
        previous: work.overtimes.isNotEmpty ? work.overtimes.last : null,
      ),
    ];
    works[index] = work.copyWith(
      hasOvertime: true,
      overtimes: sessions,
      totalHourOT: _sumOvertimeHours(sessions),
    );

    emit(
      state.copyWith(
        projects: _replaceWorks(selected, works),
        selectedProject: selected.copyWith(works: works),
      ),
    );
  }

  Future<void> _onRemoveOvertimeSession(
    int index,
    int sessionIndex,
    Emitter<TechState> emit,
  ) async {
    final selected = state.selectedProject;
    if (selected == null) return;
    if (index < 0 || index >= selected.works.length) return;

    final works = [...selected.works];
    final work = works[index];
    if (sessionIndex < 0 || sessionIndex >= work.overtimes.length) return;

    final removed = work.overtimes[sessionIndex];
    final sessions = [...work.overtimes]..removeAt(sessionIndex);

    // Ca làm thêm đã tồn tại trên DB → đánh dấu xoá mềm để BE dọn cả 2 bảng.
    final deleted = [...state.deletedOvertimes];
    if (removed.id > 0) {
      deleted.add(removed.copyWith(isDeleted: true));
    }

    final dailyOvertimes = removed.id > 0
        ? state.dailyOvertimes.where((ot) => ot.id != removed.id).toList()
        : state.dailyOvertimes;

    // Xoá hết ca làm thêm → bỏ luôn trạng thái "Có làm thêm" để checkbox tự bỏ tick.
    works[index] = work.copyWith(
      hasOvertime: sessions.isNotEmpty,
      overtimes: sessions,
      totalHourOT: _sumOvertimeHours(sessions),
    );

    emit(
      state.copyWith(
        projects: _replaceWorks(selected, works),
        selectedProject: selected.copyWith(works: works),
        deletedOvertimes: deleted,
        dailyOvertimes: dailyOvertimes,
      ),
    );
  }

  Future<void> _onUpdateOvertimeSession(
    int index,
    int sessionIndex, {
    DateTime? timeStart,
    DateTime? endTime,
    int? location,
    int? typeId,
    int? approvedId,
    bool? overnight,
    String? reason,
    required Emitter<TechState> emit,
  }) async {
    final selected = state.selectedProject;
    if (selected == null) return;
    if (index < 0 || index >= selected.works.length) return;

    final works = [...selected.works];
    final work = works[index];
    if (sessionIndex < 0 || sessionIndex >= work.overtimes.length) return;

    final sessions = [...work.overtimes];
    final old = sessions[sessionIndex];

    final newStart = timeStart ?? old.timeStart;
    final newEnd = endTime ?? old.endTime;

    // Tự tính lại số giờ thực tế mỗi khi giờ bắt đầu/kết thúc thay đổi.
    final computed = OvertimeSession.computeHours(newStart, newEnd);

    // Ca 18:00 - 20:00 mặc định được tích phụ cấp ăn tối.
    // Chỉ tự động áp dụng khi khung giờ thay đổi — không ghi đè lựa chọn
    // thủ công của người dùng khi họ bỏ tick ở các lần cập nhật khác.
    final timeChanged = timeStart != null || endTime != null;
    final newOvernight =
        overnight ??
        (timeChanged && OvertimeSession.isDinnerShift(newStart, newEnd)
            ? true
            : old.overnight);

    sessions[sessionIndex] = old.copyWith(
      timeStart: newStart,
      endTime: newEnd,
      timeReality: computed ?? old.timeReality,
      location: location ?? old.location,
      typeId: typeId ?? old.typeId,
      approvedId: approvedId ?? old.approvedId,
      overnight: newOvernight,
      costOvernight: newOvernight ? 30000 : 0,
      reason: reason ?? old.reason,
    );

    works[index] = work.copyWith(
      overtimes: sessions,
      totalHourOT: _sumOvertimeHours(sessions),
    );

    // Đồng bộ lại cache ca làm thêm để không bị ghi đè khi đổi hạng mục.
    // Chỉ bản ghi đã tồn tại trên DB (id > 0) mới có trong `dailyOvertimes`;
    // ca mới (id = 0) không được map theo id vì nhiều ca mới cùng id = 0.
    final dailyOvertimes = old.id > 0
        ? state.dailyOvertimes
              .map((ot) => ot.id == old.id ? sessions[sessionIndex] : ot)
              .toList()
        : state.dailyOvertimes;

    emit(
      state.copyWith(
        projects: _replaceWorks(selected, works),
        selectedProject: selected.copyWith(works: works),
        dailyOvertimes: dailyOvertimes,
      ),
    );
  }

  bool _isSubmittingReport = false;

  /// Kiểm tra các quy tắc nghiệp vụ trước khi gửi báo cáo + ca làm thêm.
  ///
  /// Trả về thông báo lỗi (đã kèm tiền tố "Công việc N:") hoặc `null` nếu hợp lệ.
  String? _validateBeforeSubmit({
    required DateTime reportDate,
    required List<TechProject> projects,
    required Set<int> ineligibleProjectItemIds,
  }) {
    // 1) Phòng ban kỹ thuật bắt buộc chọn Dự án + Hạng mục.
    final isRequired = state.isProjectItemRequired;

    for (var pIndex = 0; pIndex < projects.length; pIndex++) {
      final project = projects[pIndex];

      if (isRequired && (project.projectId ?? 0) <= 0) {
        return 'Dự án ${pIndex + 1}: Vui lòng chọn dự án';
      }

      for (var wIndex = 0; wIndex < project.works.length; wIndex++) {
        final work = project.works[wIndex];
        final prefix = 'Công việc ${wIndex + 1}: ';

        if (isRequired && (work.projectItemId ?? 0) <= 0) {
          return '${prefix}Vui lòng chọn hạng mục công việc';
        }

        // Hạng mục chưa đủ thông tin (thiếu ngày kế hoạch / actual).
        if ((work.projectItemId ?? 0) > 0 &&
            ineligibleProjectItemIds.contains(work.projectItemId)) {
          return '${prefix}Hạng mục chưa đủ thông tin, '
              'vui lòng cập nhật hạng mục trước khi báo cáo';
        }

        // 2) Giờ hành chính: 0 <= TotalHours <= 8.0
        if (work.totalHours < 0 || work.totalHours > 8.0) {
          return '${prefix}Tổng số giờ phải từ 0 đến 8 giờ';
        }

        // 2.1) Tiến độ phải lớn hơn 0% (không được gửi báo cáo chưa có tiến độ).
        if (work.percentComplete <= 0) {
          return '${prefix}Tiến độ phải lớn hơn 0%';
        }
        if (work.percentComplete > 100) {
          return '${prefix}% Hoàn thành phải từ 0 đến 100';
        }

        // 3) Ca làm thêm mới chỉ được tạo cho [hôm qua, hôm nay].
        final hasNewSession = work.overtimes.any((s) => s.id == 0);
        if (hasNewSession && !_canCreateNewOvertimeOn(reportDate)) {
          return '${prefix}Chỉ được đăng ký làm thêm cho hôm nay hoặc hôm qua';
        }

        for (final session in work.overtimes) {
          final sessionErr = _validateOvertimeSession(
            session: session,
            reportDate: reportDate,
          );
          if (sessionErr != null) {
            return '${prefix}$sessionErr';
          }
        }
      }
    }

    // 4) Tổng giờ hành chính trong ngày <= 8.0
    final totalNormalHours = projects
        .expand((p) => p.works)
        .fold<double>(0, (sum, w) => sum + w.totalHours);
    if (totalNormalHours > 8.0) {
      return 'Tổng giờ hành chính trong ngày không được lớn hơn 8h';
    }

    // 5) Chống trùng giờ giữa các ca làm thêm trên toàn bộ form.
    final allSessions = projects
        .expand((p) => p.works)
        .expand((w) => w.overtimes)
        .where((s) => !s.isDeleted && s.timeStart != null && s.endTime != null)
        .toList();

    for (var i = 0; i < allSessions.length; i++) {
      for (var j = i + 1; j < allSessions.length; j++) {
        final a = allSessions[i];
        final b = allSessions[j];
        if (a.timeStart!.isBefore(b.endTime!) &&
            b.timeStart!.isBefore(a.endTime!)) {
          return 'Ca làm thêm ${i + 1} và ${j + 1} bị trùng thời gian';
        }
      }
    }

    return null;
  }

  /// Validate một ca làm thêm đơn lẻ.
  String? _validateOvertimeSession({
    required OvertimeSession session,
    required DateTime reportDate,
  }) {
    return OvertimeSession.validate(session, reportDate: reportDate);
  }

  /// Gom toàn bộ ca làm thêm (đang có + đã xoá mềm) để gửi lên BE.
  List<Map<String, dynamic>> _buildOvertimePayloads(
    List<TechProject> projects,
  ) {
    final payloads = <Map<String, dynamic>>[];

    for (final project in projects) {
      for (final work in project.works) {
        for (final session in work.overtimes) {
          if (session.isDeleted) continue;
          payloads.add(session.toPayload());
        }
      }
    }

    for (final deleted in state.deletedOvertimes) {
      payloads.add(deleted.toDeletePayload());
    }

    return payloads;
  }

  /// Dựng nội dung trường `Problem` khi lưu báo cáo.
  ///
  /// - Hạng mục có phát sinh → ghép theo format của bản PC:
  ///   `- Phát sinh {stt}: {nội dung} [{trạng thái}]` (mỗi phát sinh một dòng),
  ///   đặt trước nội dung người dùng nhập.
  /// - Hạng mục không có phát sinh → giữ nội dung người dùng nhập ở ô
  ///   "Vấn đề phát sinh" như hiện tại.
  ///
  /// Các dòng phát sinh đã có trong [userProblem] được bỏ qua để không ghép
  /// trùng khi sửa lại một báo cáo đã lưu.
  String _buildProblemText(int? projectItemId, String userProblem) {
    final problems = projectItemId == null
        ? null
        : state.historyProblems[projectItemId];

    if (problems == null || problems.isEmpty) return userProblem;

    final lines = <String>[];
    for (var i = 0; i < problems.length; i++) {
      final problem = problems[i];
      final content = (problem.contentError ?? '').trim();
      if (content.isEmpty) continue;

      final line =
          '- Phát sinh ${i + 1}: $content '
          '[${TechProblemStatus.label(problem.statusProblem)}]';

      if (userProblem.contains(line)) continue;

      lines.add(line);
    }

    if (lines.isEmpty) return userProblem;

    final combined = lines.join('\n');
    final userText = userProblem.trim();
    if (userText.isEmpty) return combined;

    return '$combined\n$userText';
  }

  Future<void> _onSubmitReport(
    DateTime pickedDate,
    Emitter<TechState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      // Reset message cũ để listener nhận được message mới kể cả khi trùng nội dung.
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      final projects = state.projects;

      if (projects.isEmpty) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final List<TechProject> submitProjects;

      if (projects.length == 1) {
        final selected = state.selectedProject ?? projects.first;
        submitProjects = [selected];
      } else {
        submitProjects = projects;
      }

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      // ===== VALIDATION GATE =====
      final validationError = _validateBeforeSubmit(
        reportDate: safeDate,
        projects: submitProjects,
        ineligibleProjectItemIds: state.ineligibleProjectItemIds,
      );

      // Hạng mục chưa đủ thông tin → chuyển thẳng sang màn chỉnh sửa hạng mục
      // thay vì chỉ báo lỗi, để người dùng bổ sung ngay.
      final blockedProjectItemId = _findIneligibleProjectItem(
        submitProjects,
        state.ineligibleProjectItemIds,
      );
      if (blockedProjectItemId != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            pendingProjectItemEditId: blockedProjectItemId,
            message:
                'Hạng mục chưa đủ thông tin, vui lòng cập nhật hạng mục '
                'trước khi báo cáo',
          ),
        );
        return;
      }

      if (validationError != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: validationError,
          ),
        );
        return;
      }

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      // ===== STEP 1: Lưu báo cáo công việc (mảng các hạng mục) =====
      final reportPayloads = <Map<String, dynamic>>[];

      for (final project in submitProjects) {
        for (final work in project.works) {
          reportPayloads.add({
            'ID': 0,
            'MasterID': 0,
            'UserReport': userId,
            'DateReport': dateStr,
            'ProjectID': project.projectId,
            'ProjectItemID': work.projectItemId,
            'Content': work.content,
            'Results': work.results,
            'Problem': _buildProblemText(
              work.projectItemId,
              state.problem ?? '',
            ),
            'ProblemSolve': state.problemSolve ?? '',
            'PlanNextDay': state.planNextDay,
            'Note': state.note ?? '',
            'Backlog': state.backlog ?? '',
            'TotalHours': work.totalHours,
            'TotalHourOT': _sumOvertimeHours(work.overtimes),
            'PercentComplete': work.percentComplete.toInt(),
            'Location': TechLocation.toApiValue(state.location),
            'Type': 0,
            'ReportLate': 0,
            'StatusResult': 0,
            'WorkPlanDetailID': 0,
            'OldProjectID': 0,
            'DeleteFlag': 0,
            'Confirm': false,
          });
        }
      }

      final saveRes = await _reportRepo.saveReportTech(payload: reportPayloads);

      // ===== STEP 1: Lưu báo cáo công việc =====
      // Lấy đúng message do BE trả về để hiển thị cho người dùng.
      final reportError = saveRes.fold<String?>((l) => l.getErrorMessage, (
        ids,
      ) {
        // BE trả về status==1 nhưng data rỗng → coi như lỗi.
        if (ids.isEmpty || ids.every((id) => id <= 0)) {
          return 'Lưu dữ liệu thất bại. Vui lòng báo cáo lại';
        }
        return null;
      });

      // Lưu báo cáo lỗi → dừng ngay, KHÔNG chạy save-overtime.
      if (reportError != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: reportError,
          ),
        );
        return;
      }

      // ===== STEP 2: Đồng bộ ca làm thêm kèm liên kết hạng mục =====
      // Chỉ chạy khi báo cáo đã lưu thành công; lỗi thì báo đúng message của BE.
      final overtimeError = await _syncOvertimeTech(submitProjects);
      if (overtimeError != null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: overtimeError,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          // Xoá lỗi cũ để listener không hiển thị lại snackbar lỗi khi thành công.
          message: null,
          pendingMailDate: safeDate,
          pendingShareText: DialogService.buildMailPreviewText(state, safeDate),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Báo cáo thất bại. Vui lòng thử lại',
        ),
      );
      _log.logE('Submit report tech failed: $e');
    } finally {
      _isSubmittingReport = false;
    }
  }

  /// Đồng bộ danh sách ca làm thêm sau khi báo cáo đã lưu thành công.
  ///
  /// [projects] là các dự án vừa gửi báo cáo; ca làm thêm lấy từ toàn bộ
  /// hạng mục của chúng kèm các ca đã xoá (`deletedOvertimes`).
  ///
  /// Trả về `null` nếu thành công hoặc không có ca nào cần lưu, ngược lại trả
  /// về message lỗi do BE trả về để hiển thị nguyên văn cho người dùng.
  Future<String?> _syncOvertimeTech(List<TechProject> projects) async {
    final overtimePayloads = _buildOvertimePayloads(projects);
    if (overtimePayloads.isEmpty) return null;

    final res = await _reportRepo.saveOvertimeTech(
      payload: {
        'EmployeeOvertimes': overtimePayloads,
        'employeeOvertimeFile': {
          'ID': 0,
          'EmployeeOvertimeID': 0,
          'FileName': null,
          'OriginPath': null,
          'ServerPath': null,
        },
      },
    );

    return res.fold((l) => l.getErrorMessage, (_) => null);
  }

  Future<void> _onSendMailReport(
    DateTime pickedDate,
    BuildContext context,
    Emitter<TechState> emit,
    String? shareText,
  ) async {
    try {
      emit(state.copyWith(isSubmitting: true, sendMailSuccess: false));

      // Ưu tiên dùng shareText đã lưu trước khi init(), fallback build từ state
      final body =
          shareText ?? DialogService.buildMailPreviewText(state, pickedDate);

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      final payload = SendMailRequestModel(body: body, dateReport: dateStr);

      final res = await _reportRepo.sendMailReport(request: payload);

      await res.fold(
        (l) async {
          emit(
            state.copyWith(
              isSubmitting: false,
              sendMailSuccess: false,
              message: l.getErrorMessage,
            ),
          );
          // _log.logE('❌ Send mail failed: ${l.getErrorMessage}');
        },
        (r) async {
          emit(state.copyWith(isSubmitting: false, sendMailSuccess: true));

          // Copy + share sau khi send mail thành công
          if (shareText != null) {
            await Clipboard.setData(ClipboardData(text: shareText));
          }

          await Future.delayed(const Duration(milliseconds: 500));

          // Reset flags TRONG BLOC — tránh snackbar "Xóa báo cáo" bị fire lại từ listener
          emit(
            state.copyWith(
              sendMailSuccess: false,
              deleteSuccess: false,
              submitSuccess: false,
              saveSuccess: false,
              pendingMailDate: null,
              pendingShareText: null,
              message: null,
              isSubmitting: false,
              isSaving: false,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
    }
  }

  Future<void> _onResetSubmitFlags(Emitter<TechState> emit) async {
    emit(
      state.copyWith(
        submitSuccess: false,
        saveSuccess: false,
        sendMailSuccess: false,
        deleteSuccess: false,
        pendingMailDate: null,
        pendingShareText: null,
        message: null,
        isSubmitting: false,
        isSaving: false,
      ),
    );
  }

  Future<void> _onSelectReport(int dailyID, Emitter<TechState> emit) async {
    emit(state.copyWith(isLoadingDetail: true));

    final res = await _reportRepo.getById(dailyID: dailyID);

    await res.fold(
      (l) async {
        _log.logE('Get detail failed: ${l.getErrorMessage}');
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

  Future<void> _onLoadDetailData(int dailyID, Emitter<TechState> emit) async {
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
        final projectList = projectRes.getOrElse(() => []);

        final apiProject = projectList
            .where((p) => p.id == detail.projectId)
            .firstOrNull;

        if (apiProject == null) {
          emit(state.copyWith(isLoadingDetail: false));
          return;
        }

        final projectItemRes = await _reportRepo.getProjectItemByUser(
          projectId: apiProject.id,
          // Detail cần map ngược projectItemId (kể cả hạng mục đã 100%),
          // nên load tất cả với status = -1. List mặc định status = 2
          // sẽ lọc mất item 100% (VD: ID 44737) khiến code/mission rỗng.
          status: -1,
        );

        final projectItems = projectItemRes.getOrElse(() => []);

        final matchedItem = projectItems
            .where((e) => e.id == detail.projectItemId)
            .firstOrNull;

        final work = TechWork.fromDetailReportResponse(
          detail,
          code: matchedItem?.code ?? '',
          mission: matchedItem?.mission ?? '',
          fullName: user?.fullName ?? '',
          positionName: user?.positionName ?? '',
          projectItemCode: matchedItem?.code ?? '',
        );

        final project = TechProject(
          tempId: 'project_${detail.projectId}',
          projectId: apiProject.id,
          name: apiProject.projectName,
          projectCode: apiProject.projectCode,
          works: [work],
        );

        final rawLocation = detail.location.trim();
        final locationType = TechLocation.resolve(rawLocation);

        emit(
          state.copyWith(
            isLoadingDetail: false,
            rtcProject: projectList,
            projectItem: projectItems,
            projects: [project],
            selectedProject: project,
            // ✅ location bind chuẩn
            locationType: locationType,
            siteLocation: locationType == TechLocation.site
                ? rawLocation
                : state.siteLocation,
            location: locationType == TechLocation.site
                ? rawLocation
                : locationType,
            planNextDay: detail.planNextDay,
            problem: detail.problem,
            problemSolve: detail.problemSolve,
            backlog: detail.backlog,
            note: detail.note,
            dateReport: DateTime.tryParse(detail.dateReport),
            expandedWorkIndex: 0,
            employeeID: user?.employeeId,
            isProjectItemRequired:
                user != null &&
                _requiredProjectItemDepartments.contains(user.departmentId),
          ),
        );

        // Tải ca làm thêm của ngày báo cáo để gắn vào hạng mục tương ứng.
        final reportDate = DateTime.tryParse(detail.dateReport);
        if (reportDate != null) {
          await _loadOvertimeContext(
            DateTime(reportDate.year, reportDate.month, reportDate.day),
            emit,
          );
        }
      },
    );
  }

  bool _isSavingReport = false;

  Future<void> _onSubmitEditReport(
    int dailyID,
    DateTime pickedDate,
    Emitter<TechState> emit,
  ) async {
    if (_isSavingReport) return;
    _isSavingReport = true;

    try {
      emit(
        state.copyWith(
          isSaving: true,
          saveSuccess: false,
          submitSuccess: false,
          // Reset message cũ để listener nhận message mới kể cả khi trùng nội dung.
          message: null,
        ),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      final selectedProject = state.selectedProject;
      if (selectedProject == null || selectedProject.works.isEmpty) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final work = selectedProject.works.first;

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      // ===== VALIDATION GATE =====
      final validationError = _validateBeforeSubmit(
        reportDate: safeDate,
        projects: [selectedProject],
        ineligibleProjectItemIds: state.ineligibleProjectItemIds,
      );

      // Hạng mục chưa đủ thông tin → chuyển thẳng sang màn chỉnh sửa hạng mục
      // thay vì chỉ báo lỗi, để người dùng bổ sung ngay.
      final blockedProjectItemId = _findIneligibleProjectItem([
        selectedProject,
      ], state.ineligibleProjectItemIds);
      if (blockedProjectItemId != null) {
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: false,
            submitSuccess: false,
            pendingProjectItemEditId: blockedProjectItemId,
            message:
                'Hạng mục chưa đủ thông tin, vui lòng cập nhật hạng mục '
                'trước khi báo cáo',
          ),
        );
        return;
      }

      if (validationError != null) {
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: validationError,
          ),
        );
        return;
      }

      final payload = <String, dynamic>{
        'ID': dailyID,
        'MasterID': 0,
        'UserReport': userId,
        'DateReport': dateStr,
        'ProjectID': selectedProject.projectId,
        'ProjectItemID': work.projectItemId,
        'Content': work.content,
        'Results': work.results,
        'Problem': _buildProblemText(work.projectItemId, work.problem ?? ''),
        'ProblemSolve': work.problemSolve ?? '',
        'PlanNextDay': state.planNextDay,
        'Note': work.note ?? '',
        'Backlog': work.backlog ?? '',
        'TotalHours': work.totalHours,
        'TotalHourOT': _sumOvertimeHours(work.overtimes),
        'PercentComplete': work.percentComplete.toInt(),
        'Location': TechLocation.toApiValue(state.location),
        'Type': 0,
        'ReportLate': 0,
        'StatusResult': 0,
        'WorkPlanDetailID': 0,
        'OldProjectID': 0,
        'DeleteFlag': 0,
        'Confirm': false,
      };

      final res = await _reportRepo.saveReportTech(payload: [payload]);

      // ===== BƯỚC 1: Lưu báo cáo công việc =====
      final reportError = res.fold<String?>((l) => l.getErrorMessage, (ids) {
        if (ids.isEmpty || ids.every((id) => id <= 0)) {
          return 'Lưu dữ liệu thất bại. Vui lòng báo cáo lại';
        }
        return null;
      });

      // Lưu báo cáo lỗi → dừng, KHÔNG chạy save-overtime.
      if (reportError != null) {
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: reportError,
          ),
        );
        return;
      }

      // ===== BƯỚC 2: Đồng bộ ca làm thêm =====
      // Chỉ chạy khi báo cáo đã lưu thành công; lỗi thì hiển thị message của BE.
      final overtimeError = await _syncOvertimeTech([selectedProject]);
      if (overtimeError != null) {
        emit(
          state.copyWith(
            isSaving: false,
            saveSuccess: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: overtimeError,
          ),
        );
        return;
      }

      // Giống _onSubmitReport: set submitSuccess + pending data
      emit(
        state.copyWith(
          isSaving: false,
          saveSuccess: true,
          submitSuccess: true,
          // Xoá lỗi cũ để listener không hiển thị lại snackbar lỗi khi thành công.
          message: null,
          pendingMailDate: safeDate,
          pendingShareText: DialogService.buildMailPreviewText(state, safeDate),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSaving: false,
          saveSuccess: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Lưu báo cáo thất bại. Vui lòng thử lại',
        ),
      );
      _log.logE('Submit edit report tech failed: $e');
    } finally {
      _isSavingReport = false;
    }
  }

  Future<void> _onDeleteReport(int dailyID, Emitter<TechState> emit) async {
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

  Future<void> _onCopyReport(
    DateTime dateStart,
    DateTime dateEnd,
    int teamId,
    int userId,
    String keyword,
    int departmentId,
    Emitter<TechState> emit,
  ) async {
    emit(state.copyWith(isCopyLoading: true, status: BaseStateStatus.loading));

    final result = await _reportRepo.copyReport(
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

  Future<void> _onResetCopy(Emitter<TechState> emit) async {
    emit(state.copyWith(copyReports: [], copyError: null));
  }
}
