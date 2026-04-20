import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/stationery_model.dart';

@injectable
class StationeryService extends DioBaseApiService {
  StationeryService(super.dio);

  Future<BaseData<List<StationeryItem>>> getStationeryItem({
    String keyword = '',
    String monthInput = '',
    int departmentId = 0,
  }) async {
    return get<BaseData<List<StationeryItem>>>(
      ApiEndPoint.getStationery,
      query: {
        'keyword': keyword,
        'monthInput': monthInput,
        'departmentID': departmentId,
      },
      parser: (json) => _parseList<StationeryItem>(
        json,
        StationeryItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<StationerySupplyItem>>> getSupplyItem() async {
    return get<BaseData<List<StationerySupplyItem>>>(
      ApiEndPoint.getStationerySupply,
      parser: (json) => _parseList<StationerySupplyItem>(
        json,
        StationerySupplyItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<StationeryDetailItem>>> getStationeryDetailItem({
    required int officeSupplyRequestsId,
  }) async {
    return get<BaseData<List<StationeryDetailItem>>>(
      ApiEndPoint.getStationeryDetail,
      query: {
        'officeSupplyRequestsID': officeSupplyRequestsId,
      },
      parser: (json) => _parseList<StationeryDetailItem>(
        json,
        StationeryDetailItem.fromJson,
      ),
    );
  }

  Future<BaseData<void>> saveStationery({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveStationery,
      body: payload,
      parser: (json) =>
          BaseData<void>.fromJson(json as Map<String, dynamic>, (_) {}),
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
