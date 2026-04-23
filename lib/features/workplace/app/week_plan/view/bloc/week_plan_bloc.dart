import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

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

/// Employee đơn giản — dùng cho multi-select ở step 2 & 3.
/// KHÔNG phải @freezed vì không cần JSON serialization.
class WeekPlanEmployee {
  const WeekPlanEmployee({
    required this.id,
    required this.code,
    required this.fullName,
    this.departmentName,
    this.avatarUrl,
  });

  final int id;
  final String code;
  final String fullName;
  final String? departmentName;
  final String? avatarUrl;

  String get displayText => '$code - $fullName';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekPlanEmployee &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@injectable
class WeekPlanBloc extends BaseBloc<WeekPlanEvent, WeekPlanState> {
  final WeekPlanRepo _weekPlanRepo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  bool _isInitInFlight = false;

  WeekPlanBloc(this._weekPlanRepo, this._authRepo, this._log)
      : super(WeekPlanState.init()) {
    on<WeekPlanEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _onRefresh(emit),
        search: (keyword) => _onSearch(emit, keyword),
        clearSearch: () => _onClearSearch(emit),
        filterByStatus: (status) => _onFilterByStatus(emit, status),
        clearStatusFilter: () => _onClearStatusFilter(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart, dateEnd),
        clearDateFilter: () => _onClearDateFilter(emit),
        checkIn: (taskId) => _onCheckIn(emit, taskId),
        initAdd: () => _onInitAdd(emit),
        changeStep: (step) => _onChangeStep(emit, step),
        updateHeaderProject: (projectId, projectName) =>
            _onUpdateHeaderProject(emit, projectId, projectName),
        updateHeaderParentTask: (parentTaskId, parentTaskName) =>
            _onUpdateHeaderParentTask(emit, parentTaskId, parentTaskName),
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
  Future<void> _onInit(Emitter<WeekPlanState> emit) async {
    if (_isInitInFlight) return;
    _isInitInFlight = true;

    try {
      emit(state.copyWith(status: BaseStateStatus.loading));

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
          final fakeTasks = _buildFakeTasks(user!.employeeId);
          final myTasks = fakeTasks
              .where((t) => t.assigneeId == user.employeeId)
              .toList();
          final assignedTasks = fakeTasks
              .where((t) => t.creatorId == user.employeeId)
              .toList();

          _log.logI('Get fake tasks: myTasks=${myTasks.length}, assignedTasks=${assignedTasks.length}');

          emit(state.copyWith(
            status: BaseStateStatus.success,
            myTasks: myTasks,
            assignedTasks: assignedTasks,
            employeeId: user.employeeId,
          ));
        },
      );
    } finally {
      _isInitInFlight = false;
    }
  }

  Future<void> _onRefresh(Emitter<WeekPlanState> emit) async {
    await _onInit(emit);
  }

  //---(Filter)---//
  Future<void> _onSearch(Emitter<WeekPlanState> emit, String keyword) async {
    emit(state.copyWith(searchKeyword: keyword));
    await _onInit(emit);
  }

