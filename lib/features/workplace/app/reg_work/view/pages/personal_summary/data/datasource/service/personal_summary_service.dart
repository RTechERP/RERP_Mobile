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
}
