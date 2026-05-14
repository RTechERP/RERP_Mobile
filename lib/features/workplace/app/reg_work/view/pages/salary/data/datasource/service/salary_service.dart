import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import '../models/salary_model.dart';

@injectable
class SalaryService extends DioBaseApiService {
  SalaryService(super.dio);

  Future<BaseData<List<SalaryItem>>> getSalary() async {
    return get<BaseData<List<SalaryItem>>>(
      ApiEndPoint.getSalary,
      parser: (json) => BaseData<List<SalaryItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => SalaryItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => SalaryItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

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
}
