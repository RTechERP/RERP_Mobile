import 'package:injectable/injectable.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/idea_registration/data/datasource/models/idea_registration_model.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../../../../reports/data/datasource/models/report_model.dart';

@injectable
class IdeaRegistrationService extends DioBaseApiService {
  IdeaRegistrationService(super.dio);

  Future<BaseData<List<IdeaItem>>> getIdeas({
    required Map<String, dynamic> query,
  }) async {
    return get<BaseData<List<IdeaItem>>>(
      ApiEndPoint.getIdeaRegistration,
      query: query,
      parser: (json) => _parseList(json),
    );
  }

  Future<BaseData<List<IdeaCatalogItem>>> getCourseCatalog() async {
    return get<BaseData<List<IdeaCatalogItem>>>(
      ApiEndPoint.getCourseCatalog,
      parser: (json) => BaseData<List<IdeaCatalogItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => IdeaCatalogItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<int>> saveIdea({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<int>>(
      ApiEndPoint.saveIdea,
      body: payload,
      parser: (json) => BaseData<int>.fromJson(json, (data) {
        if (data is int) return data;
        return 0;
      }),
    );
  }

  BaseData<List<IdeaItem>> _parseList(dynamic json) {
    if (json is List) {
      return BaseData<List<IdeaItem>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => IdeaItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<IdeaItem>>.fromJson(json as Map<String, dynamic>, (
      data,
    ) {
      if (data is List) {
        return data
            .map((e) => IdeaItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <IdeaItem>[];
    });
  }
}
