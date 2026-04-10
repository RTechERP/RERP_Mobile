import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/missed_model.dart';

@injectable
class MissedService extends DioBaseApiService {
  MissedService(super.dio);

  Future<BaseData<List<MissedItem>>> getMissed({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<MissedItem>>>(
      ApiEndPoint.getMissed,
      body: payload,
      parser: (json) => BaseData<List<MissedItem>>.fromJson(
        json,
            (data) {
          final list = (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => MissedItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<ApproverItem>>> getApprover() {
    return get<BaseData<List<ApproverItem>>>(
      ApiEndPoint.getApprover,
      parser: (json) => BaseData<List<ApproverItem>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => ApproverItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveMissed({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveMissed,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  /// `true` = đã tồn tại bản ghi trùng (không cho tạo/sửa); `false` = được phép.
  Future<BaseData<bool>> checkDuplicateEnf({
    required int contextId,
    required int employeeId,
    required String dateIso,
    required int type,
  }) {
    final path =
        '${ApiEndPoint.checkDuplicateEnfMissed}/$contextId/$employeeId/$dateIso/$type';
    return get<BaseData<bool>>(
      path,
      parser: _parseCheckDuplicateEnfResponse,
    );
  }

  BaseData<bool> _parseCheckDuplicateEnfResponse(dynamic json) {
    if (json is bool) {
      return BaseData<bool>(data: json, status: 1);
    }
    if (json is Map<String, dynamic>) {
      return BaseData<bool>.fromJson(json, (data) {
        if (data is bool) return data;
        if (data is String) {
          final s = data.toLowerCase().trim();
          if (s == 'true') return true;
          if (s == 'false') return false;
        }
        if (data is num) return data != 0;
        return false;
      });
    }
    throw FormatException('check-duplicate-enf: unexpected body $json');
  }

  Future<BaseData<FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    return get<BaseData<FillApproverItem>>(
      ApiEndPoint.getFillAprrover,
      query: {'employeeID': employeeID, 'tableName': tableName},
      parser: (json) => BaseData<FillApproverItem>.fromJson(
        json,
        (data) => FillApproverItem.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}