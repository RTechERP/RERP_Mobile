import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../datasource/model/part_list_model.dart';
import '../datasource/service/material_category_service.dart';
import 'material_category_repo.dart';

@LazySingleton(as: MaterialCategoryRepo)
class MaterialCategoryRepoImpl implements MaterialCategoryRepo {
  final MaterialCategoryService _service;

  MaterialCategoryRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<PartListModel>>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    required int projectTypeId,
    String keyword = '',
  }) async {
    try {
      final data = await _service.getPartList(
        projectId: projectId,
        projectPartListVersionId: projectPartListVersionId,
        projectTypeId: projectTypeId,
        keyword: keyword,
      );
      return right(data);
    } catch (e) {
      return left(BaseError.httpInternalServerError(_extractMessage(e)));
    }
  }

  @override
  Future<Either<BaseError, Unit>> cancelApproveNew(PartListModel item) async {
    try {
      await _service.cancelApproveNew(item);
      return right(unit);
    } catch (e) {
      return left(BaseError.httpInternalServerError(_extractMessage(e)));
    }
  }

  /// Duyệt mới (TBP) — flow 2 bước: check trước rồi duyệt.
  /// Nếu API check trả message khác "Đã xử lý thành công!" thì trả về lỗi
  /// với chính message backend (vd: "Mã SP đã tồn tại...") để hiện snackbar.
  /// Đặt `checkOkMessage` cho phép test hoặc tuỳ biến sau này.
  static const String checkOkMessage = 'Đã xử lý thành công!';

  @override
  Future<Either<BaseError, Unit>> approveNew(PartListModel item) async {
    try {
      final msg = await _service.checkApproveNew(item);
      if (msg.trim() != checkOkMessage) {
        // Backend trả message lỗi nghiệp vụ — hiển thị nguyên văn.
        return left(BaseError.httpInternalServerError(
          msg.isEmpty ? 'Không thể duyệt mới' : msg,
        ));
      }
      await _service.approveNew(item);
      return right(unit);
    } catch (e) {
      return left(BaseError.httpInternalServerError(_extractMessage(e)));
    }
  }

  @override
  Future<Either<BaseError, Unit>> approveFix(
    PartListModel item, {
    required bool isFix,
  }) async {
    try {
      await _service.approveFix(item, isFix: isFix);
      return right(unit);
    } catch (e) {
      return left(BaseError.httpInternalServerError(_extractMessage(e)));
    }
  }

  @override
  Future<Either<BaseError, Unit>> requestExportTransfer({
    required String warehouseCode,
    required List<PartListModel> items,
  }) async {
    try {
      await _service.requestExport(
        warehouseCode: warehouseCode,
        items: items,
      );
      return right(unit);
    } catch (e) {
      return left(BaseError.httpInternalServerError(_extractMessage(e)));
    }
  }

  /// Trích nội dung `message` từ exception.
  /// - DioException: lấy từ `response.data` (body trả về), ưu tiên `message`.
  /// - Exception khác: trả về `e.toString()`.
  /// Tránh hiện `DioException [bad response]: ...` thay vì message backend.
  String _extractMessage(Object e) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map) {
        final m = data['message'] ??
            data['msg'] ??
            data['Message'] ??
            data['errorDescription'] ??
            data['title'];
        if (m is String && m.isNotEmpty) return m;
      }
      if (data is String && data.trim().isNotEmpty) return data.trim();
      final raw = e.message;
      if (raw != null && raw.isNotEmpty && raw != 'null') return raw;
    }
    return e.toString();
  }
}
