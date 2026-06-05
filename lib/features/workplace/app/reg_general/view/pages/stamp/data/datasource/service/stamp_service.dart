import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/stamp_model.dart';

@injectable
class StampService extends DioBaseApiService {
  StampService(super.dio);

  Future<BaseData<List<StampItem>>> getStamp({
    required Map<String, dynamic> payload,
  }) async {
    return get<BaseData<List<StampItem>>>(
      ApiEndPoint.getStamp,
      query: payload,
      parser: (json) => _parseList(
        json,
        StampItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<AssignerStampItem>>> getEmployees() async {
    return get<BaseData<List<AssignerStampItem>>>(
      ApiEndPoint.getStampEmployees,
      parser: (json) => _parseList(
        json,
        AssignerStampItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<SealItem>>> getSealRegulations() async {
    return get<BaseData<List<SealItem>>>(
      ApiEndPoint.getStampSealRegulations,
      parser: (json) => _parseList(
        json,
        SealItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<DocumentStampItem>>> getDocumentTypes() async {
    return get<BaseData<List<DocumentStampItem>>>(
      ApiEndPoint.getStampDocumentTypes,
      parser: (json) => _parseList(
        json,
        DocumentStampItem.fromJson,
      ),
    );
  }

  Future<BaseData<List<CompanyStampItem>>> getTaxCompanies() async {
    return get<BaseData<List<CompanyStampItem>>>(
      ApiEndPoint.getStampTaxCompanies,
      parser: (json) => _parseList(
        json,
        CompanyStampItem.fromJson,
      ),
    );
  }

  Future<Map<String, dynamic>> saveStamp({
    required Map<String, dynamic> payload,
  }) async {
    final res = await dio.post(
      ApiEndPoint.saveStamp,
      data: payload,
    );
    return res.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> deleteStamp({
    required int id,
  }) async {
    final res = await dio.post(
      '/TrackingMarks/delete-tracking-marks',
      queryParameters: {'id': id},
    );
    return res.data as Map<String, dynamic>;
  }

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
          final items = (data as Map<String, dynamic>).values
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
