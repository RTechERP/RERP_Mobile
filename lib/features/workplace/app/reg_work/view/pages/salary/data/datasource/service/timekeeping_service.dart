import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import '../models/timekeeping_model.dart';

@injectable
class TimekeepingService extends DioBaseApiService {
  TimekeepingService(super.dio);

  Future<BaseData<List<TimekeepingItem>>> getTimekeeping({
    required int month,
    required int year,
    int? employeeId,
  }) async {
    return get<BaseData<List<TimekeepingItem>>>(
      ApiEndPoint.getTimekeeping,
      query: {
        'month': month,
        'year': year,
        if (employeeId != null) 'employeeId': employeeId,
      },
      parser: (json) => BaseData<List<TimekeepingItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => TimekeepingItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => TimekeepingItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<TimekeepingDayItem>>> getTimekeepingDays({
    required int month,
    required int year,
    int? employeeId,
  }) async {
    return get<BaseData<List<TimekeepingDayItem>>>(
      ApiEndPoint.getTimekeepingDays,
      query: {
        'month': month,
        'year': year,
        if (employeeId != null) 'employeeId': employeeId,
      },
      parser: (json) => BaseData<List<TimekeepingDayItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) =>
                    TimekeepingDayItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) =>
                  TimekeepingDayItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }
}
