import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/personal_asset_model.dart';

@injectable
class PersonalAssetService extends DioBaseApiService {
  PersonalAssetService(super.dio);

  Future<BaseData<List<PersonalAssetItem>>> getPersonalAsset({
    required Map<String, dynamic> payload,
  }) async {
    final res = await post<BaseData<List<PersonalAssetItem>>>(
      ApiEndPoint.getPersonalAsset,
      body: payload,
      parser: (json) {
        // API trả: { data: [[{...}]] } — nested list
        if (json is Map) {
          final data = json['data'];
          if (data is List && data.isNotEmpty) {
            final inner = data.first;
            if (inner is List) {
              return BaseData(
                status: 1,
                data: inner
                    .map((e) => PersonalAssetItem.fromJson(e as Map<String, dynamic>))
                    .toList(),
              );
            }
          }
        }
        // Fallback: API trả: { data: [{...}] } — wrapped object
        return BaseData<List<PersonalAssetItem>>.fromJson(
          json as Map<String, dynamic>,
          (data) {
            if (data is List && data.isNotEmpty) {
              final first = data.first;
              if (first is List) {
                return first
                    .map((e) => PersonalAssetItem.fromJson(e as Map<String, dynamic>))
                    .toList();
              }
            }
            return <PersonalAssetItem>[];
          },
        );
      },
    );
    return res;
  }

  Future<BaseData<List<PersonalPropertyItem>>> getPersonalProperty() async {
    final res = await post<BaseData<List<PersonalPropertyItem>>>(
      ApiEndPoint.getPersonalProperty,
      parser: (json) {
        if (json is Map) {
          final data = json['data'];
          if (data is List && data.isNotEmpty) {
            final inner = data.first;
            if (inner is List) {
              return BaseData(
                status: 1,
                data: inner
                    .map((e) => PersonalPropertyItem.fromJson(e as Map<String, dynamic>))
                    .toList(),
              );
            }
          }
        }
        return BaseData<List<PersonalPropertyItem>>.fromJson(
          json as Map<String, dynamic>,
          (data) {
            if (data is List && data.isNotEmpty) {
              final first = data.first;
              if (first is List) {
                return first
                    .map((e) => PersonalPropertyItem.fromJson(e as Map<String, dynamic>))
                    .toList();
              }
            }
            return <PersonalPropertyItem>[];
          },
        );
      },
    );
    return res;
  }
}
