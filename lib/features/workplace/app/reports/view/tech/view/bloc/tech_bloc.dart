import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
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
  final _uuid = const Uuid();
  TechBloc(this._reportRepo, this._log) : super(TechState.init()) {
    on<TechEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),

        loadReport: (
            dateStart,
            dateEnd,
            teamId,
            userId,
            departmentId,
            keyword,
            ) =>
            _onLoadReport(
              dateStart,
              dateEnd,
              teamId,
              userId,
              departmentId,
              keyword,
              emit,
            ),

        addProject: () => _onAddProject(emit),
        removeProject: (projectId) => _onRemoveProject(projectId, emit),
        selectProject: (index, name) => _onSelectProject(index, name, emit),
        expandProject: (index) => _onExpandProject(index, emit),

        addWork: (projectIndex) => _onAddWork(projectIndex, emit),
        removeWork: (projectIndex, workId) =>
            _onRemoveWork(projectIndex, workId, emit),
        expandWork: (projectIndex, workIndex) =>
            _onExpandWork(projectIndex, workIndex, emit),

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

        updateDate: (date) => _onUpdateDate(date, emit),
        updateLocation: (type, value) =>
            _onUpdateLocation(type, value, emit),
        updateExtraInfo: (
            issue,
            solution,
            blocking,
            blockingReason,
            nextPlan,
            ) =>
            _onUpdateExtraInfo(
              issue: issue,
              solution: solution,
              blocking: blocking,
              blockingReason: blockingReason,
              nextPlan: nextPlan,
              emit: emit,
            ),
      );
    });
  }

  // _onInit(Emitter<TechState> emit) async {
  //   emit(state.copyWith(status: BaseStateStatus.loading));
  //
  //   emit(
  //     state.copyWith(
  //       status: BaseStateStatus.success,
  //       projects: [
  //         TechProject(
  //           id: _uuid.v4(),
  //           categories: const [TechCategory()],
  //         ),
  //       ],
  //       expandedProjectIndex: 0,
  //     ),
  //   );
  // }

  Future<void> _onInit(Emitter<TechState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    if (emit.isDone) return;

    emit(
      state.copyWith(
        status: BaseStateStatus.init,
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
    if (workIndex < 0 || workIndex >= works.length) return;

    final isSame =
        state.expandedProjectIndex == projectIndex &&
            state.expandedWorkIndex == workIndex;

    emit(
      state.copyWith(
        expandedProjectIndex: isSame ? null : projectIndex,
        expandedWorkIndex: isSame ? null : workIndex,
      ),
    );
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

   _onUpdateLocation(String type, String? value, Emitter<TechState> emit) {
    emit(
      state.copyWith(
        locationType: type,
        location: type == 'rtc' ? 'VP RTC' : value,
      ),
    );
  }

  _onUpdateExtraInfo({
    String? issue,
    String? solution,
    String? blocking,
    String? blockingReason,
    String? nextPlan,
    required Emitter<TechState> emit,
  }) {
    emit(
      state.copyWith(
        issue: issue ?? state.issue,
        solution: solution ?? state.solution,
        blocking: blocking ?? state.blocking,
        blockingReason: blockingReason ?? state.blockingReason,
        nextPlan: nextPlan ?? state.nextPlan,
      ),
    );
  }

  Future<void> _onLoadReport(
      DateTime dateStart,
      DateTime dateEnd,
      int teamId,
      int userId,
      int departmentId,
      String? keyword,
      Emitter<TechState> emit,
      ) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    final res = await _reportRepo.getDailyReportTech(
      dateStart: dateStart,
      dateEnd: dateEnd,
      teamId: teamId,
      userId: userId,
      departmentId: departmentId,
      keyword: keyword,
    );

    await res.fold(
          (l) async {
        if (emit.isDone) return;

        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: l.getErrorMessage,
          ),
        );
      },
          (r) async {
        if (emit.isDone) return;

        final projects = _mapReportsToProjects(r);


        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            projects: projects,
            reportDate: dateStart,
          ),
        );
      },
    );
  }
}

List<TechProject> _mapReportsToProjects(List<ReportResponse> reports) {
  final Map<String, List<ReportResponse>> grouped = {};

  for (final r in reports) {
    final key = r.projectText.isNotEmpty
        ? r.projectText
        : 'Không báo cáo';

    grouped.putIfAbsent(key, () => []).add(r);
  }

  return grouped.entries.map((entry) {
    final works = entry.value.map((r) {
      return TechWork(
        id: const Uuid().v4(),
        category: r.projectItemCode,
        totalHours: r.totalHours.toString(),
        otHours: (r.totalHourOT ?? 0).toString(),
        percent: r.percentComplete.toString(),
        content: r.content,
        result: r.results,
        date: r.dateReport,
      );
    }).toList();

    return TechProject(
      id: const Uuid().v4(),
      name: entry.key,
      categories: [
        TechCategory(
          category: entry.key,
          works: works,
        ),
      ],
    );
  }).toList();
}
