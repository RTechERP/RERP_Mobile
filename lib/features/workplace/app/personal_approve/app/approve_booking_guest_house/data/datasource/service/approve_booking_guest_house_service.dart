// Service cho màn Duyệt phiếu thanh toán Đặt phòng nhà nghỉ.
// API: GET /AccommodationBookingPaymentOrder/get-pending-for-tbp

import 'package:injectable/injectable.dart';

import '../../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../models/approve_booking_guest_house_model.dart';

@injectable
class ApproveBookingGuestHouseService extends DioBaseApiService {
  ApproveBookingGuestHouseService(super.dio);

  /// Lấy danh sách phiếu thanh toán đặt phòng nhà nghỉ chờ duyệt TBP.
  /// API: GET /AccommodationBookingPaymentOrder/get-pending-for-tbp
  Future<BaseData<List<ApproveBookingGuestHouseItem>>>
      getPendingForTbp() async {
    return get<BaseData<List<ApproveBookingGuestHouseItem>>>(
      ApiEndPoint.accommodationBookingPaymentOrderGetPendingForTbp,
      parser: (json) => _parseList(json),
    );
  }

  /// Lấy danh sách dự án cho bộ lọc.
  /// API: GET /ProjectTask/get-all-project
  Future<BaseData<List<ApproveProjectFilterItem>>>
      getApproveBookingGuestHouseProjects() {
    return get<BaseData<List<ApproveProjectFilterItem>>>(
      ApiEndPoint.getAllProject,
      parser: (json) => BaseData<List<ApproveProjectFilterItem>>.fromJson(
        json,
        (data) {
          final list = data as List?;
          return (list ?? [])
              .map((e) => ApproveProjectFilterItem.fromJson(
                    e as Map<String, dynamic>,
                  ))
              .toList();
        },
      ),
    );
  }

  /// Lấy danh sách nhân viên cho bộ lọc người đăng ký.
  /// API: GET /Employee?status=0&departmentID=0&keyword=
  Future<BaseData<List<ApproveEmployeeFilterItem>>>
      getApproveBookingGuestHouseEmployees({String keyword = ''}) {
    return get<BaseData<List<ApproveEmployeeFilterItem>>>(
      ApiEndPoint.getEmployee,
      query: {
        'status': 0,
        'departmentID': 0,
        'keyword': keyword,
      },
      parser: (json) => _parseListGeneric<ApproveEmployeeFilterItem>(
        json,
        (e) => ApproveEmployeeFilterItem.fromJson(
          e as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Parse response — API có thể trả về:
  /// 1. Mảng trực tiếp `[ {...}, {...} ]` (không có envelope `BaseData`).
  /// 2. Envelope `{ status, data: [...] }` chuẩn của project.
  BaseData<List<ApproveBookingGuestHouseItem>> _parseList(dynamic json) {
    if (json is List) {
      return BaseData<List<ApproveBookingGuestHouseItem>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map(
              (e) => ApproveBookingGuestHouseItem.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );
    }

    return BaseData<List<ApproveBookingGuestHouseItem>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data
              .map(
                (e) => ApproveBookingGuestHouseItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        }
        return <ApproveBookingGuestHouseItem>[];
      },
    );
  }

  /// Cập nhật trạng thái duyệt của 1 phiếu (DetailID).
  /// API: POST /AccommodationBookingPaymentOrder/update-detail-status
  /// [detailId] — ID bản ghi cần duyệt / huỷ duyệt.
  /// [status] — `3` = đã duyệt, `2` = chưa duyệt (huỷ duyệt).
  Future<bool> updateDetailStatus({
    required int detailId,
    required int status,
  }) {
    return post<bool>(
      ApiEndPoint.accommodationBookingPaymentOrderUpdateDetailStatus,
      body: {
        'DetailID': detailId,
        'Status': status,
      },
      parser: (json) {
        // API trả về { status, message } hoặc tương tự.
        if (json is Map) {
          return (json['status'] == 1 || json['status'] == true);
        }
        return false;
      },
    );
  }

  /// Generic parse cho các list đơn giản.
  BaseData<List<T>> _parseListGeneric<T>(
    dynamic json,
    T Function(dynamic e) mapper,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List).map(mapper).toList(),
      );
    }
    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) return data.map(mapper).toList();
        return <T>[];
      },
    );
  }
}
