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

  /// Danh sách hạng mục công việc theo dự án.
  ///
  /// [status]: 2 = chỉ hạng mục đang thực hiện (mặc định), -1 = tất cả.
  Future<BaseData<List<OvertimeProjectItem>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    return get<BaseData<List<OvertimeProjectItem>>>(
      ApiEndPoint.getProjectItemByUser,
      query: {'projectId': projectId, 'status': status},
      parser: (json) => BaseData<List<OvertimeProjectItem>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => OvertimeProjectItem.fromJson(e as Map<String, dynamic>))
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

  /// Lấy chi tiết phiếu làm thêm.
  ///
  /// Response gồm 3 phần: `employeeOverTime`, `overTimeFile`, `overTimeProjectItem`.
  Future<BaseData<OvertimeDetailResponse>> getOvertimeById(int id) {
    return get<BaseData<OvertimeDetailResponse>>(
      '${ApiEndPoint.getOvertimeById}?ID=$id',
      parser: (json) => BaseData<OvertimeDetailResponse>.fromJson(
        json,
        (data) {
          final map = data as Map<String, dynamic>;
          // BE trả về object bọc ngoài; cũng chấp nhận dạng phẳng (chỉ phiếu).
          if (map.containsKey('employeeOverTime')) {
            return OvertimeDetailResponse.fromJson(map);
          }
          return OvertimeDetailResponse(
            employeeOvertime: OvertimeDetailItem.fromJson(map),
          );
        },
      ),
    );
  }

  /// Danh sách departmentID bắt buộc chọn hạng mục công việc khi đăng ký
  /// làm thêm — bổ sung cho danh sách hardcode phía app.
  Future<BaseData<List<int>>> getDepartmentRequireProjectItem() {
    return get<BaseData<List<int>>>(
      ApiEndPoint.getDepartmentRequireProjectItem,
      parser: (json) => BaseData<List<int>>.fromJson(
        json,
        (data) => (data as List).map((e) => (e as num).toInt()).toList(),
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