  Future<void> _onClearSearch(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(searchKeyword: ''));
    await _onInit(emit);
  }

  Future<void> _onFilterByStatus(
      Emitter<WeekPlanState> emit, String status) async {
    emit(state.copyWith(selectedStatus: status));
    await _onInit(emit);
  }

  Future<void> _onClearStatusFilter(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(selectedStatus: 'Tất cả'));
    await _onInit(emit);
  }

  Future<void> _onChangeDateRange(
    Emitter<WeekPlanState> emit,
    DateTime dateStart,
    DateTime dateEnd,
  ) async {
    emit(state.copyWith(dateStart: dateStart, dateEnd: dateEnd));
    await _onInit(emit);
  }

  Future<void> _onClearDateFilter(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(dateStart: null, dateEnd: null));
    await _onInit(emit);
  }

  //---(Action)---//
  Future<void> _onCheckIn(
      Emitter<WeekPlanState> emit, int taskId) async {
    final payload = <String, dynamic>{
      'taskId': taskId,
      'employeeId': state.employeeId,
      'checkInTime': DateTime.now().toIso8601String(),
    };

    final res = await _weekPlanRepo.checkIn(payload: payload);
    await res.fold(
      (err) async {
        _log.logE('Check-in failed: $err');
        emit(state.copyWith(
          message: err.getErrorMessage,
          status: BaseStateStatus.failed,
        ));
      },
      (_) async {
        _log.logI('Check-in success: taskId=$taskId');
        await _onInit(emit);
      },
    );
  }

  //---(Add Screen)---//
  Future<void> _onInitAdd(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
      currentStep: 0,
      headerProjectId: null,
      headerProjectName: null,
      headerParentTaskId: null,
      headerParentTaskName: null,
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
      Emitter<WeekPlanState> emit, List<WeekPlanEmployee> assignees) async {
    emit(state.copyWith(selectedAssignees: assignees));
  }

  Future<void> _onAddAssignee(
      Emitter<WeekPlanState> emit, WeekPlanEmployee employee) async {
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
      Emitter<WeekPlanState> emit, List<WeekPlanEmployee> persons) async {
    emit(state.copyWith(selectedRelatedPersons: persons));
  }

  Future<void> _onAddRelatedPerson(
      Emitter<WeekPlanState> emit, WeekPlanEmployee employee) async {
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

  //---(Helper)---//
  List<WeekPlanTaskItem> _buildFakeTasks(int employeeId) {
    final now = DateTime.now();
    return [
      WeekPlanTaskItem(
        id: 1,
        projectName: 'Dự án ERP RTC',
        projectId: 1,
        taskName: 'Thiết kế giao diện màn Week Plan',
        taskContent: 'Tạo UI/UX cho màn hình kế hoạch tuần',
        description: 'Thiết kế responsive, hỗ trợ dark mode',
        status: 2,
        statusText: 'Đang thực hiện',
        startDate: now.subtract(const Duration(days: 2)),
        endDate: now.add(const Duration(days: 3)),
        deadline: now.add(const Duration(days: 5)),
        creatorId: employeeId,
        creatorName: 'Nguyễn Văn A',
        assigneeId: employeeId,
        assigneeName: 'Nguyễn Văn A',
        isCheckedIn: true,
        checkInTime: now.subtract(const Duration(hours: 2)),
        priority: 1,
        priorityText: 'Cao',
        progress: 0.6,
        createdDate: now.subtract(const Duration(days: 5)),
      ),
      WeekPlanTaskItem(
        id: 2,
        projectName: 'Dự án ERP RTC',
        projectId: 1,
        taskName: 'Tích hợp API Week Plan',
        taskContent: 'Kết nối backend API cho module kế hoạch tuần',
        description: 'Triển khai CRUD operations',
        status: 1,
        statusText: 'Chưa bắt đầu',
        startDate: now.add(const Duration(days: 1)),
        endDate: now.add(const Duration(days: 7)),
        deadline: now.add(const Duration(days: 10)),
        creatorId: employeeId,
        creatorName: 'Nguyễn Văn A',
        assigneeId: employeeId,
        assigneeName: 'Nguyễn Văn A',
        isCheckedIn: false,
        priority: 2,
        priorityText: 'Trung bình',
        progress: 0.0,
        createdDate: now.subtract(const Duration(days: 3)),
      ),
      WeekPlanTaskItem(
        id: 3,
        projectName: 'Dự án Mobile App',
        projectId: 2,
        taskName: 'Fix bug login trên iOS',
        taskContent: 'Sửa lỗi không đăng nhập được trên iOS 17',
        description: 'Bug reproduce được trên simulator',
        status: 3,
        statusText: 'Hoàn thành',
        startDate: now.subtract(const Duration(days: 5)),
        endDate: now.subtract(const Duration(days: 1)),
        deadline: now.subtract(const Duration(days: 1)),
        creatorId: employeeId,
        creatorName: 'Nguyễn Văn A',
        assigneeId: employeeId,
        assigneeName: 'Nguyễn Văn A',
        isCheckedIn: true,
        checkInTime: now.subtract(const Duration(days: 2)),
        priority: 1,
        priorityText: 'Cao',
        progress: 1.0,
        createdDate: now.subtract(const Duration(days: 7)),
      ),
      WeekPlanTaskItem(
        id: 4,
        projectName: 'Dự án ERP RTC',
        projectId: 1,
        taskName: 'Viết document API',
        taskContent: 'Tài liệu hóa các endpoint của module Week Plan',
        description: 'Format theo Swagger/OpenAPI',
        status: 4,
        statusText: 'Quá hạn',
        startDate: now.subtract(const Duration(days: 7)),
        endDate: now.subtract(const Duration(days: 3)),
        deadline: now.subtract(const Duration(days: 3)),
        creatorId: 999,
        creatorName: 'Trần Thị B',
        assigneeId: employeeId,
        assigneeName: 'Nguyễn Văn A',
        isCheckedIn: false,
        priority: 3,
        priorityText: 'Thấp',
        progress: 0.25,
        createdDate: now.subtract(const Duration(days: 10)),
      ),
      WeekPlanTaskItem(
        id: 5,
        projectName: 'Dự án Mobile App',
        projectId: 2,
        taskName: 'Giao việc cho intern',
        taskContent: 'Phân công task simple cho thực tập sinh',
        description: 'Chỉ assign task đơn giản, có hướng dẫn chi tiết',
        status: 2,
        statusText: 'Đang thực hiện',
        startDate: now,
        endDate: now.add(const Duration(days: 4)),
        deadline: now.add(const Duration(days: 4)),
        creatorId: employeeId,
        creatorName: 'Nguyễn Văn A',
        assigneeId: 888,
        assigneeName: 'Lê Văn C',
        isCheckedIn: false,
        priority: 2,
        priorityText: 'Trung bình',
        progress: 0.1,
        createdDate: now.subtract(const Duration(days: 1)),
      ),
      WeekPlanTaskItem(
        id: 6,
        projectName: 'Dự án ERP RTC',
        projectId: 1,
        taskName: 'Deploy staging environment',
        taskContent: 'Setup và deploy lên môi trường staging',
        description: 'Cập nhật CI/CD pipeline',
        status: 1,
        statusText: 'Chưa bắt đầu',
        startDate: now.add(const Duration(days: 2)),
        endDate: now.add(const Duration(days: 5)),
        deadline: now.add(const Duration(days: 5)),
        creatorId: employeeId,
        creatorName: 'Nguyễn Văn A',
        assigneeId: 888,
        assigneeName: 'Lê Văn C',
        isCheckedIn: false,
        priority: 1,
        priorityText: 'Cao',
        progress: 0.0,
        createdDate: now,
      ),
    ];
  }
}
