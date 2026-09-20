import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_in_out_model.dart';

@injectable
class SummaryInOutService extends DioBaseApiService {
  SummaryInOutService(super.dio);

  Future<BaseData<List<SummaryInOutItem>>> getInOut({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<SummaryInOutItem>>>(
      ApiEndPoint.getEmployeeEarlyLatePerson,
      body: payload,
      parser: (json) => BaseData<List<SummaryInOutItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryInOutItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list = (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => SummaryInOutItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<SummaryInOutDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryInOutDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryInOutDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryInOutDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
