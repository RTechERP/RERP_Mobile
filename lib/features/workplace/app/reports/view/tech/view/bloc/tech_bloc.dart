import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
import '../../data/datasource/models/tech_model.dart';

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
    on<TechEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),

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
              emit: emit,
            ),

        updateDate: (picked) => _onUpdateDate(picked, emit),

        updateLocation: (type, value) => _onUpdateLocation(type, value, emit),

        submitReport: (pickedDate) => _onSubmitReport(pickedDate, emit),

        updatePlanNextDay: (planNextDay) =>
            _onUpdatePlanNextDay(planNextDay, emit),
        sendMailReport: (pickedDate, context) =>
            _onSendMailReport(pickedDate, context, emit),
        resetSubmitFlags: () => _onResetSubmitFlags(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(dateStart, dateEnd, emit),
        selectReport: (dailyID) => _onSelectReport(dailyID, emit),

        loadDetailData: (dailyID) => _onLoadDetailData(dailyID, emit),
        submitEditReport: (pickedDate, dailyID) =>
            _onSubmitEditReport(dailyID, pickedDate, emit),
        deleteReport: (dailyID) => _onDeleteReport(dailyID, emit),
      );
    });
  }

  // ================== HANDLERS ==================

  _onUpdatePlanNextDay(String planNextDay, Emitter<TechState> emit) {
    emit(state.copyWith(planNextDay: planNextDay));
  }

  Future<void> _onChangeDateRange(
    DateTime dateStart,
    DateTime dateEnd,
    Emitter<TechState> emit,
  ) async {
    final start = dateStart;
    final end = dateEnd;

    emit(
      state.copyWith(
        dateStart: DateTime(start.year, start.month, start.day),
        dateEnd: DateTime(end.year, end.month, end.day, 23, 59, 59),
      ),
    );

    add(const TechEvent.init());
  }

  Future<void> _onInit(Emitter<TechState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

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

        emit(state.copyWith(userId: user.id, fullName: user.fullName));

        final now = DateTime.now();

        final defaultStart = now;

        final defaultEnd = DateTime(now.year, now.month, now.day+1, 23, 59, 59);

        final dateStart = state.lastPickedDate ?? defaultStart;
        final dateEnd = state.dateEnd ?? defaultEnd;

        final res = await _reportRepo.getDailyReportTech(
          dateStart: dateStart,
          dateEnd: dateEnd,
          keyword: state.keyword ?? '',
          teamId: user.teamOfUser.toString(),
          userId: user.id.toString(),
          departmentId: user.departmentId.toString(),
        );

        await res.fold(
          (l) async {
            _log.logE('GetDailyReportTech failed: ${l.getErrorMessage}');
            emit(state.copyWith(status: BaseStateStatus.failed));
          },
          (r) async => emit(
            state.copyWith(
              status: BaseStateStatus.success,
              reports: r,
              dateStart: dateStart,
              dateEnd: dateEnd,
            ),
          ),
        );
      },
    );

    await departRes.fold(
      (l) async => _log.logE('Get depart failed: ${l.getErrorMessage}'),
      (r) async => emit(state.copyWith(departs: r)),
    );

    await projectRes.fold(
      (l) async => _log.logE('Get project failed: ${l.getErrorMessage}'),
      (r) async => emit(state.copyWith(rtcProject: r)),
    );
  }

  // ================= PROJECT =================

  Future<void> _onAddEmptyProject(Emitter<TechState> emit) async {
    final projects = [...state.projects];
    final index = projects.length + 1;

    final newProject = TechProject(
      tempId: const Uuid().v4(),
      projectId: null,
      projectCode: '${'report.project'.tr()} $index',
      name: '${'report.project'.tr()} $index',
      works: const [],
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
      if (p.projectId == project.projectId) {
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
        int? projectItemId,
        String? dateReport,
        String? code,
        required Emitter<TechState> emit,
      }) async {
    final selected = state.selectedProject;
    if (selected == null) return;

    final newWorks = [...selected.works];
    if (index < 0 || index >= newWorks.length) return;

    final old = newWorks[index];

    // ✅ xác định projectItemId cuối cùng
    final effectiveProjectItemId =
        projectItemId ?? old.projectItemId;

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
      projectItemId: effectiveProjectItemId,
      code: code ?? old.code,
    );

    emit(
      state.copyWith(
        projects: state.projects.map((p) {
          if (p.projectId == selected.projectId) {
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
      if (p.projectId == selected.projectId) {
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
        location: type == 'rtc' ? 'report.project'.tr() : value,
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

      final selectedProject = state.selectedProject;
      if (selectedProject == null) {
        emit(state.copyWith(isSubmitting: false));
        return;
      }

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      for (final work in selectedProject.works) {
        final payload = <String, dynamic>{
          'ID': 0,
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
          'TotalHours': (work.totalHours).toInt(),
          'TotalHourOT': (work.totalHourOT ?? 0).toInt(),
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

        // _log.logI('🔥 RAW Submit payload = $payload');

        final res = await _reportRepo.saveReportTech(payload: payload);

        final isFailed = await res.fold(
          (l) async {
            // _log.logE('❌ Submit failed: ${l.getErrorMessage}');
            return true;
          },
          (r) async {
            // _log.logI('✅ Submit success');
            return false;
          },
        );

        if (isFailed) {
          emit(state.copyWith(isSubmitting: false, submitSuccess: false));
          return;
        }
      }

      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
    } catch (e, st) {
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
  ) async {
    try {
      emit(state.copyWith(isSubmitting: true, sendMailSuccess: false));

      final body = DialogService.buildMailPreviewText(state, pickedDate);

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
          emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
          // _log.logE('❌ Send mail failed: ${l.getErrorMessage}');
        },
        (r) async {
          emit(state.copyWith(isSubmitting: false, sendMailSuccess: true));

          // _log.logI('✅ Send mail success: $r');

          // 3. Giữ success đủ lâu để chạy animation
          await Future.delayed(const Duration(milliseconds: 900));

          // 4. Reset overlay (tránh kẹt màn)
          emit(state.copyWith(sendMailSuccess: false));
        },
      );
    } catch (e, st) {
      emit(state.copyWith(isSubmitting: false, sendMailSuccess: false));
      // _log.logE('❌ Send mail error: $e\n$st');
    }
  }

  _onResetSubmitFlags(Emitter<TechState> emit) {
    emit(state.copyWith(submitSuccess: false, sendMailSuccess: false));
  }

  Future<void> _onSelectReport(
      int dailyID,
      Emitter<TechState> emit,
      ) async {
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

  Future<void> _onLoadDetailData(
      int dailyID,
      Emitter<TechState> emit,
      ) async {
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

        final projectItemRes =
        await _reportRepo.getProjectItemByUser(
          projectId: apiProject.id,
        );

        final projectItems =
        projectItemRes.getOrElse(() => []);

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

        emit(
          state.copyWith(
            isLoadingDetail: false,
            rtcProject: projectList,
            projectItem: projectItems,
            projects: [project],
            selectedProject: project,
            locationType:
            detail.location == 'VP RTC' ? 'rtc' : 'other',
            location: detail.location,
            planNextDay: detail.planNextDay,
            problem: detail.problem,
            problemSolve: detail.problemSolve,
            backlog: detail.backlog,
            note: detail.note,
            dateReport:
            DateTime.tryParse(detail.dateReport),
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
      emit(state.copyWith(
        isSaving: true,
        saveSuccess: false,
      ));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      final selectedProject = state.selectedProject;
      if (selectedProject == null ||
          selectedProject.works.isEmpty) {
        emit(state.copyWith(isSaving: false));
        return;
      }

      final work = selectedProject.works.first;

      final safeDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      final dateStr =
      DateFormat('yyyy-MM-dd').format(safeDate);

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
        'TotalHours': work.totalHours.toInt(),
        'TotalHourOT': (work.totalHourOT ?? 0).toInt(),
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

      final res =
      await _reportRepo.saveReportTech(payload: payload);

      final isFailed = res.fold(
            (l) => true,
            (r) => false,
      );

      if (isFailed) {
        emit(state.copyWith(
          isSaving: false,
          saveSuccess: false,
        ));
        return;
      }

      emit(state.copyWith(
        isSaving: false,
        saveSuccess: true,
      ));
    } catch (_) {
      emit(state.copyWith(
        isSaving: false,
        saveSuccess: false,
      ));
    } finally {
      _isSavingReport = false; // ⚠ sửa lại đúng biến
    }
  }

  Future<void> _onDeleteReport(
      int dailyID,
      Emitter<TechState> emit,
      ) async {
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
        emit(
          state.copyWith(
            isDeleting: false,
            deleteSuccess: false,
          ),
        );
      },
          (message) {
        /// remove khỏi list hiện tại (không cần gọi lại API)
        final updatedReports =
        state.reports.where((e) => e.id != dailyID).toList();

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
}
