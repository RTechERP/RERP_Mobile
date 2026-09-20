import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_wfh_model.dart';

@injectable
class SummaryWfhService extends DioBaseApiService {
  SummaryWfhService(super.dio);

  Future<BaseData<List<SummaryWfhItem>>> getWfh({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<SummaryWfhItem>>>(
      ApiEndPoint.getEmployeeWFHPerson,
      body: payload,
      parser: (json) => BaseData<List<SummaryWfhItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryWfhItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list = (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => SummaryWfhItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<SummaryWfhDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryWfhDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryWfhDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryWfhDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
