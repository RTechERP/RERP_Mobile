import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';
import '../datasource/models/week_plan_model.dart';

abstract class WeekPlanRepo {
  /// Lấy danh sách task theo chế độ xem.
  ///
  /// [viewNumber] — 1: Công việc của tôi, 2: Công việc liên quan,
  ///                 3: Công việc tôi giao, -1: Tổng công việc.
  /// [status] — comma-separated string (VD: "1,2") hoặc null.
  Future<Either<BaseError, List<WeekPlanTaskItem>>> getTasks({
    required DateTime dateStart,
    required DateTime dateEnd,
    String? status,
    required int isApprove,
    required int viewNumber,
  });

  Future<Either<BaseError, void>> checkIn({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, SaveResponseWeekPlan>> saveTask({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<TaskTypeItem>>> getTaskTypes();

  Future<Either<BaseError, List<ProjectTaskItem>>> getProjects();

  Future<Either<BaseError, List<ProjectTypeItem>>> getProjectTypes();

  Future<Either<BaseError, List<EmployeeTaskItem>>> getEmployees();

  Future<Either<BaseError, List<ParentProjectTaskItem>>> getParentProjectTasks({
    required int projectId,
    required bool isPersonalProject,
  });

  Future<Either<BaseError, AttendanceTaskResponse>> projectTaskAttendance({
    required int projectTaskId,
    required bool isCheck,
  });

  Future<Either<BaseError, List<UploadAttachmentResponse>>> uploadAttachmentFile({
    required List<File> files,
    required String key,
    required String subPath,
  });

  Future<Either<BaseError, FileWeekPlanResponse>> saveProjectTaskFiles({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<ChecklistWeekPlanResponse>>> getProjectTaskChecklists({
    required int taskId,
  });

  Future<Either<BaseError, ChecklistWeekPlanResponse>> saveProjectTaskChecklists({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, ChecklistWeekPlanResponse>> updateProjectTaskChecklists({
    required int id,
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, ChecklistWeekPlanResponse>> deleteProjectTaskChecklists({
    required int id,
  });

  Future<Either<BaseError, LinkWeekPlanResponse>> saveProjectTaskLinks({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, SubTaskWeekPlan>> saveSubTask({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, AdditionalWeekPlanResponse>> saveProjectTaskAdditional({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, WeekPlanDetailResponse>> getTaskDetail({required int id});

  Future<Either<BaseError, List<WeekPlanTypeEmployeeDetailResponse>>> getEmployeeByType({
    required int id,
    required int typeEmployee,
  });

  /// Lấy timeline task theo team.
  Future<Either<BaseError, List<ProjectTaskTimelineResponse>>> getProjectTaskTimelineByTeam({
    required DateTime dateStart,
    required DateTime dateEnd,
    int? departmentId,
    int? teamId,
    int? userId,
    int? status,
    int? approve,
    int? typeSearch,
  });

  /// Lấy danh sách ngày nghỉ.
  Future<Either<BaseError, List<DayOffItem>>> getDayOff({
    required DateTime dateStart,
    required DateTime dateEnd,
  });

  /// Lấy danh sách trạng thái công việc từ API /ProjectTask/project-task-status.
  Future<Either<BaseError, List<WeekPlanFilterItem>>> getProjectTaskStatuses();

  /// Duyệt hoặc từ chối công việc.
  Future<Either<BaseError, WeekPlanApproveResponse>> approveProjectTask({
    required List<int> projectTaskIds,
    required bool isApproved,
    String? review,
    int? completionRating,
  });
}

