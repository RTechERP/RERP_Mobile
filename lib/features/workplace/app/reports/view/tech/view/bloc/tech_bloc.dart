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
import '../../data/tech_model.dart';

part 'tech_event.dart';
part 'tech_state.dart';
part 'tech_bloc.g.dart';
part 'tech_bloc.freezed.dart';

@injectable
class TechBloc extends BaseBloc<TechEvent, TechState> {
  final ReportRepo _reportRepo;
  final LogUtils _log;
  final AuthRepo _authRepo;

  TechBloc(this._reportRepo, this._authRepo, this._log)
    : super(TechState.init()) {
    on<TechEvent>(
      (event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        initAdd: (copyItems, rtcProject) => _onInitAdd(copyItems, rtcProject, emit),

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
      );
    },
      transformer: (events, mapper) => events.asyncExpand(mapper),
    );
  }

  // ================== HANDLERS ==================

  _onUpdatePlanNextDay(String planNextDay, Emitter<TechState> emit) {
    emit(state.copyWith(planNextDay: planNextDay));
  }

  _onUpdateExtraInfo(
      String? problem,
      String? problemSolve,
      String? backlog,
      String? note,
      Emitter<TechState> emit,
      ) {
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
    emit(state.copyWith(
        status: BaseStateStatus.loading,
        pendingMailDate: null,
        deleteSuccess: false,
        submitSuccess: false,
      ));

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
            dateStart: DateTime(startWeek.year, startWeek.month, startWeek.day),
            dateEnd: DateTime(endWeek.year, endWeek.month, endWeek.day, 23, 59, 59),
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
    var projectList = rtcProject.isNotEmpty ? rtcProject : state.rtcProject;

    if (projectList.isEmpty) {
      final projectRes = await _reportRepo.getProject();
      projectList = projectRes.getOrElse(() => []);
      
      final departRes = await _reportRepo.getDepart();
      final departs = departRes.getOrElse(() => []);

      final userRes = await _authRepo.getCurrentUser();
      
      userRes.fold(
        (l) {
          emit(state.copyWith(
            rtcProject: projectList,
            departs: departs,
          ));
        },
        (user) {
          emit(state.copyWith(
            rtcProject: projectList,
            departs: departs,
            userId: user?.id,
            fullName: user?.fullName,
            departmentId: user?.departmentId,
            teamId: user?.teamOfUser,
            employeeID: user?.employeeId,
          ));
        },
      );
    } else {
      emit(state.copyWith(rtcProject: rtcProject));
    }

    if (copyItems.isEmpty) {
      add(const TechEvent.addEmptyProject());
      return;
    }

    emit(state.copyWith(status: BaseStateStatus.loading));

    final dateStr = DateFormat('yyyy-MM-dd').format(DateTime.now());
    List<TechProject> newProjects = [];
    var index = 1;

    final resolvedList = projectList;

    for (var copyItem in copyItems) {
      final apiProject = resolvedList.where((p) => p.projectCode == copyItem.projectCode).firstOrNull;
      
      int? projectId;
      int projectItemId = 0;
      String pName = copyItem.projectName ?? '';
      
      String missionName = '';
      double percentComplete = 0.0;
      
      if (apiProject != null) {
        projectId = apiProject.id;
        pName = apiProject.projectName;
        
        final pitRes = await _reportRepo.getProjectItemByUser(projectId: projectId);
        final listPit = pitRes.getOrElse(() => []);
        
        final apiPit = listPit.where((pit) => pit.code == copyItem.projectItemCode).firstOrNull;
        if (apiPit != null) {
           projectItemId = apiPit.id;
           missionName = apiPit.mission ?? '';
           percentComplete = apiPit.percentageActual ?? 0;
        }
      } else {
        pName = copyItem.projectCode ?? '${'report.project'.tr()} $index';
      }
      
      final work = TechWork.empty(
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
    
    emit(state.copyWith(
      projects: newProjects,
      selectedProject: newProjects.isNotEmpty ? newProjects.first : null,
      expandedWorkIndex: 0,
      status: BaseStateStatus.success,
      planNextDay: copyItems.isNotEmpty ? copyItems.first.planNextDay : '',
      problem: copyItems.isNotEmpty ? copyItems.first.problem : '',
      problemSolve: copyItems.isNotEmpty ? copyItems.first.problemSolve : '',
      note: copyItems.isNotEmpty ? copyItems.first.note : '',
      backlog: copyItems.isNotEmpty ? copyItems.first.backlog : '',
    ));

    if (newProjects.isNotEmpty && newProjects.first.projectId != null) {
       final pitRes = await _reportRepo.getProjectItemByUser(projectId: newProjects.first.projectId!);
       emit(state.copyWith(projectItem: pitRes.getOrElse(() => [])));
    }
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

  _onRemoveProject(String tempId, Emitter<TechState> emit) {
    final projects = state.projects.where((p) => p.tempId != tempId).toList();
    emit(
      state.copyWith(
        projects: projects,
        selectedProject: projects.isNotEmpty ? projects.first : null,
        expandedWorkIndex: null,
      ),
    );
  }

  _onUpdateProjectName(String tempId, String newName, Emitter<TechState> emit) {
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
          works: p.works.map((w) => w.copyWith(
            projectCode: apiProject.projectCode,
            projectName: apiProject.projectName,
            projectItemId: 0,
            mission: '',
            percentComplete: 0.0,
          )).toList(),
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

  List<TechWork> _normalizeWorkingHours(List<TechWork> works) {
    if (works.isEmpty) return works;

    double sumNormal = works.fold<double>(
      0,
      (s, w) => s + ((w.totalHours) - (w.totalHourOT ?? 0)),
    );

    if (sumNormal >= 8) {
      final ratio = 8 / sumNormal;

      return works.map((w) {
        final normal = (w.totalHours - (w.totalHourOT ?? 0)) * ratio;

        return w.copyWith(totalHours: normal + (w.totalHourOT ?? 0));
      }).toList();
    }

    return works;
  }

  _onAddWork(Emitter<TechState> emit) {
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

  _onRemoveWork(int index, Emitter<TechState> emit) {
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

    emit(
      state.copyWith(
        projects: state.projects.map((p) {
          if (p.tempId == selected.tempId) {
            return p.copyWith(works: newWorks);
          }
          return p;
        }).toList(),
        selectedProject: selected.copyWith(works: newWorks),
      ),
    );
  }

  _onExpandWork(int index, Emitter<TechState> emit) {
    emit(
      state.copyWith(
        expandedWorkIndex: state.expandedWorkIndex == index ? null : index,
      ),
    );
  }

  _onUpdateDate(DateTime? picked, Emitter<TechState> emit) {
    if (picked == null) return;

    final safeDate = DateTime(picked.year, picked.month, picked.day);
    final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

    final selected = state.selectedProject;
    if (selected == null) return;

    late TechProject newSelected;

    final projects = state.projects.map((p) {
      if (p.tempId == selected.tempId) {
        final works = p.works
            .map((w) => w.copyWith(dateReport: dateStr))
            .toList();

        newSelected = p.copyWith(works: works);
        return newSelected;
      }
      return p;
    }).toList();

    emit(
      state.copyWith(
        projects: projects,
        selectedProject: newSelected,
        dateStart: safeDate,
      ),
    );
  }

  _onUpdateLocation(String type, String? value, Emitter<TechState> emit) {
    emit(
      state.copyWith(
        locationType: type,
        location: type == 'rtc' ? 'VP RTC' : (value ?? ''),
      ),
    );
  }

  bool _isSubmittingReport = false;

  Future<void> _onSubmitReport(
    DateTime pickedDate,
    Emitter<TechState> emit,
  ) async {
    if (_isSubmittingReport) return;
    _isSubmittingReport = true;

    try {
      emit(state.copyWith(isSubmitting: true, submitSuccess: false));

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

      for (final project in submitProjects) {
        final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

        for (final work in project.works) {
          final payload = <String, dynamic>{
            'ID': 0,
            'MasterID': 0,
            'UserReport': userId,
            'DateReport': dateStr,
            'ProjectID': project.projectId,
            'ProjectItemID': work.projectItemId,
            'Content': work.content,
            'Results': work.results,
            'Problem': state.problem ?? '',
            'ProblemSolve': state.problemSolve ?? '',
            'PlanNextDay': state.planNextDay,
            'Note': state.note ?? '',
            'Backlog': state.backlog ?? '',
            'TotalHours': work.totalHours,
            'TotalHourOT': work.totalHourOT ?? 0,
            'PercentComplete': work.percentComplete.toInt(),
            'Location': state.location ?? 'report.project'.tr(),
            'Type': 0,
            'ReportLate': 0,
            'StatusResult': 0,
            'WorkPlanDetailID': 0,
            'OldProjectID': 0,
            'DeleteFlag': 0,
            'Confirm': false,
          };

          final res = await _reportRepo.saveReportTech(payload: payload);

          final isFailed = await res.fold(
            (l) async {
              emit(state.copyWith(
                isSubmitting: false,
                submitSuccess: false,
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ));
              return true;
            },
            (r) async => false,
          );

          if (isFailed) {
            return;
          }
        }
      }
      emit(state.copyWith(isSubmitting: false, submitSuccess: true, pendingMailDate: safeDate, pendingShareText: DialogService.buildMailPreviewText(state, safeDate)));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, submitSuccess: false));
      // _log.logE('❌ Submit error: $e\n$st');
    } finally {
      _isSubmittingReport = false;
    }
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
      final body = shareText ?? DialogService.buildMailPreviewText(state, pickedDate);

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
          emit(state.copyWith(
            isSubmitting: false,
            sendMailSuccess: false,
            message: l.getErrorMessage,
          ));
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
          emit(state.copyWith(
            sendMailSuccess: false,
            deleteSuccess: false,
            submitSuccess: false,
            saveSuccess: false,
            pendingMailDate: null,
            pendingShareText: null,
            message: null,
            isSubmitting: false,
            isSaving: false,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
    }
  }

  _onResetSubmitFlags(Emitter<TechState> emit) {
    emit(state.copyWith(
      submitSuccess: false,
      saveSuccess: false,
      sendMailSuccess: false,
      deleteSuccess: false,
      pendingMailDate: null,
      pendingShareText: null,
      message: null,
      isSubmitting: false,
      isSaving: false,
    ));
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

        final rawLocation = detail.location;
        final normalized = rawLocation.trim().toLowerCase();
        final isRtc = normalized == 'vp rtc';

        emit(
          state.copyWith(
            isLoadingDetail: false,
            rtcProject: projectList,
            projectItem: projectItems,
            projects: [project],
            selectedProject: project,
            // ✅ location bind chuẩn
            locationType: isRtc ? 'rtc' : 'other',
            location: rawLocation.trim(),
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
    Emitter<TechState> emit,
  ) async {
    if (_isSavingReport) return;
    _isSavingReport = true;

    try {
      emit(state.copyWith(isSaving: true, saveSuccess: false, submitSuccess: false));

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

      final payload = <String, dynamic>{
        'ID': dailyID,
        'MasterID': 0,
        'UserReport': userId,
        'DateReport': dateStr,
        'ProjectID': selectedProject.projectId,
        'ProjectItemID': work.projectItemId,
        'Content': work.content,
        'Results': work.results,
        'Problem': work.problem ?? '',
        'ProblemSolve': work.problemSolve ?? '',
        'PlanNextDay': state.planNextDay,
        'Note': work.note ?? '',
        'Backlog': work.backlog ?? '',
        'TotalHours': work.totalHours,
        'TotalHourOT': work.totalHourOT ?? 0,
        'PercentComplete': work.percentComplete.toInt(),
        'Location': state.location ?? 'report.project'.tr(),
        'Type': 0,
        'ReportLate': 0,
        'StatusResult': 0,
        'WorkPlanDetailID': 0,
        'OldProjectID': 0,
        'DeleteFlag': 0,
        'Confirm': false,
      };

      final res = await _reportRepo.saveReportTech(payload: payload);

      final isFailed = await res.fold(
        (l) async {
          emit(state.copyWith(
            isSaving: false,
            saveSuccess: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ));
          return true;
        },
        (r) async => false,
      );

      if (isFailed) {
        return;
      }

      // Giống _onSubmitReport: set submitSuccess + pending data
      emit(state.copyWith(
        isSaving: false,
        saveSuccess: true,
        submitSuccess: true,
        pendingMailDate: safeDate,
        pendingShareText: DialogService.buildMailPreviewText(state, safeDate),
      ));
    } catch (_) {
      emit(state.copyWith(isSaving: false, saveSuccess: false, submitSuccess: false));
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

  _onResetCopy(Emitter<TechState> emit) {
    emit(state.copyWith(copyReports: [], copyError: null));
  }
}
