import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_leave_model.dart';

@injectable
class SummaryLeaveService extends DioBaseApiService {
  SummaryLeaveService(super.dio);

  Future<BaseData<List<SummaryLeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<SummaryLeaveItem>>>(
      ApiEndPoint.getLeaveSummaryWork,
      body: payload,
      parser: (json) => BaseData<List<SummaryLeaveItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryLeaveItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list = (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => SummaryLeaveItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<SummaryDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
