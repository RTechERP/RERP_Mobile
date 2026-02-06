import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
        addProject: () => _onAddProject(emit),

        removeProject: (projectText) => _onRemoveProject(projectText, emit),

        selectProject: (projectText) => _onSelectProject(projectText, emit),

        updateProjectName: (projectText, newName) =>
            _onUpdateProjectName(projectText, newName, emit),

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
            ) => _onUpdateWork(
              index,
              totalHours: totalHours,
              totalHourOT: totalHourOT,
              percentComplete: percentComplete,
              content: content,
              results: results,
              mission: mission,
              emit: emit,
            ),

        updateDate: (createdDate) => _onUpdateDate(createdDate, emit),

        updateLocation: (type, value) => _onUpdateLocation(type, value, emit),
      );
    });
  }

  // ================== HANDLERS ==================

  Future<void> _onInit(Emitter<TechState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final userRes = await _authRepo.getCurrentUser();

    await userRes.fold(
      (l) async {
        _log.logE('Get current user failed: ${l.getErrorMessage}');
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
              message: 'Không lấy được thông tin team của user',
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
          (l) async {
            _log.logE(l.getErrorMessage);
            emit(
              state.copyWith(
                status: BaseStateStatus.failed,
                message: l.getErrorMessage,
              ),
            );
          },
          (r) async {
            emit(
              state.copyWith(
                status: BaseStateStatus.success,
                reports: r,
                dateStart: dateStart,
                dateEnd: dateEnd,
              ),
            );
          },
        );
      },
    );
  }

  // ================= PROJECT =================

  _onAddProject(Emitter<TechState> emit) {
    final projects = [...state.projects];

    final newProject = TechProject(
      id: projects.length.toString(),
      name: 'Dự án ${projects.length + 1}',
    );

    projects.add(newProject);

    emit(state.copyWith(projects: projects, selectedProject: newProject));
  }

  _onRemoveProject(TechProject project, Emitter<TechState> emit) {
    final projects = state.projects.where((p) => p.id != project.id).toList();

    final reports = state.reports
        .where((r) => r.projectName != project.name)
        .toList();

    emit(
      state.copyWith(
        projects: projects,
        reports: reports,
        selectedProject: projects.isNotEmpty ? projects.first : null,
        expandedWorkIndex: null,
      ),
    );
  }

  _onSelectProject(TechProject project, Emitter<TechState> emit) {
    emit(state.copyWith(selectedProject: project, expandedWorkIndex: null));
  }

  _onUpdateProjectName(
    TechProject project,
    String newName,
    Emitter<TechState> emit,
  ) {
    final projects = state.projects.map((p) {
      if (p.id == project.id) {
        return p.copyWith(name: newName);
      }
      return p;
    }).toList();

    final reports = state.reports.map((r) {
      if (r.projectName == project.name) {
        return r.copyWith(projectName: newName);
      }
      return r;
    }).toList();

    final selected = state.selectedProject?.id == project.id
        ? project.copyWith(name: newName)
        : state.selectedProject;

    emit(
      state.copyWith(
        projects: projects,
        reports: reports,
        selectedProject: selected,
      ),
    );
  }

  // ================= WORK =================

  _onAddWork(Emitter<TechState> emit) {
    final project = state.selectedProject;
    if (project == null) return;

    final works = [...project.works];

    final newWork = TechWork.empty(
      userId: state.id ?? 0,
      fullName: state.fullName ?? '',
      dateReport: DateTime.now(),
      createdDate: DateTime.now(),
    );

    works.add(newWork);

    final newProjects = state.projects.map((p) {
      if (p.id == project.id) {
        return p.copyWith(works: works);
      }
      return p;
    }).toList();

    final newSelectedProject =
    newProjects.firstWhere((p) => p.id == project.id);

    emit(state.copyWith(
      projects: newProjects,
      selectedProject: newSelectedProject,

      // 👇 TỰ ĐỘNG EXPAND WORK MỚI NHẤT
      expandedWorkIndex: newSelectedProject.works.length - 1,
    ));
  }
  _onRemoveWork(int index, Emitter<TechState> emit) {
    final project = state.selectedProject;
    if (project == null) return;
    if (index < 0 || index >= project.works.length) return;

    final newWorks = [...project.works]..removeAt(index);

    final newProjects = state.projects.map((p) {
      if (p.id == project.id) {
        return p.copyWith(works: newWorks);
      }
      return p;
    }).toList();

    emit(
      state.copyWith(
        projects: newProjects,
        selectedProject: newProjects.firstWhere((p) => p.id == project.id),
        expandedWorkIndex: null,
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

  _onUpdateWork(
      int index, {
        String? totalHours,
        String? totalHourOT,
        String? percentComplete,
        String? content,
        String? results,
        String? mission,
        required Emitter<TechState> emit,
      }) {
    final project = state.selectedProject;
    if (project == null) return;
    if (index < 0 || index >= project.works.length) return;

    final works = List<TechWork>.from(project.works);
    final w = works[index];

    works[index] = w.copyWith(
      totalHours: totalHours != null
          ? double.tryParse(totalHours) ?? w.totalHours
          : w.totalHours,
      totalHourOT: totalHourOT != null
          ? double.tryParse(totalHourOT) ?? w.totalHourOT
          : w.totalHourOT,
      percentComplete: percentComplete != null
          ? int.tryParse(percentComplete) ?? w.percentComplete
          : w.percentComplete,
      content: content ?? w.content,
      results: results ?? w.results,
      mission: mission ?? w.mission, // ✅ QUAN TRỌNG
    );

    final newProjects = state.projects.map((p) {
      if (p.id == project.id) {
        return p.copyWith(works: works);
      }
      return p;
    }).toList();

    final newSelectedProject =
    newProjects.firstWhere((p) => p.id == project.id);

    emit(state.copyWith(
      projects: newProjects,
      selectedProject: newSelectedProject,
    ));
  }
  _onUpdateDate(DateTime? createdDate, Emitter<TechState> emit) {
    if (createdDate == null) return;

    final reports = state.reports
        .map((r) => r.copyWith(createdDate: createdDate))
        .toList();

    emit(state.copyWith(reports: reports));
  }

  _onUpdateLocation(String type, String? value, Emitter<TechState> emit) {
    emit(
      state.copyWith(
        locationType: type,
        location: type == 'rtc' ? 'VP RTC' : value,
      ),
    );
  }
}
