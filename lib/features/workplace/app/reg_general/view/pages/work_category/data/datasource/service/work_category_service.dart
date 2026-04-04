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

  Future<BaseData<List<WorkAssignItem>>> getAssigner() {
    return get<BaseData<List<WorkAssignItem>>>(
      ApiEndPoint.getWorkAssigner,
      parser: (json) => BaseData<List<WorkAssignItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => WorkAssignItem.fromJson(e as Map<String, dynamic>))
            .toList(),
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
}