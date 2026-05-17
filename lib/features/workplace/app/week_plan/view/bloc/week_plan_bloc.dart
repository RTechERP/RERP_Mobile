import 'dart:io';

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
        initScreenWithView: (viewNumber) =>
            _onInitScreenWithView(emit, viewNumber),
        changeView: (viewNumber) => _onChangeView(emit, viewNumber),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword),
        clearSearch: () => _onClearSearch(emit),
        filterByStatuses: (statuses) => _onFilterByStatuses(emit, statuses),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        clearDateFilter: () => _onClearDateFilter(emit),
        checkIn: (taskId, isCheck) => _onCheckIn(emit, taskId, isCheck),
        initAddScreen: () => _onInitAddScreen(emit),
        initDetailScreen: (taskId) => _onInitDetailScreen(emit, taskId),
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
        updateHeaderWorkTypeAndStatus:
            (workTypeId, workTypeName, statusId, statusName) =>
                _onUpdateHeaderWorkTypeAndStatus(
                  emit,
                  workTypeId,
                  workTypeName,
                  statusId,
                  statusName,
                ),
        fetchTaskTypes: () => _onFetchTaskTypes(emit),
        fetchProjects: () => _onFetchProjects(emit),
        fetchProjectTypes: () => _onFetchProjectTypes(emit),
        fetchEmployees: () => _onFetchEmployees(emit),
        fetchParentProjectTasks: (projectId, isPersonalProject) =>
            _onFetchParentProjectTasks(emit, projectId, isPersonalProject),
        updateContentTaskName: (name) => _onUpdateContentTaskName(emit, name),
        updateContentAssignee: (assigneeId, assigneeName) =>
            _onUpdateContentAssignee(emit, assigneeId, assigneeName),
        updateContentAssigner: (assignerId, assignerName) =>
            _onUpdateContentAssigner(emit, assignerId, assignerName),
        updateContentDates:
            (startDate, endDate, actualStartDate, actualEndDate, deadline) =>
                _onUpdateContentDates(
                  emit,
                  startDate,
                  endDate,
                  actualStartDate,
                  actualEndDate,
                  deadline,
                ),
        updateContentDescription: (description) =>
            _onUpdateContentDescription(emit, description),
        updateContentResult: (result) => _onUpdateContentResult(emit, result),
        updateContentReasonSolution: (reasonSolution) =>
            _onUpdateContentReasonSolution(emit, reasonSolution),
        setAssignees: (assignees) => _onSetAssignees(emit, assignees),
        addAssignee: (employee) => _onAddAssignee(emit, employee),
        removeAssignee: (employeeId) => _onRemoveAssignee(emit, employeeId),
        setRelatedPersons: (persons) => _onSetRelatedPersons(emit, persons),
        addRelatedPerson: (employee) => _onAddRelatedPerson(emit, employee),
        removeRelatedPerson: (employeeId) =>
            _onRemoveRelatedPerson(emit, employeeId),
        updateSubTask: (index, subTask) =>
            _onUpdateSubTask(emit, index, subTask),
        removeSubTask: (index) => _onRemoveSubTask(emit, index),
        addSubTaskWithData: (subTask) => _onAddSubTaskWithData(emit, subTask),
        addChecklistItem: (item) => _onAddChecklistItem(emit, item),
        fetchChecklists: (taskId) => _onFetchChecklists(emit, taskId),
        updateDetailChecklistItem:
            (checklistId, checklistTitle, orderIndex, isDone) =>
                _onUpdateDetailChecklistItem(
                  emit,
                  checklistId: checklistId,
                  checklistTitle: checklistTitle,
                  orderIndex: orderIndex,
                  isDone: isDone,
                ),
        updateChecklistItem: (index, item) =>
            _onUpdateChecklistItem(emit, index, item),
        toggleChecklistDone: (index) => _onToggleChecklistDone(emit, index),
        updateChecklistItemOnServer:
            (checklistId, checklistTitle, orderIndex, isDone) =>
                _onUpdateChecklistItemOnServer(
                  emit,
                  checklistId: checklistId,
                  checklistTitle: checklistTitle,
                  orderIndex: orderIndex,
                  isDone: isDone,
                ),
        removeChecklistItem: (index) => _onRemoveChecklistItem(emit, index),
        markChecklistDeleted: (checklistId) =>
            _onMarkChecklistDeleted(emit, checklistId),
        addAttachment: (attachment) => _onAddAttachment(emit, attachment),
        removeAttachment: (index) => _onRemoveAttachment(emit, index),
        addLink: (link) => _onAddLink(emit, link),
        removeLink: (index) => _onRemoveLink(emit, index),
        addIncident: () => _onAddIncident(emit),
        updateIncident: (index, incident) =>
            _onUpdateIncident(emit, index, incident),
        removeIncident: (index) => _onRemoveIncident(emit, index),
        toggleIncidentExpand: (index) => _onToggleIncidentExpand(emit, index),
        updatePauseReason: (reason) => _onUpdatePauseReason(emit, reason),
        createTask: () => _onCreateTask(emit),
        clearSubmitState: () => _onClearSubmitState(emit),
        clearCheckInState: () => _onClearCheckInState(emit),
        uploadFiles: (filePaths, subPath) =>
            _onUploadFiles(emit, filePaths, subPath),
        clearUploadedFiles: () => _onClearUploadedFiles(emit),
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

  Future<void> _onInitScreenWithView(
    Emitter<WeekPlanState> emit,
    int viewNumber,
  ) async {
    _isInitInFlight = false;
    await _doInitScreen(emit, viewNumber: viewNumber);
  }

  Future<void> _doInitScreen(
    Emitter<WeekPlanState> emit, {
    required int viewNumber,
  }) async {
    if (_isInitInFlight) return;
    _isInitInFlight = true;
    try {
      emit(
        state.copyWith(status: BaseStateStatus.loading, viewNumber: viewNumber),
      );

      final userRes = await _authRepo.getCurrentUser();
      await userRes.fold(
        (err) async {
          _log.logE('Get user failed: $err');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (user) async {
          // Fetch projects + taskTypes nếu chưa có.
          List<ProjectTaskItem> projects = state.projects;
          List<TaskTypeItem> taskTypes = state.taskTypes;
          List<EmployeeTaskItem> employees = state.employees;

          if (projects.isEmpty) {
            final projRes = await _weekPlanRepo.getProjects();
            projRes.fold((err) => _log.logE('Fetch projects failed: $err'), (
              data,
            ) {
              projects = data;
              _log.logI('Fetch projects: ${projects.length}');
            });
          }

          if (taskTypes.isEmpty) {
            final typesRes = await _weekPlanRepo.getTaskTypes();
            typesRes.fold((err) => _log.logE('Fetch task types failed: $err'), (
              data,
            ) {
              taskTypes = data;
              _log.logI('Fetch task types: ${taskTypes.length}');
            });
          }

          if (employees.isEmpty) {
            final empRes = await _weekPlanRepo.getEmployees();
            empRes.fold((err) => _log.logE('Fetch employees failed: $err'), (
              data,
            ) {
              employees = data;
              _log.logI('Fetch employees: ${employees.length}');
            });
          }

          final employeeId = user?.employeeId ?? 0;
          final now = DateTime.now();
          final monthStart = DateTime(now.year, now.month, 1);
          final monthEnd = DateTime(now.year, now.month + 1, 0);
          final dateStart = state.dateStart ?? monthStart;
          final dateEnd = state.dateEnd ?? monthEnd;
          final statusFilter = -1; // API fetch all; UI multi-select filter handled by _filterTasks client-side

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

          emit(
            state.copyWith(
              status: BaseStateStatus.success,
              employeeId: employeeId,
              projects: projects,
              taskTypes: taskTypes,
              employees: employees,
              dateStart: dateStart,
              dateEnd: dateEnd,
              myTasks: myTasks,
              relatedTasks: relatedTasks,
              assignedTasks: assignedTasks,
              allTasks: allTasks,
            ),
          );
        },
      );
    } finally {
      _isInitInFlight = false;
    }
  }

  Future<void> _onChangeView(
    Emitter<WeekPlanState> emit,
    int viewNumber,
  ) async {
    await _doInitScreen(emit, viewNumber: viewNumber);
  }

  Future<void> _onRefresh(Emitter<WeekPlanState> emit) async {
    await _doInitScreen(emit, viewNumber: state.viewNumber);
  }

  //---(Filter)---//
  int _statusToApiStatus(String status) {
    switch (status) {
      case 'Chưa làm':
        return 0;
      case 'Đang làm':
        return 1;
      case 'Hoàn thành':
        return 2;
      case 'Pending':
        return 3;
      default:
        return -1;
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

  Future<void> _onFilterByStatuses(
    Emitter<WeekPlanState> emit,
    List<String> statuses,
  ) async {
    emit(state.copyWith(selectedStatuses: statuses));
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
  bool _isCheckInInFlight = false;

  Future<void> _onCheckIn(
    Emitter<WeekPlanState> emit,
    int taskId,
    bool isCheck,
  ) async {
    if (_isCheckInInFlight) return;
    _isCheckInInFlight = true;

    try {
      emit(state.copyWith(message: null));

      final res = await _weekPlanRepo.projectTaskAttendance(
        projectTaskId: taskId,
        isCheck: isCheck,
      );

      await res.fold(
        (err) async {
          _log.logE('Check-in failed: $err');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (data) async {
          _log.logI('Check-in success');

          WeekPlanTaskItem updatedTask(WeekPlanTaskItem t) =>
              t.id == taskId ? t.copyWith(isCheck: isCheck) : t;

          emit(
            state.copyWith(
              status: BaseStateStatus.success,
              myTasks: state.myTasks.map(updatedTask).toList(),
              relatedTasks: state.relatedTasks.map(updatedTask).toList(),
              assignedTasks: state.assignedTasks.map(updatedTask).toList(),
              allTasks: state.allTasks.map(updatedTask).toList(),
              checkInSuccess: true,
              checkInTaskId: taskId,
              checkInTaskNewValue: isCheck,
            ),
          );
        },
      );
    } finally {
      _isCheckInInFlight = false;
    }
  }

  //---(Add Screen)---//
  /// Init add screen — gán current-user làm mặc định cho:
  /// - Người giao việc (headerAssigner)
  /// - Người thực hiện (selectedAssignees)
  Future<void> _onInitAddScreen(Emitter<WeekPlanState> emit) async {
    // Reset form fields về initial state
    emit(
      state.copyWith(
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
        contentReasonSolution: null,
        selectedAssignees: const [],
        selectedRelatedPersons: const [],
        subTasks: const [],
        checklistItems: const [],
        checklistDone: const [],
        attachments: const [],
        uploadedAttachmentFiles: const [],
        links: const [],
        incidents: const [],
        // projectTypes và taskTypes KHÔNG reset — là dữ liệu tĩnh, không phải form field.
      ),
    );

    // Fetch current user từ AuthRepo để set default cho người thực hiện & người giao việc
    final userRes = await _authRepo.getCurrentUser();
    await userRes.fold(
      (err) async {
        _log.logE('initAddScreen: get current user failed: $err');
      },
      (user) async {
        if (user == null) return;

        final employeeItem = EmployeeTaskItem(
          id: user.employeeId,
          userId: user.id,
          code: user.code,
          fullName: user.fullName,
          departmentId: user.departmentId,
          departmentName: user.departmentName,
        );

        final displayName = '${user.code} - ${user.fullName}';

        _log.logI('initAddScreen: current user = $displayName');

        // ignore: invalid_use_of_visible_for_testing_member
        emit(
          state.copyWith(
            headerAssignerId: user.employeeId,
            headerAssignerName: displayName,
            contentAssignerId: user.employeeId,
            contentAssignerName: displayName,
            selectedAssignees: [employeeItem],
          ),
        );
      },
    );
  }

  /// Init detail screen — gọi API GET /ProjectTask/{id} để lấy dữ liệu chi tiết.
  Future<void> _onInitDetailScreen(
    Emitter<WeekPlanState> emit,
    int taskId,
  ) async {
    emit(
      state.copyWith(
        status: BaseStateStatus.loading,
        isSubmitting: false,
        submitSuccess: false,
        message: null,
      ),
    );

    final detailRes = await _weekPlanRepo.getTaskDetail(id: taskId);

    await detailRes.fold(
      (err) async {
        _log.logE('initDetailScreen: get task detail failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (detail) async {
        _log.logI(
          'initDetailScreen: task loaded, ID=${detail.id}, Mission=${detail.mission}',
        );

        // Fetch employees list nếu chưa có
        List<EmployeeTaskItem> allEmployees = state.employees;
        if (allEmployees.isEmpty) {
          final empRes = await _weekPlanRepo.getEmployees();
          empRes.fold((_) {}, (data) {
            allEmployees = data;
          });
        }

        // Fetch người thực hiện (typeEmployee=1)
        List<EmployeeTaskItem> assignees = [];
        final assigneeRes = await _weekPlanRepo.getEmployeeByType(
          id: detail.id ?? taskId,
          typeEmployee: 1,
        );
        assigneeRes.fold((_) {}, (assigneeItems) {
          for (final item in assigneeItems) {
            final emp = allEmployees
                .where((e) => e.id == item.employeeId)
                .firstOrNull;
            if (emp != null) assignees.add(emp);
          }
        });

        // Fetch người liên quan (typeEmployee=2)
        List<EmployeeTaskItem> relatedPersons = [];
        final relatedRes = await _weekPlanRepo.getEmployeeByType(
          id: detail.id ?? taskId,
          typeEmployee: 2,
        );
        relatedRes.fold((_) {}, (relatedItems) {
          for (final item in relatedItems) {
            final emp = allEmployees
                .where((e) => e.id == item.employeeId)
                .firstOrNull;
            if (emp != null) relatedPersons.add(emp);
          }
        });

        // Fetch projects nếu chưa có để lookup name
        List<ProjectTaskItem> projects = state.projects;
        if (projects.isEmpty) {
          final projRes = await _weekPlanRepo.getProjects();
          projRes.fold((_) {}, (data) {
            projects = data;
          });
        }

        // Lookup project name
        String? projectName;
        for (final p in projects) {
          if (p.id == detail.projectId) {
            projectName = p.projectName;
            break;
          }
        }

        // Lookup work type name
        String? workTypeName;
        for (final t in state.taskTypes) {
          if (t.id == detail.projectTaskTypeID) {
            workTypeName = t.typeName;
            break;
          }
        }

        // Lookup task category name
        String? categoryName;
        for (final c in state.projectTypes) {
          if (c.id == detail.typeProjectItem) {
            categoryName = c.projectTypeName;
            break;
          }
        }

        // Lookup người giao việc
        String? assignerName;
        for (final emp in allEmployees) {
          if (emp.id == detail.employeeIdRequest) {
            assignerName = emp.fullName;
            break;
          }
        }

        // Fetch checklists từ API
        List<ChecklistWeekPlanResponse> checklists = [];
        final checklistRes = await _weekPlanRepo.getProjectTaskChecklists(
          taskId: detail.id ?? taskId,
        );
        checklistRes.fold((_) {}, (data) {
          checklists = data;
        });

        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            detailTaskId: detail.id,
            employees: allEmployees,
            // Header fields
            headerProjectId: detail.projectId,
            headerProjectName: projectName,
            headerTaskCategory: detail.typeProjectItem,
            headerTaskCategoryName: categoryName,
            headerWorkType: detail.projectTaskTypeID,
            headerWorkTypeName: workTypeName,
            headerStatus: detail.status,
            headerStatusName: _statusText(detail.status),
            headerPriority: detail.priority ?? 0,
            headerTimeEstimate: detail.estimatedTime,
            headerIsPersonalTask: detail.isPersonalProject ?? false,
            headerComplexity: detail.taskComplexity ?? 1,
            headerParentTaskId: detail.parentId,
            // Content fields
            taskName: detail.mission,
            contentDescription: detail.description,
            contentResult: detail.projectTaskResult,
            contentReasonSolution: detail.descriptionSolution,
            contentStartDate: detail.planStartDate,
            contentEndDate: detail.planEndDate,
            contentActualStartDate: detail.actualStartDate,
            contentActualEndDate: detail.actualEndDate,
            contentDeadline: detail.deadline,
            // Người giao / thực hiện
            headerAssignerId: detail.employeeIdRequest,
            headerAssignerName: assignerName,
            contentAssignerId: detail.employeeIdRequest,
            contentAssignerName: assignerName,
            // Người thực hiện & người liên quan
            selectedAssignees: assignees,
            selectedRelatedPersons: relatedPersons,
            detailChecklists: checklists,
          ),
        );
      },
    );
  }

  String _statusText(int? status) {
    switch (status) {
      case 0:
        return 'Chưa làm';
      case 1:
        return 'Đang làm';
      case 2:
        return 'Hoàn thành';
      case 3:
        return 'Tạm hoãn';
      default:
        return 'Chưa làm';
    }
  }

  Future<void> _onChangeStep(Emitter<WeekPlanState> emit, int step) async {
    if (step >= 0 && step < WeekPlanAddStep.values.length) {
      emit(state.copyWith(currentStep: step));
    }
  }

  //---(Header Form)---//
  Future<void> _onUpdateHeaderProject(
    Emitter<WeekPlanState> emit,
    int projectId,
    String projectName,
  ) async {
    emit(
      state.copyWith(
        headerProjectId: projectId,
        headerProjectName: projectName,
      ),
    );

    // Gọi API lấy công việc cha khi user chọn dự án
    if (projectId > 0) {
      await _onFetchParentProjectTasks(
        emit,
        projectId,
        state.headerIsPersonalTask,
      );
    }
  }

  Future<void> _onFetchParentProjectTasks(
    Emitter<WeekPlanState> emit,
    int projectId,
    bool isPersonalProject,
  ) async {
    final res = await _weekPlanRepo.getParentProjectTasks(
      projectId: projectId,
      isPersonalProject: isPersonalProject,
    );

    await res.fold(
      (err) async {
        _log.logE('Fetch parent tasks failed: $err');
        emit(state.copyWith(parentProjectTasks: const []));
      },
      (parentTasks) async {
        _log.logI('Fetch parent tasks success: ${parentTasks.length}');
        emit(state.copyWith(parentProjectTasks: parentTasks));
      },
    );
  }

  Future<void> _onUpdateHeaderParentTask(
    Emitter<WeekPlanState> emit,
    int parentTaskId,
    String parentTaskName,
  ) async {
    emit(
      state.copyWith(
        headerParentTaskId: parentTaskId,
        headerParentTaskName: parentTaskName,
      ),
    );
  }

  Future<void> _onUpdateHeaderAssigner(
    Emitter<WeekPlanState> emit,
    int assignerId,
    String assignerName,
  ) async {
    emit(
      state.copyWith(
        headerAssignerId: assignerId,
        headerAssignerName: assignerName,
      ),
    );
  }

  Future<void> _onUpdateHeaderPersonalTask(
    Emitter<WeekPlanState> emit,
    bool isPersonal,
  ) async {
    emit(state.copyWith(headerIsPersonalTask: isPersonal));
  }

  Future<void> _onUpdateHeaderComplexity(
    Emitter<WeekPlanState> emit,
    int complexity,
  ) async {
    emit(state.copyWith(headerComplexity: complexity));
  }

  Future<void> _onUpdateHeaderPriority(
    Emitter<WeekPlanState> emit,
    int priority,
  ) async {
    emit(state.copyWith(headerPriority: priority));
  }

  Future<void> _onUpdateHeaderTimeEstimate(
    Emitter<WeekPlanState> emit,
    double? timeEstimate,
  ) async {
    emit(state.copyWith(headerTimeEstimate: timeEstimate));
  }

  Future<void> _onUpdateHeaderTaskCategory(
    Emitter<WeekPlanState> emit,
    int categoryId,
    String categoryName,
  ) async {
    emit(
      state.copyWith(
        headerTaskCategory: categoryId,
        headerTaskCategoryName: categoryName,
      ),
    );
  }

  Future<void> _onUpdateHeaderStatus(
    Emitter<WeekPlanState> emit,
    int statusId,
    String statusName,
  ) async {
    emit(state.copyWith(headerStatus: statusId, headerStatusName: statusName));
  }

  Future<void> _onUpdateHeaderWorkTypeAndStatus(
    Emitter<WeekPlanState> emit,
    int workTypeId,
    String workTypeName,
    int statusId,
    String statusName,
  ) async {
    emit(
      state.copyWith(
        headerWorkType: workTypeId,
        headerWorkTypeName: workTypeName,
        headerStatus: statusId,
        headerStatusName: statusName,
      ),
    );
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
        emit(
          state.copyWith(
            taskTypes: taskTypes,
            headerWorkType: first?.id,
            headerWorkTypeName: first?.typeName,
          ),
        );
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

  //---(Fetch Checklists)---//
  Future<void> _onFetchChecklists(
    Emitter<WeekPlanState> emit,
    int taskId,
  ) async {
    final res = await _weekPlanRepo.getProjectTaskChecklists(taskId: taskId);

    await res.fold(
      (err) async {
        _log.logE('Fetch checklists failed: $err');
        emit(state.copyWith(detailChecklists: const []));
      },
      (checklists) async {
        _log.logI('Fetch checklists success: ${checklists.length}');
        emit(state.copyWith(detailChecklists: checklists));
      },
    );
  }

  /// Cap nhat local state cua detail checklist (toggle/edit).
  /// Chi cap nhat state, KHONG goi API.
  /// API chi duoc goi khi nguoi bam nut "Cap nhat" trong _onCreateTask.
  Future<void> _onUpdateDetailChecklistItem(
    Emitter<WeekPlanState> emit, {
    required int checklistId,
    String? checklistTitle,
    int? orderIndex,
    bool? isDone,
  }) async {
    final list = List<ChecklistWeekPlanResponse>.from(state.detailChecklists);
    final idx = list.indexWhere((c) => c.id == checklistId);
    if (idx < 0) return;

    final current = list[idx];
    list[idx] = ChecklistWeekPlanResponse(
      id: current.id,
      projectTaskId: current.projectTaskId,
      checklistTitle: checklistTitle ?? current.checklistTitle,
      orderIndex: orderIndex ?? current.orderIndex,
      isDone: isDone ?? current.isDone,
      createdBy: current.createdBy,
      createdDate: current.createdDate,
      updatedBy: current.updatedBy,
      updatedDate: current.updatedDate,
      isDeleted: current.isDeleted,
    );
    emit(state.copyWith(detailChecklists: list));
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
  Future<void> _onUpdateContentTaskName(
    Emitter<WeekPlanState> emit,
    String name,
  ) async {
    emit(state.copyWith(taskName: name));
  }

  Future<void> _onUpdateContentAssignee(
    Emitter<WeekPlanState> emit,
    int assigneeId,
    String assigneeName,
  ) async {
    emit(
      state.copyWith(
        contentAssigneeId: assigneeId,
        contentAssigneeName: assigneeName,
      ),
    );
  }

  Future<void> _onUpdateContentAssigner(
    Emitter<WeekPlanState> emit,
    int assignerId,
    String assignerName,
  ) async {
    emit(
      state.copyWith(
        contentAssignerId: assignerId,
        contentAssignerName: assignerName,
      ),
    );
  }

  Future<void> _onUpdateContentDates(
    Emitter<WeekPlanState> emit,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    DateTime? deadline,
  ) async {
    emit(
      state.copyWith(
        contentStartDate: startDate,
        contentEndDate: endDate,
        contentActualStartDate: actualStartDate,
        contentActualEndDate: actualEndDate,
        contentDeadline: deadline,
      ),
    );
  }

  Future<void> _onUpdateContentDescription(
    Emitter<WeekPlanState> emit,
    String description,
  ) async {
    emit(state.copyWith(contentDescription: description));
  }

  Future<void> _onUpdateContentResult(
    Emitter<WeekPlanState> emit,
    String result,
  ) async {
    emit(state.copyWith(contentResult: result));
  }

  Future<void> _onUpdateContentReasonSolution(
    Emitter<WeekPlanState> emit,
    String reasonSolution,
  ) async {
    emit(state.copyWith(contentReasonSolution: reasonSolution));
  }

  // Bug: projectTaskTypeID == 2 (1=Task, 2=Bug, 3=Issue Log).
  bool _isBugTaskType(WeekPlanState s) {
    return s.headerWorkType == 2;
  }

  //---(Assignees)---//
  Future<void> _onSetAssignees(
    Emitter<WeekPlanState> emit,
    List<EmployeeTaskItem> assignees,
  ) async {
    emit(state.copyWith(selectedAssignees: assignees));
  }

  Future<void> _onAddAssignee(
    Emitter<WeekPlanState> emit,
    EmployeeTaskItem employee,
  ) async {
    final exists = state.selectedAssignees.any((e) => e.id == employee.id);
    if (!exists) {
      emit(
        state.copyWith(
          selectedAssignees: [...state.selectedAssignees, employee],
        ),
      );
    }
  }

  Future<void> _onRemoveAssignee(
    Emitter<WeekPlanState> emit,
    int employeeId,
  ) async {
    emit(
      state.copyWith(
        selectedAssignees: state.selectedAssignees
            .where((e) => e.id != employeeId)
            .toList(),
      ),
    );
  }

  //---(Related Persons)---//
  Future<void> _onSetRelatedPersons(
    Emitter<WeekPlanState> emit,
    List<EmployeeTaskItem> persons,
  ) async {
    emit(state.copyWith(selectedRelatedPersons: persons));
  }

  Future<void> _onAddRelatedPerson(
    Emitter<WeekPlanState> emit,
    EmployeeTaskItem employee,
  ) async {
    final exists = state.selectedRelatedPersons.any((e) => e.id == employee.id);
    if (!exists) {
      emit(
        state.copyWith(
          selectedRelatedPersons: [...state.selectedRelatedPersons, employee],
        ),
      );
    }
  }

  Future<void> _onRemoveRelatedPerson(
    Emitter<WeekPlanState> emit,
    int employeeId,
  ) async {
    emit(
      state.copyWith(
        selectedRelatedPersons: state.selectedRelatedPersons
            .where((e) => e.id != employeeId)
            .toList(),
      ),
    );
  }

  //---(SubTasks)---//
  Future<void> _onAddSubTaskWithData(
    Emitter<WeekPlanState> emit,
    WeekPlanSubTaskItem subTask,
  ) async {
    emit(state.copyWith(subTasks: [...state.subTasks, subTask]));
  }

  Future<void> _onUpdateSubTask(
    Emitter<WeekPlanState> emit,
    int index,
    WeekPlanSubTaskItem subTask,
  ) async {
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
    Emitter<WeekPlanState> emit,
    String item,
  ) async {
    emit(
      state.copyWith(
        checklistItems: [...state.checklistItems, item],
        checklistDone: [...state.checklistDone, false],
      ),
    );
  }

  Future<void> _onUpdateChecklistItem(
    Emitter<WeekPlanState> emit,
    int index,
    String item,
  ) async {
    final items = List<String>.from(state.checklistItems);
    if (index >= 0 && index < items.length) {
      items[index] = item;
      emit(state.copyWith(checklistItems: items));
    }
  }

  Future<void> _onToggleChecklistDone(
    Emitter<WeekPlanState> emit,
    int index,
  ) async {
    final done = List<bool>.from(state.checklistDone);
    if (index >= 0 && index < done.length) {
      done[index] = !done[index];
      emit(state.copyWith(checklistDone: done));
    }
  }

  Future<void> _onRemoveChecklistItem(
    Emitter<WeekPlanState> emit,
    int index,
  ) async {
    final items = List<String>.from(state.checklistItems);
    final done = List<bool>.from(state.checklistDone);
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      if (index < done.length) done.removeAt(index);
      emit(state.copyWith(checklistItems: items, checklistDone: done));
    }
  }

  Future<void> _onMarkChecklistDeleted(
    Emitter<WeekPlanState> emit,
    int checklistId,
  ) async {
    if (state.deletedChecklistIds.contains(checklistId)) return;
    final deleted = [...state.deletedChecklistIds, checklistId];
    final remaining = state.detailChecklists
        .where((c) => c.id != checklistId)
        .toList();
    emit(
      state.copyWith(deletedChecklistIds: deleted, detailChecklists: remaining),
    );
  }

  Future<void> _onUpdateChecklistItemOnServer(
    Emitter<WeekPlanState> emit, {
    required int checklistId,
    required String checklistTitle,
    required int orderIndex,
    required bool isDone,
  }) async {
    final checklistRes = await _weekPlanRepo.updateProjectTaskChecklists(
      id: checklistId,
      payload: {
        'ID': checklistId,
        'ChecklistTitle': checklistTitle,
        'OrderIndex': orderIndex,
        'IsDone': isDone,
      },
    );

    await checklistRes.fold(
      (err) async {
        _log.logE('Update checklist failed: $err');
      },
      (data) async {
        _log.logI('Update checklist success: $checklistTitle, isDone=$isDone');
        final list = List<ChecklistWeekPlanResponse>.from(
          state.detailChecklists,
        );
        final idx = list.indexWhere((c) => c.id == checklistId);
        if (idx >= 0) {
          list[idx] = data;
          emit(state.copyWith(detailChecklists: list));
        }
      },
    );
  }

  //---(Attachments)---//
  Future<void> _onAddAttachment(
    Emitter<WeekPlanState> emit,
    WeekPlanAttachmentItem attachment,
  ) async {
    emit(state.copyWith(attachments: [...state.attachments, attachment]));
  }

  Future<void> _onRemoveAttachment(
    Emitter<WeekPlanState> emit,
    int index,
  ) async {
    final list = List<WeekPlanAttachmentItem>.from(state.attachments);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      emit(state.copyWith(attachments: list));
    }
  }

  //---(Links)---//
  Future<void> _onAddLink(
    Emitter<WeekPlanState> emit,
    WeekPlanLinkItem link,
  ) async {
    emit(state.copyWith(links: [...state.links, link]));
  }

  Future<void> _onRemoveLink(Emitter<WeekPlanState> emit, int index) async {
    final list = List<WeekPlanLinkItem>.from(state.links);
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      emit(state.copyWith(links: list));
    }
  }

  //---(Incidents)---//
  Future<void> _onAddIncident(Emitter<WeekPlanState> emit) async {
    emit(
      state.copyWith(
        incidents: [
          ...state.incidents,
          WeekPlanIncidentItem(reportedAt: DateTime.now()),
        ],
        expandedIncidentIndex: state.incidents.length,
      ),
    );
  }

  Future<void> _onToggleIncidentExpand(
    Emitter<WeekPlanState> emit,
    int index,
  ) async {
    final newIndex = state.expandedIncidentIndex == index ? -1 : index;
    emit(state.copyWith(expandedIncidentIndex: newIndex));
  }

  Future<void> _onUpdatePauseReason(
    Emitter<WeekPlanState> emit,
    String? reason,
  ) async {
    emit(state.copyWith(pauseReason: reason));
  }

  Future<void> _onUpdateIncident(
    Emitter<WeekPlanState> emit,
    int index,
    WeekPlanIncidentItem incident,
  ) async {
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
      emit(
        state.copyWith(isSubmitting: true, submitSuccess: false, message: null),
      );

      final userRes = await _authRepo.getCurrentUser();
      final user = userRes.getOrElse(() => null);

      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: false,
            status: BaseStateStatus.failed,
            message: 'Không lấy được thông tin người dùng',
          ),
        );
        return;
      }

      // Upload file đính kèm trước nếu có file local (chưa upload)
      List<String> filePathsToUpload = state.attachments
          .where((a) => a.filePath != null && a.filePath!.isNotEmpty)
          .where((a) {
            // Chỉ upload những file local (không phải URL đã upload trước đó)
            final path = a.filePath!;
            return path.startsWith('/') || path.startsWith('file://');
          })
          .map((a) => a.filePath!)
          .toList();

      if (filePathsToUpload.isNotEmpty) {
        final files = filePathsToUpload.map((p) => File(p)).toList();

        final uploadRes = await _weekPlanRepo.uploadAttachmentFile(
          files: files,
          key: 'ProjectTask',
          subPath: '',
        );

        await uploadRes.fold(
          (err) async {
            emit(
              state.copyWith(
                isSubmitting: false,
                submitSuccess: false,
                status: BaseStateStatus.failed,
                message: 'Upload file thất bại: ${err.getErrorMessage}',
              ),
            );
            return;
          },
          (uploaded) async {
            emit(state.copyWith(uploadedAttachmentFiles: uploaded));
          },
        );
      }

      final payload = _buildCreatePayload(user.employeeId);

      final res = await _weekPlanRepo.saveTask(payload: payload);

      await res.fold(
        (err) async {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: false,
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (data) async {
          _log.logI('Create task success, ID: ${data.id}');
          emit(
            state.copyWith(
              isSubmitting: false,
              submitSuccess: true,
              status: BaseStateStatus.success,
              message: 'Tạo công việc thành công',
            ),
          );

          // Gọi ngầm saveSubTask cho từng công việc con sau khi tạo task cha thành công.
          if (state.subTasks.isNotEmpty && data.id != null) {
            for (final subTask in state.subTasks) {
              final subPayload = _subTaskToChildPayload(
                subTask,
                parentId: data.id!,
                projectId: state.headerProjectId ?? 0,
                assignerId: state.headerAssignerId ?? user.employeeId,
              );
              _log.logI('Saving subtask: ${subTask.content ?? ""}');

              // ignore: invalid_use_of_visible_for_testing_member
              await _weekPlanRepo.saveSubTask(payload: subPayload);
            }
            _log.logI('All subtasks saved for task ID: ${data.id}');
          }

          // Gọi ngầm saveProjectTaskFiles cho từng file đã upload.
          final uploaded = state.uploadedAttachmentFiles;
          if (uploaded.isNotEmpty && data.id != null) {
            for (final file in uploaded) {
              final filePayload = {
                'ID': 0,
                'ProjectTaskID': data.id,
                'FileName': file.originalFileName,
                'FilePath': file.filePath,
                'IsDeleted': false,
              };
              _log.logI('Saving file: ${file.originalFileName}');

              // ignore: invalid_use_of_visible_for_testing_member
              await _weekPlanRepo.saveProjectTaskFiles(payload: filePayload);
            }
            _log.logI('All files saved for task ID: ${data.id}');
          }

          // Gọi ngầm saveProjectTaskChecklists cho từng checklist đã nhập nội dung.
          final checklistItems = state.checklistItems
              .asMap()
              .entries
              .where((e) => e.value.isNotEmpty)
              .toList();
          if (checklistItems.isNotEmpty && data.id != null) {
            for (final entry in checklistItems) {
              final idx = entry.key;
              final title = entry.value;
              final isDone = idx < state.checklistDone.length
                  ? state.checklistDone[idx]
                  : false;
              final checklistPayload = {
                'ProjectTaskID': data.id,
                'ChecklistTitle': title,
                'OrderIndex': idx + 1,
                'IsDone': isDone,
                'IsDeleted': false,
                'CreatedBy': null,
                'UpdatedBy': null,
              };
              _log.logI('Saving checklist: $title');

              // ignore: invalid_use_of_visible_for_testing_member
              await _weekPlanRepo.saveProjectTaskChecklists(
                payload: checklistPayload,
              );
            }
            _log.logI('All checklists saved for task ID: ${data.id}');
          }

          // Sync cac thay doi local (toggle/edit) cua detail checklists.
          for (final item in state.detailChecklists) {
            if (item.id == null || item.id == 0) continue;

            _log.logI(
              'Syncing checklist ID=${item.id}: "${item.checklistTitle}", isDone=${item.isDone}',
            );
            // ignore: invalid_use_of_visible_for_testing_member
            await _weekPlanRepo.updateProjectTaskChecklists(
              id: item.id!,
              payload: {
                'ID': item.id,
                'ChecklistTitle': item.checklistTitle ?? '',
                'OrderIndex': item.orderIndex ?? 1,
                'IsDone': item.isDone ?? false,
              },
            );
          }
          _log.logI('All detail checklists synced for task ID: ${data.id}');

          // Xoa checklist da duoc mark xoa boi user.
          for (final checklistId in state.deletedChecklistIds) {
            _log.logI('Deleting checklist ID: $checklistId');
            // ignore: invalid_use_of_visible_for_testing_member
            await _weekPlanRepo.deleteProjectTaskChecklists(id: checklistId);
          }
          _log.logI('All deleted checklists removed for task ID: ${data.id}');
          emit(state.copyWith(deletedChecklistIds: const []));

          // Gọi ngầm saveProjectTaskLinks cho từng link đã nhập.
          if (state.links.isNotEmpty && data.id != null) {
            for (final link in state.links) {
              final linkPayload = {
                'ID': 0,
                'ProjectTaskID': data.id,
                'FileName': link.fileName ?? '',
                'FilePath': link.filePath ?? '',
                'IsDeleted': false,
              };
              _log.logI('Saving link: ${link.fileName}');

              // ignore: invalid_use_of_visible_for_testing_member
              await _weekPlanRepo.saveProjectTaskLinks(payload: linkPayload);
            }
            _log.logI('All links saved for task ID: ${data.id}');
          }

          // Gọi ngầm saveProjectTaskAdditional cho từng sự phát sinh.
          _log.logI('Incidents state count: ${state.incidents.length}');
          for (int i = 0; i < state.incidents.length; i++) {
            _log.logI(
              'Incident[$i] description: "${state.incidents[i].description}"',
            );
          }
          final incidents = state.incidents
              .where((i) => i.description?.isNotEmpty == true)
              .toList();
          _log.logI(
            'Incidents with description: ${incidents.length}, taskID: ${data.id}',
          );
          if (incidents.isNotEmpty && data.id != null) {
            for (final incident in incidents) {
              final additionalPayload = {
                'ID': incident.id ?? 0,
                'ProjectTaskID': data.id,
                'Description': incident.description ?? '',
                'IsDeleted': false,
              };
              _log.logI('Saving additional: "${incident.description}"');

              // ignore: invalid_use_of_visible_for_testing_member
              final additionalRes = await _weekPlanRepo
                  .saveProjectTaskAdditional(payload: additionalPayload);
              additionalRes.fold(
                (err) => _log.logE(
                  'Additional save failed for "${incident.description}": $err',
                ),
                (_) => _log.logI('Additional saved: "${incident.description}"'),
              );
            }
            _log.logI('All additional saved for task ID: ${data.id}');
          } else {
            _log.logI('Additional skip: no incidents with description');
          }
        },
      );
    } finally {
      _isCreateTaskInFlight = false;
    }
  }

  Map<String, dynamic> _buildCreatePayload(int userId) {
    final employeeIds = state.selectedAssignees
        .where((e) => e.id != null)
        .map((e) => e.id!)
        .toList();

    final employeeRelateIds = state.selectedRelatedPersons
        .where((e) => e.id != null)
        .map((e) => e.id!)
        .toList();

    return {
      'ID': state.detailTaskId ?? 0,
      'Mission': state.taskName ?? '',
      'PlanStartDate': state.contentStartDate?.toIso8601String(),
      'PlanEndDate': state.contentEndDate?.toIso8601String(),
      'EmployeeIDRequest': state.headerAssignerId ?? userId,
      'TypeProjectItem': state.headerTaskCategory ?? 0,
      'Employee': employeeIds,
      'Status': state.headerStatus ?? 0,
      'ProjectID': state.headerProjectId ?? 0,
      'ActualStartDate': state.contentActualStartDate?.toIso8601String(),
      'ActualEndDate': state.contentActualEndDate?.toIso8601String(),
      'EmployeeRelate': employeeRelateIds,
      'IsPersonalProject': state.headerIsPersonalTask,
      'ParentID': state.headerParentTaskId,
      'ProjectTaskTypeID': state.headerWorkType ?? 0,
      'Priority': state.headerPriority > 0 ? state.headerPriority : 1,
      'EstimatedTime': state.headerTimeEstimate,
      'NeedApprove': !state.headerIsPersonalTask,
      'Description': state.contentDescription ?? '',
      if (_isBugTaskType(state))
        'DescriptionSolution': state.contentReasonSolution ?? '',
      'PauseReason': state.pauseReason,
      'ProjectTaskChecklists': <int>[],
      'Links': <int>[],
      'Files': <int>[],
    };
  }

  Map<String, dynamic> _subTaskToChildPayload(
    WeekPlanSubTaskItem s, {
    required int parentId,
    required int projectId,
    required int assignerId,
  }) => {
    'ID': 0,
    'ProjectID': projectId,
    'Mission': s.content ?? '',
    if (s.startDate != null) 'PlanStartDate': s.startDate!.toIso8601String(),
    if (s.endDate != null) 'PlanEndDate': s.endDate!.toIso8601String(),
    'ParentID': parentId,
    'TypeProjectItem': s.workType ?? state.headerWorkType ?? 0,
    'EmployeeIDRequest': assignerId,
    'EmployeeAssigneeID': s.assigneeId,
    'TaskComplexity': s.complexity ?? 1,
    'ProjectTaskTypeID': s.taskCategory ?? state.headerTaskCategory ?? 0,
    'IsDeletedFromParent': false,
  };

  Future<void> _onClearSubmitState(Emitter<WeekPlanState> emit) async {
    emit(
      state.copyWith(isSubmitting: false, submitSuccess: false, message: null),
    );
  }

  _onClearCheckInState(Emitter<WeekPlanState> emit) {
    emit(
      state.copyWith(
        checkInSuccess: false,
        checkInTaskId: null,
        checkInTaskNewValue: null,
      ),
    );
  }

  //---(Upload Files)---//
  bool _isUploadInFlight = false;

  Future<void> _onUploadFiles(
    Emitter<WeekPlanState> emit,
    List<String> filePaths,
    String subPath,
  ) async {
    if (_isUploadInFlight || filePaths.isEmpty) return;
    _isUploadInFlight = true;

    try {
      final files = filePaths.map((p) => File(p)).toList();

      final res = await _weekPlanRepo.uploadAttachmentFile(
        files: files,
        key: 'ProjectTask',
        subPath: subPath,
      );

      await res.fold(
        (err) async {
          _log.logE('Upload files failed: $err');
          emit(
            state.copyWith(
              status: BaseStateStatus.failed,
              message: err.getErrorMessage,
            ),
          );
        },
        (uploaded) async {
          _log.logI('Upload files success: ${uploaded.length}');
          emit(state.copyWith(uploadedAttachmentFiles: uploaded));
        },
      );
    } finally {
      _isUploadInFlight = false;
    }
  }

  Future<void> _onClearUploadedFiles(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(uploadedAttachmentFiles: const []));
  }
}
