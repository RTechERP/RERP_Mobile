import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_missed_model.dart';

/// Service gọi API lấy danh sách phiếu quên chấm công (summary).
@injectable
class SummaryMissedService extends DioBaseApiService {
  SummaryMissedService(super.dio);

  /// Lấy danh sách phiếu quên chấm công theo điều kiện lọc.
  Future<BaseData<List<SummaryMissedItem>>> getMissed({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<SummaryMissedItem>>>(
      ApiEndPoint.getEmployeeNoFingerprintPerson,
      body: payload,
      parser: (json) => BaseData<List<SummaryMissedItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryMissedItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list = (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => SummaryMissedItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// Lấy danh sách phòng ban để hiển thị trong bộ lọc.
  Future<BaseData<List<SummaryMissedDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryMissedDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryMissedDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryMissedDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}