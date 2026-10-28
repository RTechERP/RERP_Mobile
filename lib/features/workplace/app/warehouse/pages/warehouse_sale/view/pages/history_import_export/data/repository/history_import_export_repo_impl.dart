import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/models/history_import_export_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/datasource/service/history_import_export_service.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/history_import_export/data/repository/history_import_export_repo.dart';

/// Triển khai [HistoryImportExportRepo]: gọi service và map lỗi về [BaseError].
@LazySingleton(as: HistoryImportExportRepo)
class HistoryImportExportRepoImpl implements HistoryImportExportRepo {
  final HistoryImportExportService _service;

  HistoryImportExportRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<HistoryImportExportResponse>>> getHistory({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getHistory(payload: payload);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <HistoryImportExportResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
