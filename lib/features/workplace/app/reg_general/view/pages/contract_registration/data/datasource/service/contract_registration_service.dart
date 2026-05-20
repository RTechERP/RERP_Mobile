import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/contract_registration_model.dart';

@injectable
class ContractRegistrationService extends DioBaseApiService {
  ContractRegistrationService(super.dio);

  Future<BaseData<List<ContractResponseItem>>> getContract({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<ContractResponseItem>>>(
      ApiEndPoint.getContract,
      body: payload,
      parser: (json) => _parseList<ContractResponseItem>(
        json,
        ContractResponseItem.fromJson,
      ),
    );
  }

  /// Parse response - hỗ trợ cả khi data là List hoặc Map.
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
