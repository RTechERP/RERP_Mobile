import 'package:dartz/dartz.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';

/// Contract truy xuất dữ liệu lịch sử nhập/xuất kho.
abstract class HistoryImportExportRepo {
  /// Lấy danh sách lịch sử nhập/xuất theo [payload] (khoảng ngày, từ khoá,
  /// mã kho...). Trả về [BaseError] khi API lỗi hoặc `status != 1`.
  Future<Either<BaseError, List<HistoryImportExportResponse>>> getHistory({
    required Map<String, dynamic> payload,
  });
}
