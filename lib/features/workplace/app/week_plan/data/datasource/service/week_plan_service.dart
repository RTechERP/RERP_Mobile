// ignore_for_file: unused_field

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
    required int status,
    required int viewNumber,
  }) async {
    return get<BaseData<List<WeekPlanTaskItem>>>(
      ApiEndPoint.getProjectTask,
      query: {
        'dateStart': DateTime(dateStart.year, dateStart.month, dateStart.day)
            .toIso8601String(),
        'dateEnd': DateTime(dateEnd.year, dateEnd.month, dateEnd.day, 23, 59, 59)
            .toIso8601String(),
        'status': status,
        'viewNumber': viewNumber,
      },
      parser: (json) => BaseData<List<WeekPlanTaskItem>>.fromJson(
        json,
        (data) {
          final map = data as Map<String, dynamic>;
          final projectTask = map['ProjectTask'] as List?;
          return (projectTask ?? [])
              .map((e) => WeekPlanTaskItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// GET /ProjectTask/project-task-type
  ///
  /// Response: { status: 1, data: [ TaskTypeItem, ... ] }
  Future<BaseData<List<TaskTypeItem>>> getProjectTaskType() async {
    return get<BaseData<List<TaskTypeItem>>>(
      ApiEndPoint.getProjectTaskType,
      parser: (json) => BaseData<List<TaskTypeItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => TaskTypeItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// GET /ProjectTask/get-all-project
  ///
  /// Response: { status: 1, data: [ ProjectTaskItem, ... ] }
  Future<BaseData<List<ProjectTaskItem>>> getAllProject() async {
    return get<BaseData<List<ProjectTaskItem>>>(
      ApiEndPoint.getAllProjectTask,
      parser: (json) => BaseData<List<ProjectTaskItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => ProjectTaskItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// GET /WorkItem/get-type-project-item
  ///
  /// Response: { status: 1, data: [ ProjectTypeItem, ... ] }
  Future<BaseData<List<ProjectTypeItem>>> getProjectTypeItem() async {
    return get<BaseData<List<ProjectTypeItem>>>(
      ApiEndPoint.getWorkProjectType,
      parser: (json) => BaseData<List<ProjectTypeItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => ProjectTypeItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// GET /Employee
  ///
  /// Response: { status: 1, data: [ EmployeeTaskItem, ... ] }
  Future<BaseData<List<EmployeeTaskItem>>> getEmployees() async {
    return get<BaseData<List<EmployeeTaskItem>>>(
      ApiEndPoint.getEmployees,
      parser: (json) => BaseData<List<EmployeeTaskItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => EmployeeTaskItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}
