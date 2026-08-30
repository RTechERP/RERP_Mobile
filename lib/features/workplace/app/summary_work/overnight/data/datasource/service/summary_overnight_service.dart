import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_overnight_model.dart';

/// Service gọi API lấy danh sách phiếu làm đêm (summary).
@injectable
class SummaryOvernightService extends DioBaseApiService {
  SummaryOvernightService(super.dio);

  /// Lấy danh sách phiếu làm đêm theo điều kiện lọc.
  /// Response trả về `{ data: { nightShiftdata: [...] } }`.
  Future<BaseData<List<SummaryOvernightItem>>> getOvernight({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<SummaryOvernightItem>>>(
      ApiEndPoint.getEmployeeNightShiftPerson,
      body: payload,
      parser: (json) => BaseData<List<SummaryOvernightItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SummaryOvernightItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['nightShiftdata'] as List? ?? [];
          return list
              .map((e) => SummaryOvernightItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  /// Lấy danh sách phòng ban để hiển thị trong bộ lọc.
  Future<BaseData<List<SummaryOvernightDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryOvernightDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryOvernightDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryOvernightDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}