import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';

/// Service gọi API kiểm kê kho (WarehouseInventoryCount).
/// Chỉ giao tiếp mạng, không chứa business logic.
@injectable
class InventoryCheckService extends DioBaseApiService {
  InventoryCheckService(super.dio);

  /// Bọc payload đã parse vào [BaseData].
  ///
  /// API kiểm kê trả 2 kiểu: payload trực tiếp (mảng / object) hoặc bọc
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

  /// Bóc mảng dữ liệu — server có thể trả mảng trực tiếp hoặc bọc trong
  /// `{ "data": [...] }`.
  static List<dynamic> _extractList(dynamic json) {
    if (json is List) return json;
    if (json is Map<String, dynamic>) {
      final data = json['data'];
      if (data is List) return data;
    }
    return const <dynamic>[];
  }

  /// Lấy danh sách nhân viên được giao kiểm kê —
  /// `GET /WarehouseInventoryCount/get-employees`.
  Future<BaseData<List<InventoryCheckEmployee>>> getEmployees() async {
    return get<BaseData<List<InventoryCheckEmployee>>>(
      ApiEndPoint.getInventoryCountEmployees,
      parser: (json) => _wrap(
        json,
        (data) => _extractList(data)
            .map(
              (e) => InventoryCheckEmployee.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách đợt kiểm kê theo khoảng ngày —
  /// `GET /WarehouseInventoryCount/get-all?dateStart=&dateEnd=`.
  ///
  /// [dateStart] / [dateEnd] theo định dạng `yyyy-MM-dd`.
  Future<BaseData<List<InventoryCountItem>>> getInventoryCounts({
    required String dateStart,
    required String dateEnd,
  }) async {
    return get<BaseData<List<InventoryCountItem>>>(
      ApiEndPoint.getInventoryCounts,
      query: {'dateStart': dateStart, 'dateEnd': dateEnd},
      parser: (json) => _wrap(
        json,
        (data) => _extractList(data)
            .map((e) => InventoryCountItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Sinh mã đợt kiểm kê theo ngày —
  /// `GET /WarehouseInventoryCount/generate-code?date=yyyy-MM-dd`.
  ///
  /// Server trả `data` là mã đợt (vd. `KiemKe_20261106_01`).
  Future<BaseData<String>> generateCode({required String date}) async {
    return get<BaseData<String>>(
      ApiEndPoint.generateInventoryCountCode,
      query: {'date': date},
      parser: (json) => _wrap(json, (data) => (data as String?) ?? ''),
    );
  }

  /// Tạo mới đợt kiểm kê — `POST /WarehouseInventoryCount/save-data`.
  ///
  /// Server trả `data` là thông tin đợt kiểm kê vừa tạo.
  Future<BaseData<InventoryCountSaveResult>> saveInventoryCount({
    required InventoryCountSavePayload payload,
  }) async {
    return post<BaseData<InventoryCountSaveResult>>(
      ApiEndPoint.saveInventoryCount,
      body: payload.toJson(),
      parser: (json) => _wrap(
        json,
        (data) =>
            InventoryCountSaveResult.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy chi tiết một đợt kiểm kê —
  /// `GET /WarehouseInventoryCount/get-by-id?id=X`.
  ///
  /// Dùng để fill sẵn form ở màn chỉnh sửa đợt kiểm kê.
  Future<BaseData<InventoryCountDetail>> getInventoryCountById({
    required int id,
  }) async {
    return get<BaseData<InventoryCountDetail>>(
      ApiEndPoint.getInventoryCountById,
      query: {'id': id},
      parser: (json) => _wrap(
        json,
        (data) => InventoryCountDetail.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Xoá một đợt kiểm kê — `POST /WarehouseInventoryCount/delete?id=X`.
  ///
  /// Server trả `data` là `true` khi xoá thành công.
  Future<BaseData<bool>> deleteInventoryCount({required int id}) async {
    return post<BaseData<bool>>(
      ApiEndPoint.deleteInventoryCount,
      query: {'id': id},
      parser: (json) => _wrap(json, (data) => data == true),
    );
  }

  /// Lấy phiếu kiểm kê kèm danh sách sản phẩm đã kiểm kê —
  /// `GET /WarehouseInventoryCount/get-inventory-sheet?countId=X`.
  Future<BaseData<InventoryCountSheet>> getInventoryCountSheet({
    required int countId,
  }) async {
    return get<BaseData<InventoryCountSheet>>(
      ApiEndPoint.getInventoryCountSheet,
      query: {'countId': countId},
      parser: (json) => _wrap(
        json,
        (data) => InventoryCountSheet.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Lấy nhóm sản phẩm RTC trong kho —
  /// `GET /ProductRTC/product-group-rtc-new?warehouseId=&isDeleted=&isVisible=&warehouseType=`.
  ///
  /// Server bọc payload 2 tầng: `{ "data": { "data": [...] } }`.
  Future<BaseData<List<InventoryProductGroupRtc>>> getProductGroupRtcNew({
    required int warehouseId,
    required int warehouseType,
    bool isDeleted = false,
    bool isVisible = false,
  }) async {
    return get<BaseData<List<InventoryProductGroupRtc>>>(
      ApiEndPoint.getProductGroupRtcNew,
      query: {
        'warehouseId': warehouseId,
        'isDeleted': isDeleted,
        'isVisible': isVisible,
        'warehouseType': warehouseType,
      },
      parser: (json) => _wrap(
        json,
        (data) => _extractList(data)
            .map(
              (e) =>
                  InventoryProductGroupRtc.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lưu kết quả kiểm kê thực tế cho các dòng sản phẩm —
  /// `POST /WarehouseInventoryCount/save-count-details`.
  ///
  /// [changedItems] là danh sách dòng chi tiết cần cập nhật, mỗi dòng gồm
  /// `ID`, `ProductRTCID`, `QuantityActual`, `Note`.
  ///
  /// Server trả `data` là danh sách dòng chi tiết vừa được cập nhật.
  Future<BaseData<bool>> saveCountDetails({
    required int countId,
    required List<Map<String, dynamic>> changedItems,
  }) async {
    return post<BaseData<bool>>(
      ApiEndPoint.saveInventoryCountDetails,
      body: {
        'WarehouseInventoryCountID': countId,
        'ChangedItems': changedItems,
      },
      parser: (json) => _wrap(json, (data) => data != null),
    );
  }

  /// Xác nhận hoàn thành / mở lại một đợt kiểm kê —
  /// `POST /WarehouseInventoryCount/confirm-complete?id=X&isComplete=true`.
  ///
  /// [isComplete] = `true` → hoàn thành (cache số lượng tồn kho & mượn),
  /// `false` → mở lại (tính động theo dữ liệu kho hiện thời).
  ///
  /// Server trả `data` là thông tin đợt kiểm kê sau khi cập nhật.
  Future<BaseData<InventoryCountDetail>> confirmComplete({
    required int id,
    required bool isComplete,
  }) async {
    return post<BaseData<InventoryCountDetail>>(
      ApiEndPoint.confirmCompleteInventoryCount,
      query: {'id': id, 'isComplete': isComplete},
      body: const <String, dynamic>{},
      parser: (json) => _wrap(
        json,
        (data) => InventoryCountDetail.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}
