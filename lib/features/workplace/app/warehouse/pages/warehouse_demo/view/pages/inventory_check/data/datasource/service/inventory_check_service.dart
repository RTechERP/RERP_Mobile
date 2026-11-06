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

  /// Lấy danh sách nhân viên được giao kiểm kê —
  /// `GET /WarehouseInventoryCount/get-employees`.
  Future<BaseData<List<InventoryCheckEmployee>>> getEmployees() async {
    return get<BaseData<List<InventoryCheckEmployee>>>(
      ApiEndPoint.getInventoryCountEmployees,
      parser: (json) => BaseData<List<InventoryCheckEmployee>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
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
        (data) => ((data as List?) ?? const <dynamic>[])
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
      parser: (json) =>
          BaseData<String>.fromJson(json, (data) => (data as String?) ?? ''),
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
}
