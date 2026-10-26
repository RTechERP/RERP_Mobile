import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';

/// Service gọi API lịch sử nhập/xuất kho. Chỉ giao tiếp mạng, không chứa
/// business logic.
@injectable
class HistoryImportExportService extends DioBaseApiService {
  HistoryImportExportService(super.dio);

  /// Lấy danh sách lịch sử nhập/xuất — `POST /HistoryImportExport`.
  /// [payload] gồm `Status`, `DateStart`, `DateEnd`, `FilterText`,
  /// `PageNumber`, `PageSize`, `WarehouseCode`, `checkedAll`.
  Future<BaseData<List<HistoryImportExportResponse>>> getHistory({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<HistoryImportExportResponse>>>(
      ApiEndPoint.getHistoryImportExport,
      body: payload,
      parser: (json) => BaseData<List<HistoryImportExportResponse>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) =>
                HistoryImportExportResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
