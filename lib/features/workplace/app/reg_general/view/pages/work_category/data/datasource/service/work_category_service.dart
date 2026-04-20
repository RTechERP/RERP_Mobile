import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/work_category_model.dart';

@injectable
class WorkCategoryService extends DioBaseApiService {
  WorkCategoryService(super.dio);

  Future<BaseData<List<WorkCategoryItem>>> getWorkCategory({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<WorkCategoryItem>>>(
      ApiEndPoint.getWorkCategory,
      body: payload,
      parser: (json) => BaseData<List<WorkCategoryItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkCategoryItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<WorkAssignResponse>> getAssigner() {
    return get<BaseData<WorkAssignResponse>>(
      ApiEndPoint.getWorkAssigner,
      parser: (json) => BaseData<WorkAssignResponse>.fromJson(
        json,
        (data) => WorkAssignResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<List<WorkProjectItem>>> getWorkProject() {
    return get<BaseData<List<WorkProjectItem>>>(
      ApiEndPoint.getProject,
      parser: (json) => BaseData<List<WorkProjectItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkProjectItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<WorkProjectTypeItem>>> getWorkProjectType() {
    return get<BaseData<List<WorkProjectTypeItem>>>(
      ApiEndPoint.getWorkProjectType,
      parser: (json) => BaseData<List<WorkProjectTypeItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkProjectTypeItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<WorkParentItem>>> getWorkParent({int? projectID}) {
    return get<BaseData<List<WorkParentItem>>>(
      ApiEndPoint.getWorkParent,
      query: {
        'projectID': projectID,
      },
      parser: (json) => BaseData<List<WorkParentItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkParentItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveWorkCategory({
    required dynamic payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveWorkCategory,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<WorkCategoryDetailItem>> getDetailById({
    required int projectItemId,
  }) {
    return get<BaseData<WorkCategoryDetailItem>>(
      ApiEndPoint.getWorkCategoryDetail,
      query: {'projectItemID': projectItemId},
      parser: (json) => BaseData<WorkCategoryDetailItem>.fromJson(
        json,
        (data) => WorkCategoryDetailItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<List<WorkProblemItem>>> getProblemById({
    required int projectItemId,
  }) {
    return get<BaseData<List<WorkProblemItem>>>(
      ApiEndPoint.getWorkCategoryProblem,
      query: {'projectItem': projectItemId},
      parser: (json) => BaseData<List<WorkProblemItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => WorkProblemItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveProblem({
    required dynamic payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveWorkCategoryProblem,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }
}