import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../common/local_data/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../../data/repository/week_plan_repo.dart';
import '../../../../../auth/data/repository/auth_repo.dart';
import '../week_plan_tab_enum.dart';

part 'week_plan_event.dart';
part 'week_plan_state.dart';
part 'week_plan_bloc.g.dart';
part 'week_plan_bloc.freezed.dart';

const _kProjectsCacheKey = 'weekplan_projects_cache';

@injectable
class WeekPlanBloc extends BaseBloc<WeekPlanEvent, WeekPlanState> {
  final WeekPlanRepo _weekPlanRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;
  final LocalStorage _localStorage;

  bool _isInitInFlight = false;

  WeekPlanBloc(
    this._weekPlanRepo,
    this._authRepo,
    this._log,
    this._localStorage,
  ) : super(WeekPlanState.init()) {
    on<WeekPlanEvent>((event, emit) async {
      await event.when(
        initMenu: () => _onInitMenu(emit),
        initScreen: () => _onInitScreen(emit),
        initScreenWithView: (viewNumber) => _onInitScreenWithView(emit, viewNumber),
        changeView: (viewNumber) => _onChangeView(emit, viewNumber),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword),
        clearSearch: () => _onClearSearch(emit),
        filterByStatus: (status) => _onFilterByStatus(emit, status),
        clearStatusFilter: () => _onClearStatusFilter(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        clearDateFilter: () => _onClearDateFilter(emit),
        checkIn: (taskId) => _onCheckIn(emit, taskId),
        initAddScreen: () => _onInitAddScreen(emit),
        changeStep: (step) => _onChangeStep(emit, step),
        updateHeaderProject: (projectId, projectName) =>
            _onUpdateHeaderProject(emit, projectId, projectName),
        updateHeaderParentTask: (parentTaskId, parentTaskName) =>
            _onUpdateHeaderParentTask(emit, parentTaskId, parentTaskName),
        updateHeaderAssigner: (assignerId, assignerName) =>
            _onUpdateHeaderAssigner(emit, assignerId, assignerName),
        updateHeaderPersonalTask: (isPersonal) =>
            _onUpdateHeaderPersonalTask(emit, isPersonal),
        updateHeaderComplexity: (complexity) =>
            _onUpdateHeaderComplexity(emit, complexity),
        updateHeaderPriority: (priority) =>
            _onUpdateHeaderPriority(emit, priority),
        updateHeaderStatus: (statusId, statusName) =>
            _onUpdateHeaderStatus(emit, statusId, statusName),
        updateHeaderTimeEstimate: (timeEstimate) =>
            _onUpdateHeaderTimeEstimate(emit, timeEstimate),
        updateHeaderTaskCategory: (categoryId, categoryName) =>
            _onUpdateHeaderTaskCategory(emit, categoryId, categoryName),
        updateHeaderWorkTypeAndStatus: (workTypeId, workTypeName, statusId, statusName) =>
            _onUpdateHeaderWorkTypeAndStatus(
                emit, workTypeId, workTypeName, statusId, statusName),
        fetchTaskTypes: () => _onFetchTaskTypes(emit),
        fetchProjects: () => _onFetchProjects(emit),
        fetchProjectTypes: () => _onFetchProjectTypes(emit),
        fetchEmployees: () => _onFetchEmployees(emit),
        updateContentTaskName: (name) => _onUpdateContentTaskName(emit, name),
        updateContentAssignee: (assigneeId, assigneeName) =>
            _onUpdateContentAssignee(emit, assigneeId, assigneeName),
        updateContentAssigner: (assignerId, assignerName) =>
            _onUpdateContentAssigner(emit, assignerId, assignerName),
        updateContentDates: (startDate, endDate, actualStartDate, actualEndDate, deadline) =>
            _onUpdateContentDates(emit, startDate, endDate, actualStartDate, actualEndDate, deadline),
        updateContentDescription: (description) =>
            _onUpdateContentDescription(emit, description),
        updateContentResult: (result) =>
            _onUpdateContentResult(emit, result),
        setAssignees: (assignees) =>
            _onSetAssignees(emit, assignees),
        addAssignee: (employee) =>
            _onAddAssignee(emit, employee),
        removeAssignee: (employeeId) =>
            _onRemoveAssignee(emit, employeeId),
        setRelatedPersons: (persons) =>
            _onSetRelatedPersons(emit, persons),
        addRelatedPerson: (employee) =>
            _onAddRelatedPerson(emit, employee),
        removeRelatedPerson: (employeeId) =>
            _onRemoveRelatedPerson(emit, employeeId),
        addSubTask: (subTask) =>
            _onAddSubTask(emit, subTask),
        updateSubTask: (index, subTask) =>
            _onUpdateSubTask(emit, index, subTask),
        removeSubTask: (index) =>
            _onRemoveSubTask(emit, index),
        addChecklistItem: (item) =>
            _onAddChecklistItem(emit, item),
        updateChecklistItem: (index, item) =>
            _onUpdateChecklistItem(emit, index, item),
        toggleChecklistDone: (index) =>
            _onToggleChecklistDone(emit, index),
        removeChecklistItem: (index) =>
            _onRemoveChecklistItem(emit, index),
        addAttachment: (attachment) =>
            _onAddAttachment(emit, attachment),
        removeAttachment: (index) =>
            _onRemoveAttachment(emit, index),
        addIncident: (incident) =>
            _onAddIncident(emit, incident),
        updateIncident: (index, incident) =>
            _onUpdateIncident(emit, index, incident),
        removeIncident: (index) =>
            _onRemoveIncident(emit, index),
        createTask: () => _onCreateTask(emit),
        clearSubmitState: () => _onClearSubmitState(emit),
      );
    });
  }

