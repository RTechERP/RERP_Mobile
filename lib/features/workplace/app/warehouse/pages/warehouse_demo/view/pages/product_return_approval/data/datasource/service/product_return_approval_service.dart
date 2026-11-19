import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/product_return_approval/data/datasource/models/product_return_approval_model.dart';

/// Service gọi API duyệt trả sản phẩm (Borrow).
/// Chỉ giao tiếp mạng, không chứa business logic.
@injectable
class ProductReturnApprovalService extends DioBaseApiService {
  ProductReturnApprovalService(super.dio);

  /// Bọc payload đã parse vào [BaseData].
  ///
  /// API Borrow trả 2 kiểu: payload trực tiếp (mảng / object) hoặc bọc
  /// trong `{ "data": ..., "message": ... }` → hàm này nhận cả 2.
  static BaseData<T> _wrap<T>(dynamic json, T Function(dynamic data) parse) {
    if (json is Map<String, dynamic>) {
      final raw = json['data'];
      final payload = raw ?? json;
      final status = json['status'];
      return BaseData<T>()
        ..data = parse(payload)
        ..status = status is num ? status.toInt() : null
        ..message = json['message'] as String?;
    }
    return BaseData<T>()..data = parse(json);
  }

  /// Lấy danh sách nhân viên (kèm phòng ban & nhóm) được giao duyệt trả sản
  /// phẩm — `GET /borrow/get-employee-team-and-department`.
  Future<BaseData<List<ProductReturnEmployee>>>
  getEmployeeTeamAndDepartment() async {
    return get<BaseData<List<ProductReturnEmployee>>>(
      ApiEndPoint.getBorrowEmployeeTeamAndDepartment,
      parser: (json) => _wrap(json, (data) {
        if (data is List) {
          return data
              .map(
                (e) =>
                    ProductReturnEmployee.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        }
        if (data is Map<String, dynamic>) {
          return [ProductReturnEmployee.fromJson(data)];
        }
        return const <ProductReturnEmployee>[];
      }),
    );
  }

  /// Lấy danh sách phiếu trả sản phẩm —
  /// `GET /borrow/get-product-history`.
  ///
  /// - [keyWords] từ khoá tìm kiếm (mã / tên sản phẩm, người mượn).
  /// - [dateStart] / [dateEnd] theo định dạng `yyyy-MM-dd HH:mm:ss`.
  /// - [warehouseId] id kho (1 = kho HN).
  /// - [userId] lọc theo người dùng (0 = tất cả).
  /// - [status] danh sách trạng thái phiếu cần lấy (vd. `5,4`).
  /// - [warehouseType] loại kho (0 = mặc định).
  /// - [page] / [size] phân trang.
  Future<BaseData<List<ProductReturnHistoryItem>>> getProductHistory({
    String? keyWords,
    required String dateStart,
    required String dateEnd,
    required int warehouseId,
    int userId = 0,
    String status = '5,4',
    int isDeleted = 0,
    int warehouseType = 0,
    int page = 1,
    int size = 9999999,
  }) async {
    return get<BaseData<List<ProductReturnHistoryItem>>>(
      ApiEndPoint.getBorrowProductHistory,
      query: {
        'keyWords': keyWords ?? '',
        'dateStart': dateStart,
        'dateEnd': dateEnd,
        'warehouseID': warehouseId,
        'userID': userId,
        'status': status,
        'isDeleted': isDeleted,
        'warehouseType': warehouseType,
        'page': page,
        'size': size,
      },
      parser: (json) => _wrap(json, (data) {
        // Server có thể trả mảng trực tiếp, bọc trong `data`, hoặc trả
        // object phân trang `{ "TotalPage": n, "data": [...] }`.
        final list = _extractList(data);
        return list
            .map(
              (e) =>
                  ProductReturnHistoryItem.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }),
    );
  }

  /// Bóc mảng dữ liệu từ nhiều dạng payload server có thể trả về.
  static List<dynamic> _extractList(dynamic json) {
    if (json is List) return json;
    if (json is Map<String, dynamic>) {
      final data = json['data'];
      if (data is List) return data;
      if (data is Map<String, dynamic>) {
        final inner = data['data'];
        if (inner is List) return inner;
      }
      // Payload là 1 bản ghi đơn lẻ (không bọc mảng).
      if (json.containsKey('ProductCode') || json.containsKey('ProductRTCID')) {
        return [json];
      }
    }
    return const <dynamic>[];
  }

  /// Lấy chi tiết 1 phiếu trả sản phẩm —
  /// `GET /borrow/get-history-product-rtc-by-id`.
  ///
  /// - [productHistoryId] id phiếu trả sản phẩm cần xem chi tiết.
  Future<BaseData<ProductReturnHistoryDetail>> getHistoryDetail({
    required int productHistoryId,
  }) async {
    return get<BaseData<ProductReturnHistoryDetail>>(
      ApiEndPoint.getBorrowHistoryProductRtcById,
      query: {'productHistoryID': productHistoryId},
      parser: (json) {
        final payload = _extractDetail(json);
        return BaseData<ProductReturnHistoryDetail>()
          ..data = ProductReturnHistoryDetail.fromJson(payload)
          ..status = _extractStatus(json);
      },
    );
  }

  /// Duyệt phiếu trả sản phẩm — `POST /borrow/return-productrtc`.
  ///
  /// - [historyId] id phiếu cần duyệt (lấy từ API chi tiết).
  /// - [isAdmin] duyệt với quyền quản lý.
  /// - [modulaLocationDetailId] id ô Modula đã kiểm (0 = không xác định).
  Future<BaseData<int>> approveReturnProduct({
    required int historyId,
    bool isAdmin = true,
    int modulaLocationDetailId = 0,
  }) async {
    return post<BaseData<int>>(
      ApiEndPoint.returnBorrowProductRtc,
      body: {
        'HistoryId': historyId,
        'IsAdmin': isAdmin,
        'ModulaLocationDetailID': modulaLocationDetailId,
      },
      parser: (json) {
        final data = json is Map<String, dynamic> ? json['data'] : null;
        final id = data is Map<String, dynamic>
            ? (data['id'] as num?)?.toInt()
            : (data as num?)?.toInt();
        return BaseData<int>()
          ..data = id
          ..status = _extractStatus(json);
      },
    );
  }

  /// Bóc object chi tiết từ payload (bọc trong `data` hoặc trả trực tiếp).
  static Map<String, dynamic> _extractDetail(dynamic json) {
    if (json is Map<String, dynamic>) {
      final data = json['data'];
      if (data is Map<String, dynamic>) return data;
      return json;
    }
    return const <String, dynamic>{};
  }

  /// Lấy `status` từ payload nếu có.
  static int? _extractStatus(dynamic json) {
    if (json is Map<String, dynamic>) {
      final status = json['status'];
      if (status is num) return status.toInt();
      if (status is bool) return status ? 1 : 0;
    }
    return null;
  }
}
