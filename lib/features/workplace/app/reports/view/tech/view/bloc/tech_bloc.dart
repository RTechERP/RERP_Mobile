import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../data/datasource/models/tech_model.dart';

part 'tech_event.dart';
part 'tech_state.dart';
part 'tech_bloc.g.dart';
part 'tech_bloc.freezed.dart';

@injectable
class TechBloc extends BaseBloc<TechEvent, TechState> {
  final _uuid = const Uuid();
  TechBloc() : super(TechState.init()) {
    on<TechEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        updateWork: (
            projectIndex,
            workId,
            totalHours,
            otHours,
            percent,
            content,
            result,
            category,
            ) =>
            _onUpdateWork(
              projectIndex,
              workId,
              totalHours: totalHours,
              otHours: otHours,
              percent: percent,
              content: content,
              result: result,
              category: category,
              emit: emit,
            ),
        addProject: () => _onAddProject(emit),
        removeProject: (projectId) => _onRemoveProject(projectId, emit),
        selectProject: (projectIndex, name) => _onSelectProject(projectIndex, name, emit),

        addWork: (categoryIndex) => _onAddWork(categoryIndex, emit),
        removeWork: (projectIndex, workId) =>
            _onRemoveWork(projectIndex, workId, emit),

        expandWork: (categoryIndex, workIndex) =>
            _onExpandWork(categoryIndex, workIndex, emit),

        updateDate: (date) => _onUpdateDate(date, emit),
        expandProject: (projectIndex) => _onExpandProject(projectIndex, emit),
      );
    });
  }

  _onInit(Emitter<TechState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        projects: [
          TechProject(
            id: _uuid.v4(),
            categories: const [TechCategory()],
          ),
        ],
        expandedProjectIndex: 0,
      ),
    );
  }

  _onAddProject(Emitter<TechState> emit) {
    final newProjects = [
      ...state.projects,
      TechProject(
        id: _uuid.v4(),
        categories: const [TechCategory()],
      ),
    ];

    emit(state.copyWith(
      projects: newProjects,
      expandedProjectIndex: newProjects.length - 1,
      expandedWorkIndex: null,
    ));
  }

  _onRemoveProject(String projectId, Emitter<TechState> emit) {
    final newProjects =
    state.projects.where((p) => p.id != projectId).toList();

    int? nextExpandedProjectIndex = state.expandedProjectIndex;

    if (state.expandedProjectIndex != null) {
      if (newProjects.isEmpty) {
        nextExpandedProjectIndex = null;
      } else if (state.expandedProjectIndex! >= newProjects.length) {
        nextExpandedProjectIndex = newProjects.length - 1;
      }
    }

    emit(state.copyWith(
      projects: newProjects,
      expandedProjectIndex: nextExpandedProjectIndex,
      expandedWorkIndex: null,
    ));
  }

  _onSelectProject(int projectIndex, String name, Emitter<TechState> emit) {
    final newProjects = [...state.projects];

    if (projectIndex < 0 || projectIndex >= newProjects.length) return;

    final project = newProjects[projectIndex];

    newProjects[projectIndex] = project.copyWith(name: name);

    emit(state.copyWith(projects: newProjects));
  }
  _onAddWork(int projectIndex, Emitter<TechState> emit) {
    final projects = [...state.projects];
    final project = projects[projectIndex];

    final works = [
      ...project.works,
      TechWork(id: const Uuid().v4()),
    ];

    projects[projectIndex] = project.copyWith(works: works);

    emit(
      state.copyWith(
        projects: projects,
        expandedWorkIndex: works.length - 1,
        expandedProjectIndex: projectIndex,
      ),
    );
  }

  _onRemoveWork(int projectIndex, String workId, Emitter<TechState> emit) {
    final newProjects = [...state.projects];
    final project = newProjects[projectIndex];

    final newWorks = project.works.where((w) => w.id != workId).toList();

    newProjects[projectIndex] = project.copyWith(works: newWorks);

    int? nextExpandedWorkIndex = state.expandedWorkIndex;

    // Nếu đang expand work thuộc project này
    if (state.expandedProjectIndex == projectIndex) {
      if (newWorks.isEmpty) {
        nextExpandedWorkIndex = null;
      } else if (nextExpandedWorkIndex != null &&
          nextExpandedWorkIndex >= newWorks.length) {
        nextExpandedWorkIndex = newWorks.length - 1;
      }
    }

    emit(
      state.copyWith(
        projects: newProjects,
        expandedWorkIndex: nextExpandedWorkIndex,
      ),
    );
  }

  _onExpandWork(int projectIndex, int workIndex, Emitter<TechState> emit) {
    if (projectIndex < 0 || projectIndex >= state.projects.length) return;

    final works = state.projects[projectIndex].works;

    if (workIndex < 0 || workIndex >= works.length) return; // 🛑 chặn crash

    if (state.expandedProjectIndex == projectIndex &&
        state.expandedWorkIndex == workIndex) {
      emit(
        state.copyWith(
          expandedWorkIndex: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          expandedProjectIndex: projectIndex,
          expandedWorkIndex: workIndex,
        ),
      );
    }
  }

  _onUpdateWork(
      int projectIndex,
      String workId, {
        String? totalHours,
        String? otHours,
        String? percent,
        String? content,
        String? result,
        String? category,
        required Emitter<TechState> emit,
      }) {
    final newProjects = [...state.projects];
    final project = newProjects[projectIndex];

    final newWorks = project.works.map((w) {
      if (w.id != workId) return w;

      return w.copyWith(
        category: category ?? w.category,
        totalHours: totalHours ?? w.totalHours,
        otHours: otHours ?? w.otHours,
        percent: percent ?? w.percent,
        content: content ?? w.content,
        result: result ?? w.result,
      );
    }).toList();

    newProjects[projectIndex] = project.copyWith(works: newWorks);

    emit(state.copyWith(projects: newProjects)); // 👈 bắt buộc phải emit list mới
  }

  _onUpdateDate(DateTime? date, Emitter<TechState> emit) {
    emit(state.copyWith(reportDate: date));
  }

  _onExpandProject(int projectIndex, Emitter<TechState> emit) {
    if (projectIndex < 0 || projectIndex >= state.projects.length) return;

    if (state.expandedProjectIndex == projectIndex) return;

    emit(
      state.copyWith(
        expandedProjectIndex: projectIndex,
        expandedWorkIndex: null,
      ),
    );
  }

}