  //---(Init)---//
  Future<void> _onInitMenu(Emitter<WeekPlanState> emit) async {
    // No-op — dữ liệu projects/taskTypes được fetch bởi initScreen.
  }

  Future<void> _onInitScreen(Emitter<WeekPlanState> emit) async {
    _isInitInFlight = false;
    await _doInitScreen(emit, viewNumber: 1);
  }

  Future<void> _onInitScreenWithView(Emitter<WeekPlanState> emit, int viewNumber) async {
    _isInitInFlight = false;
    await _doInitScreen(emit, viewNumber: viewNumber);
  }

  Future<void> _doInitScreen(Emitter<WeekPlanState> emit, {required int viewNumber}) async {
    if (_isInitInFlight) return;
    _isInitInFlight = true;
    try {
      emit(state.copyWith(
        status: BaseStateStatus.loading,
        viewNumber: viewNumber,
      ));

      final userRes = await _authRepo.getCurrentUser();
      await userRes.fold(
        (err) async {
          _log.logE('Get user failed: $err');
          emit(state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (user) async {
          // Fetch projects + taskTypes nếu chưa có.
          List<ProjectTaskItem> projects = state.projects;
          List<TaskTypeItem> taskTypes = state.taskTypes;
          List<EmployeeTaskItem> employees = state.employees;

          if (projects.isEmpty) {
            final projRes = await _weekPlanRepo.getProjects();
            projRes.fold(
              (err) => _log.logE('Fetch projects failed: $err'),
              (data) {
                projects = data;
                _log.logI('Fetch projects: ${projects.length}');
              },
            );
          }

          if (taskTypes.isEmpty) {
            final typesRes = await _weekPlanRepo.getTaskTypes();
            typesRes.fold(
              (err) => _log.logE('Fetch task types failed: $err'),
              (data) {
                taskTypes = data;
                _log.logI('Fetch task types: ${taskTypes.length}');
              },
            );
          }

          if (employees.isEmpty) {
            final empRes = await _weekPlanRepo.getEmployees();
            empRes.fold(
              (err) => _log.logE('Fetch employees failed: $err'),
              (data) {
                employees = data;
                _log.logI('Fetch employees: ${employees.length}');
              },
            );
          }

          final employeeId = user?.employeeId ?? 0;
          final now = DateTime.now();
          final dateStart = state.dateStart ?? DateTime(now.year, now.month, 1);
          final dateEnd = state.dateEnd ?? DateTime(now.year, now.month + 1, 0);
          final statusFilter = _statusToApiStatus(state.selectedStatus);

          List<WeekPlanTaskItem> myTasks = state.myTasks;
          List<WeekPlanTaskItem> relatedTasks = state.relatedTasks;
          List<WeekPlanTaskItem> assignedTasks = state.assignedTasks;
          List<WeekPlanTaskItem> allTasks = state.allTasks;

          switch (viewNumber) {
            case 1:
              final res = await _weekPlanRepo.getTasks(
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: statusFilter,
                viewNumber: 1,
              );
              myTasks = res.getOrElse(() => []);
              _log.logI('Get my tasks: ${myTasks.length}');
              break;
            case 2:
              final res = await _weekPlanRepo.getTasks(
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: statusFilter,
                viewNumber: 2,
              );
              relatedTasks = res.getOrElse(() => []);
              _log.logI('Get related tasks: ${relatedTasks.length}');
              break;
            case 3:
              final res = await _weekPlanRepo.getTasks(
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: statusFilter,
                viewNumber: 3,
              );
              assignedTasks = res.getOrElse(() => []);
              _log.logI('Get assigned tasks: ${assignedTasks.length}');
              break;
            case -1:
              final res = await _weekPlanRepo.getTasks(
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: statusFilter,
                viewNumber: -1,
              );
              allTasks = res.getOrElse(() => []);
              _log.logI('Get all tasks: ${allTasks.length}');
              break;
            default:
              final res = await _weekPlanRepo.getTasks(
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: statusFilter,
                viewNumber: 1,
              );
              myTasks = res.getOrElse(() => []);
          }

          emit(state.copyWith(
            status: BaseStateStatus.success,
            employeeId: employeeId,
            projects: projects,
            taskTypes: taskTypes,
            employees: employees,
            myTasks: myTasks,
            relatedTasks: relatedTasks,
            assignedTasks: assignedTasks,
            allTasks: allTasks,
          ));
        },
      );
    } finally {
      _isInitInFlight = false;
    }
  }

  Future<void> _onChangeView(Emitter<WeekPlanState> emit, int viewNumber) async {
    await _doInitScreen(emit, viewNumber: viewNumber);
  }

  Future<void> _onRefresh(Emitter<WeekPlanState> emit) async {
    await _doInitScreen(emit, viewNumber: state.viewNumber);
  }

  //---(Filter)---//
  int _statusToApiStatus(String status) {
    switch (status) {
      case 'Chưa bắt đầu':
        return 1;
      case 'Đang thực hiện':
        return 2;
      case 'Hoàn thành':
        return 3;
      case 'Quá hạn':
        return 4;
      default:
        return 0;
    }
  }

  //---(Filter)---//
  Future<void> _onSearch(Emitter<WeekPlanState> emit, String keyword) async {
    emit(state.copyWith(searchKeyword: keyword));
    await _onInitScreen(emit);
  }

  Future<void> _onClearSearch(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(searchKeyword: ''));
    await _onInitScreen(emit);
  }

  Future<void> _onFilterByStatus(
      Emitter<WeekPlanState> emit, String status) async {
    emit(state.copyWith(selectedStatus: status));
    await _onInitScreen(emit);
  }

  Future<void> _onClearStatusFilter(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(selectedStatus: 'Tất cả'));
    await _onInitScreen(emit);
  }

