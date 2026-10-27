// Service cho màn Duyệt ĐNTT Đặt xe / Nhà nghỉ.
// API:
//   - GET  /VehicleBookingPaymentOrder/get-approve-steps
//   - POST /VehicleBookingPaymentOrder/get-unified-list
//   - GET  /Department/get-all
//   - GET  /Employee?status=0&departmentID=0&keyword=

import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/approve_booking_payment_model.dart';

@injectable
class ApproveBookingPaymentService extends DioBaseApiService {
  ApproveBookingPaymentService(super.dio);

  /// Lấy danh sách bước duyệt ĐNTT.
  /// API: GET /VehicleBookingPaymentOrder/get-approve-steps
  Future<BaseData<List<ApproveBookingPaymentStep>>> getApproveSteps() {
    return get<BaseData<List<ApproveBookingPaymentStep>>>(
      ApiEndPoint.vehicleBookingPaymentOrderGetApproveSteps,
      parser: (json) => _parseList(json, ApproveBookingPaymentStep.fromJson),
    );
  }

  /// Lấy danh sách ĐNTT theo bộ lọc + phân trang.
  /// API: POST /VehicleBookingPaymentOrder/get-unified-list
  /// [payload] — StartDate, EndDate, ApproverCode, CreatedByEmployeeID,
  /// Keyword, PageIndex, PageSize...
  Future<BaseData<List<ApproveBookingPaymentItem>>> getUnifiedList({
    required Map<String, dynamic> payload,
  }) {
    return post<BaseData<List<ApproveBookingPaymentItem>>>(
      ApiEndPoint.vehicleBookingPaymentOrderGetUnifiedList,
      body: payload,
      parser: (json) => _parseList(json, ApproveBookingPaymentItem.fromJson),
    );
  }

  /// Lấy danh sách phòng ban cho bộ lọc.
  /// API: GET /Department/get-all
  Future<BaseData<List<ApproveBookingPaymentDepartment>>> getDepartments() {
    return get<BaseData<List<ApproveBookingPaymentDepartment>>>(
      ApiEndPoint.getDepart,
      parser: (json) =>
          _parseList(json, ApproveBookingPaymentDepartment.fromJson),
    );
  }

  /// Lấy danh sách nhân viên cho bộ lọc người tạo.
  /// API: GET /Employee?status=0&departmentID=0&keyword=
  Future<BaseData<List<ApproveBookingPaymentEmployee>>> getEmployees({
    String keyword = '',
  }) {
    return get<BaseData<List<ApproveBookingPaymentEmployee>>>(
      ApiEndPoint.getEmployee,
      query: {'status': 0, 'departmentID': 0, 'keyword': keyword},
      parser: (json) =>
          _parseList(json, ApproveBookingPaymentEmployee.fromJson),
    );
  }

  /// Parse response dạng list. API có thể trả về mảng trực tiếp
  /// `[ {...} ]`, envelope `{ status, data: [...] }` hoặc envelope lồng
  /// `{ status, data: { data|items|...: [...] } }`.
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final envelope = json is List ? {'status': 1, 'data': json} : json;
    return BaseData<List<T>>.fromJson(
      envelope as Map<String, dynamic>,
      (data) => _extractList(data)
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Lấy mảng bản ghi từ trường `data`: dùng luôn nếu là List; nếu là Map
  /// thì tìm theo các key thường gặp, không có thì lấy giá trị List đầu tiên.
  List<dynamic> _extractList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in const ['data', 'items', 'Items', 'Data', 'rows']) {
        if (data[key] is List) return data[key] as List;
      }
      for (final value in data.values) {
        if (value is List) return value;
      }
    }
    return const [];
  }
}
