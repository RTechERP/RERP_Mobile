// ignore_for_file: unused_field

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/week_plan_model.dart';

@injectable
class WeekPlanService extends DioBaseApiService {
  WeekPlanService(super.dio);

  /// GET /ProjectTask?dateStart=...&dateEnd=...&status=0&viewNumber=1
  ///
  /// Response: { status: 1, data: { ProjectTask: [...] } }
  Future<BaseData<List<WeekPlanTaskItem>>> getProjectTask({
    required DateTime dateStart,
    required DateTime dateEnd,
    String? status,
    required int isApprove,
    required int viewNumber,
  }) async {
    return get<BaseData<List<WeekPlanTaskItem>>>(
      ApiEndPoint.getProjectTask,
      query: {
        'dateStart': DateTime(
          dateStart.year,
          dateStart.month,
          dateStart.day,
        ).toIso8601String(),
        'dateEnd': DateTime(
          dateEnd.year,
          dateEnd.month,
          dateEnd.day,
          23,
          59,
          59,
        ).toIso8601String(),
        'status': status,
        'isApprove': isApprove,
        'viewNumber': viewNumber,
      },
      parser: (json) => BaseData<List<WeekPlanTaskItem>>.fromJson(json, (data) {
        final map = data as Map<String, dynamic>;
        final projectTask = map['ProjectTask'] as List?;
        return (projectTask ?? [])
            .map((e) => WeekPlanTaskItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /ProjectTask/project-task-type
  ///
  /// Response: { status: 1, data: [ TaskTypeItem, ... ] }
  Future<BaseData<List<TaskTypeItem>>> getProjectTaskType() async {
    return get<BaseData<List<TaskTypeItem>>>(
      ApiEndPoint.getProjectTaskType,
      parser: (json) => BaseData<List<TaskTypeItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => TaskTypeItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /ProjectTask/get-all-project
  ///
  /// Response: { status: 1, data: [ ProjectTaskItem, ... ] }
  Future<BaseData<List<ProjectTaskItem>>> getAllProject() async {
    return get<BaseData<List<ProjectTaskItem>>>(
      ApiEndPoint.getAllProjectTask,
      parser: (json) => BaseData<List<ProjectTaskItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => ProjectTaskItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /WorkItem/get-type-project-item
  ///
  /// Response: { status: 1, data: [ ProjectTypeItem, ... ] }
  Future<BaseData<List<ProjectTypeItem>>> getProjectTypeItem() async {
    return get<BaseData<List<ProjectTypeItem>>>(
      ApiEndPoint.getWorkProjectType,
      parser: (json) => BaseData<List<ProjectTypeItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => ProjectTypeItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /Employee
  ///
  /// Response: { status: 1, data: [ EmployeeTaskItem, ... ] }
  Future<BaseData<List<EmployeeTaskItem>>> getEmployees() async {
    return get<BaseData<List<EmployeeTaskItem>>>(
      ApiEndPoint.getEmployees,
      parser: (json) => BaseData<List<EmployeeTaskItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => EmployeeTaskItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// POST /ProjectTask/attendance
  ///
  /// Payload: { projectTaskID: int, isCheck: bool }
  /// Response: { status: 1, data: AttendanceTaskResponse }
  Future<BaseData<AttendanceTaskResponse>> projectTaskAttendance({
    required int projectTaskId,
    required bool isCheck,
  }) async {
    return post<BaseData<AttendanceTaskResponse>>(
      ApiEndPoint.projectTaskAttendance,
      query: {'ProjectTaskID': projectTaskId, 'IsCheck': isCheck},
      body: {},
      parser: (json) => BaseData<AttendanceTaskResponse>.fromJson(
        json,
        (data) => AttendanceTaskResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// GET /ProjectTask/list-project-task?projectID=...&isPersionalProject=...
  ///
  /// Response: { status: 1, data: [ ParentProjectTaskItem, ... ] }
  Future<BaseData<List<ParentProjectTaskItem>>> getListProjectTask({
    required int projectId,
    required bool isPersonalProject,
  }) async {
    return get<BaseData<List<ParentProjectTaskItem>>>(
      ApiEndPoint.listProjectTask,
      query: {'projectID': projectId, 'isPersionalProject': isPersonalProject},
      parser: (json) =>
          BaseData<List<ParentProjectTaskItem>>.fromJson(json, (data) {
            final list = data as List?;
            return (list ?? [])
                .map(
                  (e) =>
                      ParentProjectTaskItem.fromJson(e as Map<String, dynamic>),
                )
                .toList();
          }),
    );
  }

  /// POST /ProjectTask/SaveData
  ///
  /// Payload: { ID, Mission, PlanStartDate, PlanEndDate, EmployeeIDRequest,
  ///            TypeProjectItem, Employee, Status, ProjectID, ActualStartDate,
  ///            ActualEndDate, EmployeeRelate, IsPersonalProject, ParentID,
  ///            ProjectTaskTypeID, Priority, EstimatedTime, NeedApprove,
  ///            Description, ProjectTaskChecklists, Links, Files }
  /// Response: { status: 1, data: SaveResponseWeekPlan }
  Future<BaseData<SaveResponseWeekPlan>> saveProjectTask({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<SaveResponseWeekPlan>>(
      ApiEndPoint.saveProjectTask,
      body: payload,
      parser: (json) => BaseData<SaveResponseWeekPlan>.fromJson(
        json,
        (data) => SaveResponseWeekPlan.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lưu file đính kèm
  Future<BaseData<List<UploadAttachmentResponse>>> uploadAttachmentFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    final formData = FormData();

    // add file(s)
    for (final file in files) {
      formData.files.add(
        MapEntry(
          'files',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      );
    }

    // add text fields
    formData.fields.addAll([
      MapEntry('key', key),
      MapEntry('subPath', subPath),
    ]);

    return post<BaseData<List<UploadAttachmentResponse>>>(
      ApiEndPoint.marketing_upload,
      body: formData,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => BaseData<List<UploadAttachmentResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => UploadAttachmentResponse.fromJson(e))
            .toList(),
      ),
    );
  }

  /// PUT /ProjectTask/Files - Lưu file đính kèm sau khi tạo task.
  ///
  /// Payload: { ID, ProjectTaskID, FileName, FilePath, IsDeleted }
  /// Response: { status: 1, data: FileWeekPlanResponse }
  Future<BaseData<FileWeekPlanResponse>> saveProjectTaskFiles({
    required Map<String, dynamic> payload,
  }) async {
    return put<BaseData<FileWeekPlanResponse>>(
      ApiEndPoint.projectTaskFiles,
      body: payload,
      parser: (json) => BaseData<FileWeekPlanResponse>.fromJson(
        json,
        (data) => FileWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// PUT /ProjectTask/Links - Lưu link đính kèm sau khi tạo task.
  ///
  /// Payload: { ID, ProjectTaskID, FileName, FilePath, IsDeleted }
  /// Response: { status: 1, data: LinkWeekPlanResponse }
  Future<BaseData<LinkWeekPlanResponse>> saveProjectTaskLinks({
    required Map<String, dynamic> payload,
  }) async {
    return put<BaseData<LinkWeekPlanResponse>>(
      ApiEndPoint.projectTaskLinks,
      body: payload,
      parser: (json) => BaseData<LinkWeekPlanResponse>.fromJson(
        json,
        (data) => LinkWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// GET /ProjectTask/{taskId}/Checklists - Lấy checklist theo task ID.
  ///
  /// Response: { status: 1, data: [ ChecklistWeekPlanResponse, ... ] }
  Future<BaseData<List<ChecklistWeekPlanResponse>>> getProjectTaskChecklists({
    required int taskId,
  }) async {
    return get<BaseData<List<ChecklistWeekPlanResponse>>>(
      '${ApiEndPoint.projectTaskChecklistsGet}'.replaceFirst(
        '{taskId}',
        '$taskId',
      ),
      parser: (json) =>
          BaseData<List<ChecklistWeekPlanResponse>>.fromJson(json, (data) {
            final list = data as List?;
            return (list ?? [])
                .map(
                  (e) => ChecklistWeekPlanResponse.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList();
          }),
    );
  }

  /// POST /ProjectTask/Checklists - Lưu checklist sau khi tạo task.
  ///
  /// Payload: { ID, ProjectTaskID, ChecklistTitle, OrderIndex, IsDone, IsDeleted, CreatedBy, UpdatedBy }
  /// Response: { status: 1, data: ChecklistWeekPlanResponse }
  Future<BaseData<ChecklistWeekPlanResponse>> saveProjectTaskChecklists({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<ChecklistWeekPlanResponse>>(
      ApiEndPoint.projectTaskChecklists,
      body: payload,
      parser: (json) => BaseData<ChecklistWeekPlanResponse>.fromJson(
        json,
        (data) =>
            ChecklistWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// PUT /ProjectTask/Checklists/{id} - Cap nhat checklist.
  ///
  /// Payload: { ID, ProjectTaskID, ChecklistTitle, OrderIndex, IsDone, IsDeleted, CreatedBy, UpdatedBy }
  /// Response: { status: 1, data: ChecklistWeekPlanResponse }
  Future<BaseData<ChecklistWeekPlanResponse>> updateProjectTaskChecklists({
    required int id,
    required Map<String, dynamic> payload,
  }) async {
    return put<BaseData<ChecklistWeekPlanResponse>>(
      '${ApiEndPoint.projectTaskChecklistsUpdate}'.replaceFirst('{id}', '$id'),
      body: payload,
      parser: (json) => BaseData<ChecklistWeekPlanResponse>.fromJson(
        json,
        (data) =>
            ChecklistWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// DELETE /ProjectTask/Checklists/{id} - Xoa checklist.
  ///
  /// Response: { status: 1, data: ChecklistWeekPlanResponse }
  Future<BaseData<ChecklistWeekPlanResponse>> deleteProjectTaskChecklists({
    required int id,
  }) async {
    return delete<BaseData<ChecklistWeekPlanResponse>>(
      '${ApiEndPoint.projectTaskChecklistsUpdate}'.replaceFirst('{id}', '$id'),
      parser: (json) => BaseData<ChecklistWeekPlanResponse>.fromJson(
        json,
        (data) =>
            ChecklistWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// POST /ProjectTask/project-task-child - Lưu công việc con sau khi tạo task cha.
  ///
  /// Payload: { ID, ProjectID, Mission, PlanStartDate, PlanEndDate, ParentID,
  ///            TypeProjectItem, EmployeeIDRequest, EmployeeAssigneeID,
  ///            TaskComplexity, ProjectTaskTypeID, IsDeletedFromParent }
  /// Response: { status: 1, data: SubTaskWeekPlan }
  Future<BaseData<SubTaskWeekPlan>> saveProjectTaskChild({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<SubTaskWeekPlan>>(
      ApiEndPoint.projectTaskChild,
      body: payload,
      parser: (json) => BaseData<SubTaskWeekPlan>.fromJson(
        json,
        (data) => SubTaskWeekPlan.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// POST /ProjectTask/Additional - Lưu công việc phát sinh sau khi tạo task.
  ///
  /// Payload: { ID, ProjectTaskID, Description, IsDeleted }
  /// GET /ProjectTask/{id}
  ///
  /// Response: { status: 1, data: WeekPlanDetailResponse }

  Future<BaseData<AdditionalWeekPlanResponse>> saveProjectTaskAdditional({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<AdditionalWeekPlanResponse>>(
      ApiEndPoint.projectTaskAdditional,
      body: payload,
      parser: (json) => BaseData<AdditionalWeekPlanResponse>.fromJson(
        json,
        (data) =>
            AdditionalWeekPlanResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<WeekPlanDetailResponse>> getProjectTaskDetail({
    required int id,
  }) async {
    return get<BaseData<WeekPlanDetailResponse>>(
      '${ApiEndPoint.projectTaskDetail}/$id',
      parser: (json) => BaseData<WeekPlanDetailResponse>.fromJson(
        json,
        (data) => WeekPlanDetailResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// GET /ProjectTask/employee/{id}?typeEmployee=1 (người thực hiện) hoặc 2 (người liên quan)
  ///
  /// Response: { status: 1, data: [ WeekPlanTypeEmployeeDetailResponse, ... ] }
  Future<BaseData<List<WeekPlanTypeEmployeeDetailResponse>>> getEmployeeByType({
    required int id,
    required int typeEmployee,
  }) async {
    return get<BaseData<List<WeekPlanTypeEmployeeDetailResponse>>>(
      '${ApiEndPoint.projectTaskEmployee}/$id',
      query: {'typeEmployee': typeEmployee},
      parser: (json) =>
          BaseData<List<WeekPlanTypeEmployeeDetailResponse>>.fromJson(json, (
            data,
          ) {
            final list = data as List?;
            return (list ?? [])
                .map(
                  (e) => WeekPlanTypeEmployeeDetailResponse.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList();
          }),
    );
  }

  /// GET /ProjectTask/project-task-timeline-by-team
  ///
  /// Query params: dateStart, dateEnd, departmentID, teamID, userID, status, approve, typeSearch
  /// Response: { status: 1, data: [ { ID, FullName, ..., "2026-06-01": "2", ... }, ... ] }
  Future<BaseData<List<ProjectTaskTimelineResponse>>>
  getProjectTaskTimelineByTeam({
    required DateTime dateStart,
    required DateTime dateEnd,
    int? departmentId,
    int? teamId,
    int? userId,
    int? status,
    int? approve,
    int? typeSearch,
  }) async {
    return get<BaseData<List<ProjectTaskTimelineResponse>>>(
      ApiEndPoint.projectTaskTimelineByTeam,
      query: {
        'dateStart':
            '${dateStart.year}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}',
        'dateEnd':
            '${dateEnd.year}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}',
        if (departmentId != null) 'departmentID': departmentId,
        if (teamId != null) 'teamID': teamId,
        if (userId != null) 'userID': userId,
        if (status != null) 'status': status,
        if (approve != null) 'approve': approve,
        if (typeSearch != null) 'typeSearch': typeSearch,
      },
      parser: (json) => BaseData<List<ProjectTaskTimelineResponse>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map(
                (e) => ProjectTaskTimelineResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        },
      ),
    );
  }

  /// POST /ProjectTask/day-off
  ///
  /// Query params: dateStart, dateEnd
  /// Response: { status: 1, data: [ { DateOff: "2026-06-07T00:00:00" }, ... ] }
  Future<BaseData<List<DayOffItem>>> getDayOff({
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    return post<BaseData<List<DayOffItem>>>(
      ApiEndPoint.projectTaskDayOff,
      query: {
        'dateStart':
            '${dateStart.year}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}',
        'dateEnd':
            '${dateEnd.year}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}',
      },
      parser: (json) => BaseData<List<DayOffItem>>.fromJson(json, (data) {
        final list = data as List?;
        return (list ?? [])
            .map((e) => DayOffItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }

  /// GET /ProjectTask/project-task-status
  ///
  /// Response {status: 1, data: { projectTaskStatuses: [ {ID: 0}, ... ] }
  Future<BaseData<List<WeekPlanFilterItem>>> getProjectTaskStatus() async {
    return get<BaseData<List<WeekPlanFilterItem>>>(
      ApiEndPoint.getWeekPlanFilter,
      parser: (json) {
        final map = json as Map<String, dynamic>;
        final dataPart = map['data'];
        
        List<WeekPlanFilterItem> items = [];
        if (dataPart is Map<String, dynamic>) {
          final statuses = dataPart['projectTaskStatuses'];
          if (statuses is List) {
            items = statuses
                .map((e) => WeekPlanFilterItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
        }
        
        return BaseData<List<WeekPlanFilterItem>>(
          status: map['status'] as int?,
          data: items,
        );
      },
    );
  }

  /// PUT /ProjectTask/Approve
  ///
  /// Body: [int, int, ...]  (raw list of projectTaskIDs)
  /// Query params: isApproved, review, completionRating
  /// Response: { status: 1, data: [WeekPlanApproveResponse, ...] }
  Future<BaseData<List<WeekPlanApproveResponse>>> approveProjectTask({
    required List<int> projectTaskIds,
    required bool isApproved,
    String? review,
    int? completionRating,
  }) async {
    return post<BaseData<List<WeekPlanApproveResponse>>>(
      ApiEndPoint.approveProjectTask,
      body: projectTaskIds,
      query: {
        'isApproved': isApproved,
        if (review != null && review.isNotEmpty) 'review': review,
        if (completionRating != null) 'completionRating': completionRating,
      },
      parser: (json) => _parseList<WeekPlanApproveResponse>(
        json,
        WeekPlanApproveResponse.fromJson,
      ),
    );
  }

  BaseData<List<T>> _parseList<T>(
      dynamic json,
      T Function(Map<String, dynamic>) fromJson,
      ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
            (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
          (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data as Map<String, dynamic>).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
  }
}
