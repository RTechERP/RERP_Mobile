import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../../base/bloc/base_bloc_state.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../base/bloc/index.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../../data/repository/week_plan_repo.dart';
import '../../../../../auth/data/repository/auth_repo.dart';

part 'week_plan_event.dart';
part 'week_plan_state.dart';
part 'week_plan_bloc.g.dart';
part 'week_plan_bloc.freezed.dart';

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
        createTask: (
          taskName,
          projectName,
          content,
          startDate,
          endDate,
          deadline,
          priority,
          description,
        ) =>
            _onCreateTask(
          emit,
          taskName: taskName,
          projectName: projectName,
          content: content,
          startDate: startDate,
          endDate: endDate,
          deadline: deadline,
          priority: priority,
          description: description,
        ),
        clearSubmitState: () => _onClearSubmitState(emit),
        updateHeaderProject: (projectId, projectName) =>
            _onUpdateHeaderProject(emit, projectId, projectName),
        updateHeaderParentTask: (parentTaskId, parentTaskName) =>
            _onUpdateHeaderParentTask(emit, parentTaskId, parentTaskName),
        updateHeaderPersonalTask: (isPersonal) =>
            _onUpdateHeaderPersonalTask(emit, isPersonal),
        updateHeaderComplexity: (complexity) =>
            _onUpdateHeaderComplexity(emit, complexity),
        updateHeaderTaskCategory: (categoryId, categoryName) =>
            _onUpdateHeaderTaskCategory(emit, categoryId, categoryName),
        updateHeaderWorkTypeAndStatus: (workTypeId, workTypeName, statusId, statusName) =>
            _onUpdateHeaderWorkTypeAndStatus(
                emit, workTypeId, workTypeName, statusId, statusName),
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
          // final tasksRes = await _weekPlanRepo.getTasks(payload: payload);
          // await tasksRes.fold(...);

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

  //---(Create)---//
  Future<void> _onInitAdd(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
      headerProjectId: null,
      headerProjectName: null,
      headerParentTaskId: null,
      headerParentTaskName: null,
      headerIsPersonalTask: false,
      headerComplexity: 3,
      headerTaskCategory: null,
      headerTaskCategoryName: null,
      headerWorkType: null,
      headerWorkTypeName: null,
      headerStatus: null,
      headerStatusName: null,
    ));
  }

  bool _isCreateTaskInFlight = false;

  Future<void> _onCreateTask(
    Emitter<WeekPlanState> emit, {
    required String taskName,
    required String projectName,
    required String content,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime deadline,
    required int priority,
    String? description,
  }) async {
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

      final payload = <String, dynamic>{
        'TaskName': taskName,
        'ProjectId': state.headerProjectId ?? 0,
        'ProjectName': state.headerProjectName ?? projectName,
        'ParentTaskId': state.headerParentTaskId,
        'ParentTaskName': state.headerParentTaskName,
        'IsPersonalTask': state.headerIsPersonalTask,
        'Complexity': state.headerComplexity,
        'TaskCategory': state.headerTaskCategory ?? 0,
        'WorkType': state.headerWorkType ?? 0,
        'Status': state.headerStatus ?? 0,
        'TaskContent': content,
        'Description': description ?? '',
        'StartDate': startDate.toIso8601String(),
        'EndDate': endDate.toIso8601String(),
        'Deadline': deadline.toIso8601String(),
        'Priority': priority,
        'CreatorId': user.employeeId,
        'AssigneeId': user.employeeId,
      };

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

  Future<void> _onClearSubmitState(Emitter<WeekPlanState> emit) async {
    emit(state.copyWith(
      isSubmitting: false,
      submitSuccess: false,
      message: null,
    ));
  }

  //---(Header Form)---//
  _onUpdateHeaderProject(
      Emitter<WeekPlanState> emit, int projectId, String projectName) {
    emit(state.copyWith(
      headerProjectId: projectId,
      headerProjectName: projectName,
    ));
  }

  _onUpdateHeaderParentTask(
      Emitter<WeekPlanState> emit, int parentTaskId, String parentTaskName) {
    emit(state.copyWith(
      headerParentTaskId: parentTaskId,
      headerParentTaskName: parentTaskName,
    ));
  }

  _onUpdateHeaderPersonalTask(
      Emitter<WeekPlanState> emit, bool isPersonal) {
    emit(state.copyWith(headerIsPersonalTask: isPersonal));
  }

  _onUpdateHeaderComplexity(
      Emitter<WeekPlanState> emit, int complexity) {
    emit(state.copyWith(headerComplexity: complexity));
  }

  _onUpdateHeaderTaskCategory(
      Emitter<WeekPlanState> emit, int categoryId, String categoryName) {
    emit(state.copyWith(
      headerTaskCategory: categoryId,
      headerTaskCategoryName: categoryName,
    ));
  }

  _onUpdateHeaderWorkTypeAndStatus(
    Emitter<WeekPlanState> emit,
    int workTypeId,
    String workTypeName,
    int statusId,
    String statusName,
  ) {
    emit(state.copyWith(
      headerWorkType: workTypeId,
      headerWorkTypeName: workTypeName,
      headerStatus: statusId,
      headerStatusName: statusName,
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
