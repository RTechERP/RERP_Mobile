// Service gọi API `/home/get-summary-employee-person`.
// Trả về `PersonalSummaryData` (đã parse sẵn các nhóm phiếu cá nhân).
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/personal_summary_model.dart';

@injectable
class PersonalSummaryService extends DioBaseApiService {
  PersonalSummaryService(super.dio);

  /// POST /home/get-summary-employee-person.
  /// `payload` chứa DateStart/DateEnd/DepartmentID/EmployeeID/IsApproved/Keyword.
  Future<BaseData<PersonalSummaryData>> getPersonalSummary({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<PersonalSummaryData>>(
      ApiEndPoint.getSummaryEmployeePerson,
      body: payload,
      parser: (json) {
        final root = (json is Map) ? json : <String, dynamic>{};
        return BaseData<PersonalSummaryData>.fromJson(
          root.cast<String, dynamic>(),
          (data) {
            // BE có thể trả `data` là object (như payload mẫu) hoặc null.
            if (data is Map<String, dynamic>) {
              return PersonalSummaryData.fromJson(data);
            }
            if (data is Map) {
              return PersonalSummaryData.fromJson(
                Map<String, dynamic>.from(data),
              );
            }
            // Fallback: parse từ chính root khi BE không bọc data.
            return PersonalSummaryData.fromJson(
              root.cast<String, dynamic>(),
            );
          },
        );
      },
    );
  }

  /// GET /SummaryAttendance/get-employee-attendance.
  /// `query` chứa departmentID, employeeID, keyword, dateStart (yyyy-MM-dd),
  /// dateEnd (yyyy-MM-dd). Response có thể là mảng trần hoặc bọc trong
  /// `data`/`result` của `BaseData`.
  Future<BaseData<List<PersonalAttendanceItem>>> getEmployeeAttendance({
    required Map<String, dynamic> query,
  }) async {
    return get<BaseData<List<PersonalAttendanceItem>>>(
      ApiEndPoint.getEmployeeAttendance,
      query: query,
      parser: (json) {
        // Trường hợp 1: response là mảng trần.
        if (json is List) {
          final items = json
              .whereType<Map>()
              .map(
                (e) => PersonalAttendanceItem.fromJson(
                  e.cast<String, dynamic>(),
                ),
              )
              .toList();
          return BaseData<List<PersonalAttendanceItem>>(
            data: items,
            status: 1,
          );
        }
        // Trường hợp 2: response bọc trong `BaseData` chuẩn.
        final root = (json is Map) ? json : <String, dynamic>{};
        return BaseData<List<PersonalAttendanceItem>>.fromJson(
          root.cast<String, dynamic>(),
          (data) {
            if (data is List) {
              return data
                  .whereType<Map>()
                  .map(
                    (e) => PersonalAttendanceItem.fromJson(
                      e.cast<String, dynamic>(),
                    ),
                  )
                  .toList();
            }
            return <PersonalAttendanceItem>[];
          },
        );
      },
    );
  }
}
