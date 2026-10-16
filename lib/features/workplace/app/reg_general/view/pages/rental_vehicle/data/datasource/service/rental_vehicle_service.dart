// Date: 16/10/2026
// Nội dung/Chức năng: Service gọi API cho chức năng thuê xe tải.

import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';

import '../models/rental_vehicle_model.dart';

@injectable
class RentalVehicleService extends DioBaseApiService {
  RentalVehicleService(super.dio);

  /// Tìm kiếm yêu cầu thuê xe tải.
  /// API: `POST /VehicleRentalRequest/search`
  /// Response là một mảng JSON các `RentalVehicleItem` (raw array).
  Future<BaseData<List<RentalVehicleItem>>> searchRentalVehicle({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<RentalVehicleItem>>>(
      ApiEndPoint.searchVehicleRental,
      body: payload,
      parser: (json) => _parseList<RentalVehicleItem>(
        json,
        RentalVehicleItem.fromJson,
      ),
    );
  }

  /// Parse response — hỗ trợ cả khi data là List hoặc Map (lấy field 'data'/'items'/'result').
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
  }
}