  Future<void> _onChangeDateRange(
    Emitter<WeekPlanState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    emit(state.copyWith(dateStart: dateStart, dateEnd: dateEnd));
    await _onInitScreen(emit);
  }

  Future<void> _onClearDateFilter(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(dateStart: null, dateEnd: null));
    await _onInitScreen(emit);
  }

  //---(Action)---//
  Future<void> _onCheckIn(
      Emitter<WeekPlanState> emit, int taskId) async {
    _log.logI('Check-in requested for taskId=$taskId');
    emit(state.copyWith(
      message: 'Tính năng đang phát triển',
      status: BaseStateStatus.success,
    ));
  }

  //---(Add Screen)---//
  /// Init add screen — projects/taskTypes đã có sẵn trong state (fetch bởi initScreen).
  Future<void> _onInitAddScreen(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
      currentStep: 0,
      headerProjectId: null,
      headerProjectName: null,
      headerParentTaskId: null,
      headerParentTaskName: null,
      headerAssignerId: null,
      headerAssignerName: null,
      headerIsPersonalTask: false,
      headerComplexity: 1,
      headerTaskCategory: null,
      headerTaskCategoryName: null,
      headerWorkType: null,
      headerWorkTypeName: null,
      headerStatus: null,
      headerStatusName: null,
      taskName: null,
      contentAssigneeId: null,
      contentAssigneeName: null,
      contentAssignerId: null,
      contentAssignerName: null,
      contentStartDate: null,
      contentEndDate: null,
      contentActualStartDate: null,
      contentActualEndDate: null,
      contentDeadline: null,
      contentDescription: null,
      contentResult: null,
      selectedAssignees: const [],
      selectedRelatedPersons: const [],
      subTasks: const [],
      checklistItems: const [],
      checklistDone: const [],
      attachments: const [],
      incidents: const [],
    ));
  }

  Future<void> _onChangeStep(Emitter<WeekPlanState> emit, int step) async {
    if (step >= 0 && step < WeekPlanAddStep.values.length) {
      emit(state.copyWith(currentStep: step));
    }
  }

  //---(Header Form)---//
  Future<void> _onUpdateHeaderProject(
      Emitter<WeekPlanState> emit, int projectId, String projectName) async {
    emit(state.copyWith(headerProjectId: projectId, headerProjectName: projectName));
  }

  Future<void> _onUpdateHeaderParentTask(
      Emitter<WeekPlanState> emit, int parentTaskId, String parentTaskName) async {
    emit(state.copyWith(headerParentTaskId: parentTaskId, headerParentTaskName: parentTaskName));
  }

  Future<void> _onUpdateHeaderAssigner(
      Emitter<WeekPlanState> emit, int assignerId, String assignerName) async {
    emit(state.copyWith(headerAssignerId: assignerId, headerAssignerName: assignerName));
  }

  Future<void> _onUpdateHeaderPersonalTask(
      Emitter<WeekPlanState> emit, bool isPersonal) async {
    emit(state.copyWith(headerIsPersonalTask: isPersonal));
  }

  Future<void> _onUpdateHeaderComplexity(
      Emitter<WeekPlanState> emit, int complexity) async {
    emit(state.copyWith(headerComplexity: complexity));
  }

  Future<void> _onUpdateHeaderPriority(
      Emitter<WeekPlanState> emit, int priority) async {
    emit(state.copyWith(headerPriority: priority));
  }

  Future<void> _onUpdateHeaderTimeEstimate(
      Emitter<WeekPlanState> emit, double? timeEstimate) async {
    emit(state.copyWith(headerTimeEstimate: timeEstimate));
  }

  Future<void> _onUpdateHeaderTaskCategory(
      Emitter<WeekPlanState> emit, int categoryId, String categoryName) async {
    emit(state.copyWith(headerTaskCategory: categoryId, headerTaskCategoryName: categoryName));
  }

  Future<void> _onUpdateHeaderStatus(
    Emitter<WeekPlanState> emit, int statusId, String statusName) async {
    emit(state.copyWith(headerStatus: statusId, headerStatusName: statusName));
  }

  Future<void> _onUpdateHeaderWorkTypeAndStatus(
    Emitter<WeekPlanState> emit,
    int workTypeId,
    String workTypeName,
    int statusId,
    String statusName,
  ) async {
    emit(state.copyWith(
      headerWorkType: workTypeId,
      headerWorkTypeName: workTypeName,
      headerStatus: statusId,
      headerStatusName: statusName,
    ));
  }

  Future<void> _onFetchTaskTypes(Emitter<WeekPlanState> emit) async {
    final res = await _weekPlanRepo.getTaskTypes();

    await res.fold(
      (err) async {
        _log.logE('Fetch task types failed: $err');
      },
      (taskTypes) async {
        _log.logI('Fetch task types success: ${taskTypes.length}');
        // Auto-select "Task" (item đầu tiên)
        final first = taskTypes.isNotEmpty ? taskTypes.first : null;
        emit(state.copyWith(
          taskTypes: taskTypes,
          headerWorkType: first?.id,
          headerWorkTypeName: first?.typeName,
        ));
      },
    );
  }

  Future<void> _onFetchProjects(Emitter<WeekPlanState> emit) async {
    // Load cache trước — tránh UI flicker khi API chậm.
    final cached = await _loadProjectsFromCache();
    if (cached.isNotEmpty) {
      emit(state.copyWith(projects: cached));
    }

    final res = await _weekPlanRepo.getProjects();

    await res.fold(
      (err) async {
        _log.logE('Fetch projects failed: $err');
      },
      (projects) async {
        _log.logI('Fetch projects success: ${projects.length}');
        // Cache to SharedPreferences
        final maps = projects.map((p) => p.toJson()).toList();
        await _localStorage.saveProjectList(_kProjectsCacheKey, maps);
        emit(state.copyWith(projects: projects));
      },
    );
  }

  Future<void> _onFetchProjectTypes(Emitter<WeekPlanState> emit) async {
    final res = await _weekPlanRepo.getProjectTypes();

    await res.fold(
      (err) async {
        _log.logE('Fetch project types failed: $err');
      },
      (projectTypes) async {
        _log.logI('Fetch project types success: ${projectTypes.length}');
        emit(state.copyWith(projectTypes: projectTypes));
      },
    );
  }

  Future<void> _onFetchEmployees(Emitter<WeekPlanState> emit) async {
    final res = await _weekPlanRepo.getEmployees();

    await res.fold(
      (err) async {
        _log.logE('Fetch employees failed: $err');
      },
      (employees) async {
        _log.logI('Fetch employees success: ${employees.length}');
        emit(state.copyWith(employees: employees));
      },
    );
  }

  /// Load cached projects from SharedPreferences, return empty list if none.
  Future<List<ProjectTaskItem>> _loadProjectsFromCache() async {
    final cached = await _localStorage.getProjectList(_kProjectsCacheKey);
    if (cached == null) return [];
    return cached.map((m) => ProjectTaskItem.fromJson(m)).toList();
  }

  /// Clear cached projects from SharedPreferences.
  Future<void> clearProjectsCache() async {
    await _localStorage.removeProjectList(_kProjectsCacheKey);
  }

  //---(Content Step)---//
  Future<void> _onUpdateContentTaskName(Emitter<WeekPlanState> emit, String name) async {
    emit(state.copyWith(taskName: name));
  }

  Future<void> _onUpdateContentAssignee(
      Emitter<WeekPlanState> emit, int assigneeId, String assigneeName) async {
    emit(state.copyWith(contentAssigneeId: assigneeId, contentAssigneeName: assigneeName));
  }

  Future<void> _onUpdateContentAssigner(
      Emitter<WeekPlanState> emit, int assignerId, String assignerName) async {
    emit(state.copyWith(contentAssignerId: assignerId, contentAssignerName: assignerName));
  }

  Future<void> _onUpdateContentDates(
    Emitter<WeekPlanState> emit,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    DateTime? deadline,
  ) async {
    emit(state.copyWith(
      contentStartDate: startDate,
      contentEndDate: endDate,
      contentActualStartDate: actualStartDate,
      contentActualEndDate: actualEndDate,
      contentDeadline: deadline,
    ));
  }

  Future<void> _onUpdateContentDescription(
      Emitter<WeekPlanState> emit, String description) async {
    emit(state.copyWith(contentDescription: description));
  }

  Future<void> _onUpdateContentResult(
      Emitter<WeekPlanState> emit, String result) async {
    emit(state.copyWith(contentResult: result));
  }

  //---(Assignees)---//
  Future<void> _onSetAssignees(
      Emitter<WeekPlanState> emit, List<EmployeeTaskItem> assignees) async {
    emit(state.copyWith(selectedAssignees: assignees));
  }

  Future<void> _onAddAssignee(
      Emitter<WeekPlanState> emit, EmployeeTaskItem employee) async {
    final exists = state.selectedAssignees.any((e) => e.id == employee.id);
    if (!exists) {
      emit(state.copyWith(
        selectedAssignees: [...state.selectedAssignees, employee],
      ));
    }
  }

  Future<void> _onRemoveAssignee(
      Emitter<WeekPlanState> emit, int employeeId) async {
    emit(state.copyWith(
      selectedAssignees: state.selectedAssignees
          .where((e) => e.id != employeeId)
          .toList(),
    ));
  }

  //---(Related Persons)---//
  Future<void> _onSetRelatedPersons(
      Emitter<WeekPlanState> emit, List<EmployeeTaskItem> persons) async {
    emit(state.copyWith(selectedRelatedPersons: persons));
  }

  Future<void> _onAddRelatedPerson(
      Emitter<WeekPlanState> emit, EmployeeTaskItem employee) async {
    final exists = state.selectedRelatedPersons.any((e) => e.id == employee.id);
    if (!exists) {
      emit(state.copyWith(
        selectedRelatedPersons: [...state.selectedRelatedPersons, employee],
      ));
    }
  }

  Future<void> _onRemoveRelatedPerson(
      Emitter<WeekPlanState> emit, int employeeId) async {
    emit(state.copyWith(
      selectedRelatedPersons: state.selectedRelatedPersons
          .where((e) => e.id != employeeId)
          .toList(),
    ));
  }

  //---(SubTasks)---//
  Future<void> _onAddSubTask(
      Emitter<WeekPlanState> emit, WeekPlanSubTaskItem subTask) async {
    emit(state.copyWith(subTasks: [...state.subTasks, subTask]));
  }

  Future<void> _onUpdateSubTask(
      Emitter<WeekPlanState> emit, int index, WeekPlanSubTaskItem subTask) async {
    final list = List<WeekPlanSubTaskItem>.from(state.subTasks);
    if (index >= 0 && index < list.length) {
      list[index] = subTask;
      emit(state.copyWith(subTasks: list));
    }
  }

  Future<void> _onRemoveSubTask(Emitter<WeekPlanState> emit, int index) async {
    final list = List<WeekPlanSubTaskItem>.from(state.subTasks);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      emit(state.copyWith(subTasks: list));
    }
  }

  //---(Checklist)---//
  Future<void> _onAddChecklistItem(
      Emitter<WeekPlanState> emit, String item) async {
    emit(state.copyWith(
      checklistItems: [...state.checklistItems, item],
      checklistDone: [...state.checklistDone, false],
    ));
  }

  Future<void> _onUpdateChecklistItem(
      Emitter<WeekPlanState> emit, int index, String item) async {
    final items = List<String>.from(state.checklistItems);
    if (index >= 0 && index < items.length) {
      items[index] = item;
      emit(state.copyWith(checklistItems: items));
    }
  }

  Future<void> _onToggleChecklistDone(
      Emitter<WeekPlanState> emit, int index) async {
    final done = List<bool>.from(state.checklistDone);
    if (index >= 0 && index < done.length) {
      done[index] = !done[index];
      emit(state.copyWith(checklistDone: done));
    }
  }

  Future<void> _onRemoveChecklistItem(
      Emitter<WeekPlanState> emit, int index) async {
    final items = List<String>.from(state.checklistItems);
    final done = List<bool>.from(state.checklistDone);
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      if (index < done.length) done.removeAt(index);
      emit(state.copyWith(checklistItems: items, checklistDone: done));
    }
  }

  //---(Attachments)---//
  Future<void> _onAddAttachment(
      Emitter<WeekPlanState> emit, WeekPlanAttachmentItem attachment) async {
    emit(state.copyWith(attachments: [...state.attachments, attachment]));
  }

  Future<void> _onRemoveAttachment(Emitter<WeekPlanState> emit, int index) async {
    final list = List<WeekPlanAttachmentItem>.from(state.attachments);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      emit(state.copyWith(attachments: list));
    }
  }

  //---(Incidents)---//
  Future<void> _onAddIncident(
      Emitter<WeekPlanState> emit, WeekPlanIncidentItem incident) async {
    emit(state.copyWith(incidents: [...state.incidents, incident]));
  }

  Future<void> _onUpdateIncident(
      Emitter<WeekPlanState> emit, int index, WeekPlanIncidentItem incident) async {
    final list = List<WeekPlanIncidentItem>.from(state.incidents);
    if (index >= 0 && index < list.length) {
      list[index] = incident;
      emit(state.copyWith(incidents: list));
    }
  }

  Future<void> _onRemoveIncident(Emitter<WeekPlanState> emit, int index) async {
    final list = List<WeekPlanIncidentItem>.from(state.incidents);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      emit(state.copyWith(incidents: list));
    }
  }

  //---(Create)---//
  bool _isCreateTaskInFlight = false;

  Future<void> _onCreateTask(Emitter<WeekPlanState> emit) async {
    if (_isCreateTaskInFlight) return;
    _isCreateTaskInFlight = true;

    try {
      emit(state.copyWith(
        isSubmitting: true,
        submitSuccess: false,
        message: null,
      ));

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        _log.logE('Create task: no current user');
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: false,
          status: BaseStateStatus.failed,
          message: 'Không lấy được thông tin người dùng',
        ));
        return;
      }

      final payload = _buildCreatePayload(user.employeeId);

      _log.logI('Create task payload: $payload');

      final res = await _weekPlanRepo.createTask(payload: payload);

      await res.fold(
        (err) async {
          _log.logE('Create task failed: $err');
          emit(state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ));
        },
        (_) async {
          _log.logI('Create task success');
          emit(state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            status: BaseStateStatus.success,
            message: 'Tạo công việc thành công',
          ));
        },
      );
    } finally {
      _isCreateTaskInFlight = false;
    }
  }

  Map<String, dynamic> _buildCreatePayload(int userId) {
    return {
      'TaskName': state.taskName ?? '',
      'ProjectId': state.headerProjectId ?? 0,
      'ProjectName': state.headerProjectName ?? '',
      'ParentTaskId': state.headerParentTaskId,
      'ParentTaskName': state.headerParentTaskName,
      'AssignerId': state.headerAssignerId,
      'IsPersonalTask': state.headerIsPersonalTask,
      'Complexity': state.headerComplexity,
      'TaskCategory': state.headerTaskCategory ?? 0,
      'WorkType': state.headerWorkType ?? 0,
      'Status': state.headerStatus ?? 0,
      'Description': state.contentDescription ?? '',
      'Result': state.contentResult ?? '',
      'StartDate': state.contentStartDate?.toIso8601String(),
      'EndDate': state.contentEndDate?.toIso8601String(),
      'ActualStartDate': state.contentActualStartDate?.toIso8601String(),
      'ActualEndDate': state.contentActualEndDate?.toIso8601String(),
      'Deadline': state.contentDeadline?.toIso8601String(),
      'CreatorId': userId,
      'AssigneeId': state.contentAssigneeId ?? userId,
      'AssigneeIds': state.selectedAssignees.map((e) => e.id).toList(),
      'RelatedPersonIds': state.selectedRelatedPersons.map((e) => e.id).toList(),
      'SubTasks': state.subTasks.map((s) => _subTaskToPayload(s)).toList(),
      'Attachments': state.attachments.map((a) => _attachmentToPayload(a)).toList(),
      'Incidents': state.incidents.map((i) => _incidentToPayload(i)).toList(),
    };
  }

  Map<String, dynamic> _subTaskToPayload(WeekPlanSubTaskItem s) => {
    if (s.id != null) 'ID': s.id,
    'Content': s.content ?? '',
    if (s.startDate != null) 'StartDate': s.startDate!.toIso8601String(),
    if (s.endDate != null) 'EndDate': s.endDate!.toIso8601String(),
    if (s.assigneeId != null) 'AssigneeID': s.assigneeId,
    if (s.assignerId != null) 'AssignerID': s.assignerId,
    if (s.complexity != null) 'Complexity': s.complexity,
    if (s.workType != null) 'WorkType': s.workType,
    if (s.taskCategory != null) 'TaskCategory': s.taskCategory,
  };

  Map<String, dynamic> _attachmentToPayload(WeekPlanAttachmentItem a) => {
    if (a.id != null) 'ID': a.id,
    'FileName': a.fileName ?? '',
    'FilePath': a.filePath ?? '',
    if (a.fileSize != null) 'FileSize': a.fileSize,
    'FileType': a.fileType ?? '',
  };

  Map<String, dynamic> _incidentToPayload(WeekPlanIncidentItem i) => {
    if (i.id != null) 'ID': i.id,
    'Description': i.description ?? '',
    if (i.type != null) 'Type': i.type,
    if (i.severity != null) 'Severity': i.severity,
  };

  Future<void> _onClearSubmitState(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }
}
