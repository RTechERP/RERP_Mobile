import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/leave_model.dart';

@injectable
class LeaveService extends DioBaseApiService {
  LeaveService(super.dio);

  Future<BaseData<List<LeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<LeaveItem>>>(
      ApiEndPoint.getLeave,
      body: payload,
      parser: (json) => BaseData<List<LeaveItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => LeaveItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => LeaveItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<List<LeaveTimeItem>>> getLeaveTime({
    required Map<String, dynamic> body,
  }) {
    return post<BaseData<List<LeaveTimeItem>>>(
      ApiEndPoint.getLeaveTime,
      body: body,
      parser: (json) => BaseData<List<LeaveTimeItem>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => LeaveTimeItem.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          final list =
              (data as Map<String, dynamic>?)?['data'] as List? ?? [];
          return list
              .map((e) => LeaveTimeItem.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      ),
    );
  }

  Future<BaseData<LeavePhaseMultiDto?>> getLeavePhaseMulti(int phaseId) {
    return get<BaseData<LeavePhaseMultiDto?>>(
      '${ApiEndPoint.getLeavePhaseMulti}/$phaseId',
      parser: (dynamic json) {
        final root = Map<String, dynamic>.from(json as Map);
        return BaseData<LeavePhaseMultiDto?>.fromJson(
          root,
          (data) => LeavePhaseMultiDto.tryParse(
            data ?? root,
            fallbackPhaseId: phaseId,
          ),
        );
      },
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

  Future<BaseData<List<EmployeeLeave>>> getEmployeeLeave() {
    return get<BaseData<List<EmployeeLeave>>>(
      ApiEndPoint.getEmployeeLeave,
      parser: (json) => BaseData<List<EmployeeLeave>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => EmployeeLeave.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveMultiLeave({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveMultiLeave,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<void>> saveLeave({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveLeave,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
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