import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/overtime_model.dart';

@injectable
class OvertimeService extends DioBaseApiService {
  OvertimeService(super.dio);

  Future<BaseData<List<OvertimeItem>>> getOvertime({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<OvertimeItem>>>(
      ApiEndPoint.getOvertime,
      body: payload,
      parser: (json) => BaseData<List<OvertimeItem>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => OvertimeItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => OvertimeItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<OvertimeType>>> getOvertimeType() {
    return get<BaseData<List<OvertimeType>>>(
      ApiEndPoint.getOvertimeType,
      parser: (json) => BaseData<List<OvertimeType>>.fromJson(
        json,
            (data) {
          if (data is List) {
            return data
                .map((e) => OvertimeType.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => OvertimeType.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  // Future<BaseData<OvertimePhaseMultiDto?>> getOvertimePhaseMulti(int phaseId) {
  //   return get<BaseData<OvertimePhaseMultiDto?>>(
  //     '${ApiEndPoint.getOvertimePhaseMulti}/$phaseId',
  //     parser: (dynamic json) {
  //       final root = Map<String, dynamic>.from(json as Map);
  //       return BaseData<OvertimePhaseMultiDto?>.fromJson(
  //         root,
  //             (data) => OvertimePhaseMultiDto.tryParse(
  //           data ?? root,
  //           fallbackPhaseId: phaseId,
  //         ),
  //       );
  //     },
  //   );
  // }

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

  // Future<BaseData<List<EmployeeOvertime>>> getEmployeeOvertime() {
  //   return get<BaseData<List<EmployeeOvertime>>>(
  //     ApiEndPoint.getEmployeeOvertime,
  //     parser: (json) => BaseData<List<EmployeeOvertime>>.fromJson(
  //       json,
  //           (data) => (data as List)
  //           .map((e) => EmployeeOvertime.fromJson(e as Map<String, dynamic>))
  //           .toList(),
  //     ),
  //   );
  // }

  Future<BaseData<void>> saveMultiOvertime({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveOvertime,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<List<OvertimeProject>>> getOvertimeProject() {
    return get<BaseData<List<OvertimeProject>>>(
      ApiEndPoint.getOvertimeProject,
      parser: (json) => BaseData<List<OvertimeProject>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => OvertimeProject.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveOvertime({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveOvertime,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<OvertimeDetailItem>> getOvertimeById(int id) {
    return get<BaseData<OvertimeDetailItem>>(
      '${ApiEndPoint.getOvertimeById}?ID=$id',
      parser: (json) => BaseData<OvertimeDetailItem>.fromJson(
        json,
        (data) {
          // Response: { "employeeOverTime": {...}, "overTimeFile": {...} }
          final map = data as Map<String, dynamic>;
          final inner = (map['employeeOverTime'] ?? map) as Map<String, dynamic>;
          return OvertimeDetailItem.fromJson(inner);
        },
      ),
    );
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