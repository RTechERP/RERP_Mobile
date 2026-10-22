import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../model/project_list_model.dart';

@injectable
class ProjectListService extends DioBaseApiService {
  ProjectListService(super.dio);

  Future<BaseData<List<ProjectItem>>> getProjects({
    required ProjectListParams params,
  }) async {
    return get<BaseData<List<ProjectItem>>>(
      ApiEndPoint.getProjects,
      query: params.toQueryParams(),
      parser: (json) => BaseData<List<ProjectItem>>.fromJson(
        json,
        (data) {
          if (data is! Map<String, dynamic>) return <ProjectItem>[];
          final projectList = data['project'] as List?;
          if (projectList == null) return <ProjectItem>[];
          return projectList
              .map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}
