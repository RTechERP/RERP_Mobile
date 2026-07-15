import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import '../models/salary_model.dart';
import '../models/salary_calendar.dart';

@injectable
class SalaryService extends DioBaseApiService {
  SalaryService(super.dio);
  Future<BaseData<SummarySalaryResponse>> getPersonalSyntheticByMonth({
    required int year,
    required int month,
  }) async {
    return get<BaseData<SummarySalaryResponse>>(
      ApiEndPoint.getPersonalSyntheticByMonth,
      query: {'Year': year, 'Month': month},
      parser: (json) => BaseData<SummarySalaryResponse>.fromJson(
        json,
        (data) => SummarySalaryResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<SalaryCalendarItem>> getCalendar({
    required int month,
    required int year,
  }) {
    return get<BaseData<SalaryCalendarItem>>(
      '${ApiEndPoint.getCalendar}?month=$month&year=$year',
      parser: (json) => BaseData<SalaryCalendarItem>.fromJson(
        json,
        (data) => SalaryCalendarItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
