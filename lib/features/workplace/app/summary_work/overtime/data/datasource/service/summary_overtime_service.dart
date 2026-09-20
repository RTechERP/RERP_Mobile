import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/summary_overtime_model.dart';

/// Service gọi API lấy dữ liệu tổng hợp phiếu làm thêm và xếp hạng giờ OT.
@injectable
class SummaryOvertimeService extends DioBaseApiService {
  SummaryOvertimeService(super.dio);

  /// Lấy dữ liệu tổng hợp phiếu làm thêm theo phòng ban.
  /// Response: `{ data: { data: [...], summaryPerson: [...] } }`.
  Future<BaseData<SummaryOvertimePayload>> getOvertimeSummary({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<SummaryOvertimePayload>>(
      ApiEndPoint.getSummaryOverTimePersonByDept,
      body: payload,
      parser: (json) => BaseData<SummaryOvertimePayload>.fromJson(
        json,
        (data) {
          if (data is List) return const SummaryOvertimePayload();
          final map = (data as Map<String, dynamic>?) ?? const {};
          return SummaryOvertimePayload.fromJson(map);
        },
      ),
    );
  }

  /// Lấy danh sách phòng ban để hiển thị trong bộ lọc.
  Future<BaseData<List<SummaryOvertimeDepartment>>> getDepartments() async {
    return get<BaseData<List<SummaryOvertimeDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<SummaryOvertimeDepartment>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SummaryOvertimeDepartment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// GET /Employee?status=0&departmentID=0&keyword=
  ///
  /// Lấy danh sách nhân viên phục vụ cho picker chọn NV.
  Future<BaseData<List<SummaryOvertimeEmployee>>> getEmployees({
    int status = 0,
    int departmentId = 0,
    String keyword = '',
  }) async {
    return get<BaseData<List<SummaryOvertimeEmployee>>>(
      ApiEndPoint.getEmployeeLeave,
      query: {
        'status': status,
        'departmentID': departmentId,
        if (keyword.isNotEmpty) 'keyword': keyword,
      },
      parser: (json) =>
          BaseData<List<SummaryOvertimeEmployee>>.fromJson(json, (data) {
        final list = data is List
            ? data
            : (data as Map<String, dynamic>?)?['data'] as List? ?? const [];
        return list
            .map((e) =>
                SummaryOvertimeEmployee.fromJson(e as Map<String, dynamic>))
            .toList();
      }),
    );
  }
}