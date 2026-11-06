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

  /// Bóc mảng dữ liệu từ response — server có thể trả mảng trực tiếp hoặc
  /// bọc trong `{ "data": [...] }`.
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
      parser: (json) => BaseData<List<InventoryCheckEmployee>>.fromJson(
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
      parser: (json) => BaseData<List<InventoryCountItem>>.fromJson(
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
      parser: (json) {
        if (json is String) {
          return BaseData<String>.fromJson({'data': json}, (_) => json);
        }
        final map = json as Map<String, dynamic>;
        return BaseData<String>.fromJson(
          map,
          (data) => (data as String?) ?? '',
        );
      },
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
      parser: (json) => BaseData<InventoryCountSaveResult>.fromJson(
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
  ///
  /// Server có thể trả object trực tiếp hoặc bọc trong `{ "data": {...} }` →
  /// parser nhận cả 2 dạng.
  Future<BaseData<InventoryCountDetail>> getInventoryCountById({
    required int id,
  }) async {
    return get<BaseData<InventoryCountDetail>>(
      ApiEndPoint.getInventoryCountById,
      query: {'id': id},
      parser: (json) {
        final map = json as Map<String, dynamic>;
        final data = map['data'];
        final detailJson = data is Map<String, dynamic> ? data : map;
        return BaseData<InventoryCountDetail>.fromJson(
          map,
          (_) => InventoryCountDetail.fromJson(detailJson),
        );
      },
    );
  }

  /// Xoá một đợt kiểm kê — `POST /WarehouseInventoryCount/delete?id=X`.
  ///
  /// Server trả `data` là `true` khi xoá thành công.
  Future<BaseData<bool>> deleteInventoryCount({required int id}) async {
    return post<BaseData<bool>>(
      ApiEndPoint.deleteInventoryCount,
      query: {'id': id},
      parser: (json) {
        final map = json as Map<String, dynamic>;
        final data = map['data'];
        return BaseData<bool>.fromJson(map, (_) => data == true);
      },
    );
  }
}
