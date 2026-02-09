import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
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
              planNextDay,
            ) => _onUpdateWork(
              index,
              totalHours: totalHours,
              totalHourOT: totalHourOT,
              percentComplete: percentComplete,
              content: content,
              results: results,
              mission: mission,
              projectItemId: projectItemId,
              planNextDay: planNextDay,
              emit: emit,
            ),

        updateDate: (picked) => _onUpdateDate(picked, emit),

        updateLocation: (type, value) => _onUpdateLocation(type, value, emit),

        submitReport: () => _onSubmitReport(emit),
        submitReportWithDate: (pickedDate) =>
            _onSubmitReportWithDate(pickedDate, emit),

      );
    });
  }

  // ================== HANDLERS ==================

  Future<void> _onInit(Emitter<TechState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();
    final departRes = await _reportRepo.getDepart();
    final projectRes = await _reportRepo.getProject();

    await userRes.fold(
      (l) async {
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
      (user) async {
        if (user == null) {
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: 'Không lấy được user',
            ),
          );
          return;
        }

        final now = DateTime.now();
        final dateStart =
            state.dateStart ?? DateTime(now.year, now.month, now.day);
        final dateEnd =
            state.dateEnd ?? DateTime(now.year, now.month, now.day, 23, 59, 59);

        final res = await _reportRepo.getDailyReportTech(
          dateStart: dateStart,
          dateEnd: dateEnd,
          keyword: state.keyword,
          teamId: user.teamOfUser,
          userId: user.id,
          departmentId: user.departmentId,
        );

        await res.fold(
          (l) async => emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: l.getErrorMessage,
            ),
          ),
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
      tempId: const Uuid().v4(), // local unique id
      projectId: null, // chưa bind API
      projectCode: 'Dự án $index',
      name: 'Dự án $index',
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

  Future<void> _onAddProject(Emitter<TechState> emit) async {
    final apiProjects = state.rtcProject;

    if (apiProjects.isEmpty) {
      _log.logW('rtcProject is empty – onInit chưa load project API');
      return;
    }

    final projects = [...state.projects];

    // Các ID / Code đã dùng
    final usedIds = projects.map((e) => e.projectId).toSet();
    final usedCodes = projects.map((e) => e.projectCode).toSet();

    // Tìm project API chưa dùng
    final selected = apiProjects.firstWhere(
      (p) => !usedIds.contains(p.id) && !usedCodes.contains(p.projectCode),
      orElse: () {
        _log.logW('All API projects are already used');
        return apiProjects.first; // fallback nếu muốn cho phép trùng
      },
    );

    _log.logI(
      'Selected API project id=${selected.id} code=${selected.projectCode}',
    );

    final newProject = TechProject(
      tempId: const Uuid().v4(),
      projectId: selected.id, // ✅ map từ API
      projectCode: selected.projectCode, // ✅ map từ API
      name: selected
          .projectName,
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

    // tìm project để sync reports theo backend id (nếu có)
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

    // ✅ Bấm lại cùng project & đã có dữ liệu → không gọi lại API
    if (isSameProject && state.projectItem.isNotEmpty) {
      emit(state.copyWith(selectedProject: project));
      emit(state.copyWith(selectedProject: project));
      return;
    }

    emit(
      state.copyWith(
        selectedProject: project,
        projectItem: const [], // reset mission
      ),
    );

    // ✅ Project chưa bind API → không gọi API, không fail state
    if (project.projectId == null) {
      _log.logW('Project chưa bind API ID → không load mission');
      return;
    }

    final res = await _reportRepo.getProjectItemByUser(
      projectId: project.projectId!, // ✅ projectId của item đang select
    );

    await res.fold(
      (l) async {
        _log.logE('Get project item failed: ${l.getErrorMessage}');
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
    // chặn bind trùng backend project
    final usedBackendIds = state.projects
        .where((p) => p.projectId != null)
        .map((p) => p.projectId)
        .toSet();

    if (usedBackendIds.contains(apiProject.id)) {
      _log.logW('Project API này đã được bind ở project khác');
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
        projectItem: const [], // ✅ reset mission
        selectedProjectItem: null, // ✅ reset item đang chọn
      ),
    );

    // ✅ Sau khi bind xong → gọi API load mission luôn
    final res = await _reportRepo.getProjectItemByUser(
      projectId: apiProject.id,

    );

    await res.fold(
      (l) async {
        _log.logE('Get project item failed: ${l.getErrorMessage}');
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
  _onAddWork(Emitter<TechState> emit) {
    final project = state.selectedProject;
    final item = state.selectedProjectItem;
    if (project == null) return;

    final dateStr = state.dateStart != null
        ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
        : null; // ✅ KHÔNG fallback DateTime.now()

    late TechProject newSelectedProject;

    final newProjects = state.projects.map((p) {
      if (p.projectId == project.projectId) {
        final works = [
          ...p.works,
          TechWork.empty(
            code: item?.code ?? '',
            projectId: p.projectId ?? 0,
            projectCode: p.projectCode ?? '',
            projectName: p.name ?? '',
            projectText: p.name ?? '',
            userId: state.id ?? 0,
            fullName: state.fullName ?? '',
            dateReport: dateStr ?? '', // ✅ để rỗng nếu chưa chọn ngày
            createdDate: DateTime.now(),
            projectItemId: item?.id ?? 0,
          ),
        ];
        newSelectedProject = p.copyWith(works: works);
        return newSelectedProject;
      }
      return p;
    }).toList();

    emit(state.copyWith(
      projects: newProjects,
      selectedProject: newSelectedProject,
      expandedWorkIndex: newSelectedProject.works.length - 1,
    ));
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
        String? planNextDay,
        String? dateReport,
        required Emitter<TechState> emit,
      }) async {
    final selected = state.selectedProject;
    if (selected == null) return;

    final newWorks = [...selected.works];

    final old = newWorks[index];

    newWorks[index] = old.copyWith(
      dateReport: dateReport ?? old.dateReport,
      totalHours: totalHours ?? old.totalHours,
      totalHourOT: totalHourOT ?? old.totalHourOT,
      percentComplete: percentComplete ?? old.percentComplete,
      content: content ?? old.content,
      results: results ?? old.results,
      mission: mission ?? old.mission,
      projectItemId: projectItemId ?? old.projectItemId,
      planNextDay: planNextDay ?? old.planNextDay,
    );

    emit(
      state.copyWith(
        projects: state.projects.map((p) {
          if (p.tempId == selected.projectId) {
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

    emit(state.copyWith(
      projects: projects,
      selectedProject: newSelected,
      dateStart: safeDate, // ✅ BẮT BUỘC
    ));
  }




  _onUpdateLocation(String type, String? value, Emitter<TechState> emit) {
    emit(
      state.copyWith(
        locationType: type,
        location: type == 'rtc' ? 'VP RTC' : value,
      ),
    );
  }

  Future<void> _onSubmitReport(Emitter<TechState> emit) async {
    try {
      emit(state.copyWith(
        isSubmitting: true,
      ));

      // 1️⃣ Lấy user
      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;


      // 2️⃣ Lấy project
      final selectedProject = state.selectedProject;
      if (selectedProject == null) {
        emit(state.copyWith(isSubmitting: false));
        _log.logE('No project selected');
        return;
      }

      // 3️⃣ Submit từng work (KHÔNG validate nữa)
      for (final work in selectedProject.works) {
        if (work.projectItemId == null) {
          emit(state.copyWith(isSubmitting: false));
          return;
        }

        final dateStr = state.dateStart != null
            ? DateFormat('yyyy-MM-dd').format(state.dateStart!)
            : null;


        final req = SaveReportTechRequest(
          id: 0,
          masterId: 0,
          userReport: userId,
          dateReport: dateStr,
          projectId: selectedProject.projectId,
          projectItemId: work.projectItemId,
          content: work.content,
          results: work.results,
          problem: work.problem,
          problemSolve: work.problemSolve,
          planNextDay: work.planNextDay,
          backlog: work.backlog,
          totalHours: work.totalHours,
          totalHourOT: work.totalHourOT,
          percentComplete: work.percentComplete,
          location: state.location,
          note: work.note,
          type: 0,
          reportLate: 0,
          statusResult: 0,
          workPlanDetailId: 0,
          oldProjectId: 0,
          deleteFlag: 0,
          confirm: false,
        );

        // ✅ Log payload gửi đi (format giống Postman)
        _log.logI('Submit payload: ${req.toJson()}');
        final res = await _reportRepo.saveReportTech(request: req);

        await res.fold(
              (l) async {
            emit(state.copyWith(isSubmitting: false));

            _log.logE(
              '❌ Submit report failed on workId=${work.id}'
            );
            return;
          },
              (r) async {
            _log.logI('✅ Submit success workId=${work.id}');
          },
        );

      }

      // 4️⃣ Thành công toàn bộ
      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false));
      _log.logE('Submit report error: $e');
    }
  }


  Future<void> _onSubmitReportWithDate(
      DateTime pickedDate,
      Emitter<TechState> emit,
      ) async {
    try {
      emit(state.copyWith(isSubmitting: true));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);
      final userId = user?.id;

      if (userId == null) {
        emit(state.copyWith(isSubmitting: false));
        _log.logE('User not found');
        return;
      }

      final selectedProject = state.selectedProject;
      if (selectedProject == null) {
        emit(state.copyWith(isSubmitting: false));
        _log.logE('No project selected');
        return;
      }

      // ✅ CHỈ LẤY TỪ UI
      final safeDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
      final dateStr = DateFormat('yyyy-MM-dd').format(safeDate);

      _log.logI('🔥 Submit with UI date = $dateStr');

      for (final work in selectedProject.works) {
        final payload = <String, dynamic>{
          'ID': 0,
          'MasterID': 0,
          'UserReport': userId,
          'DateReport': dateStr, // ✅ đúng ngày user chọn
          'ProjectID': selectedProject.projectId,
          'ProjectItemID': work.projectItemId,

          'Content': work.content ?? '',
          'Results': work.results ?? '',
          'Problem': work.problem ?? '',
          'ProblemSolve': work.problemSolve ?? '',
          'PlanNextDay': work.planNextDay ?? '',
          'Note': work.note ?? '',
          'Backlog': work.backlog ?? '',

          // ⚠️ backend hay fail nếu gửi double → ép về num/int nếu cần
          'TotalHours': (work.totalHours ?? 0).toInt(),
          'TotalHourOT': (work.totalHourOT ?? 0).toInt(),
          'PercentComplete': (work.percentComplete ?? 0).toInt(),

          'Location': state.location ?? 'VP RTC',
          'Type': 0,
          'ReportLate': 0,
          'StatusResult': 0,
          'WorkPlanDetailID': 0,
          'OldProjectID': 0,
          'DeleteFlag': 0,
          'Confirm': false,
        };

        _log.logI('🔥 RAW Submit payload = $payload');

        final res = await _reportRepo.saveReportTechRaw(payload: payload);

        await res.fold(
              (l) async {
            emit(state.copyWith(isSubmitting: false));
            _log.logE('❌ Submit failed: ${l.getErrorMessage}');
            return;
          },
              (r) async {
            _log.logI('✅ Submit success');
          },
        );
      }

      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
    } catch (e, st) {
      emit(state.copyWith(isSubmitting: false));
      _log.logE('❌ Submit error: $e\n$st');
    }
  }
}
