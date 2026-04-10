import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/missed_model.dart';
import '../datasource/service/missed_service.dart';
import 'missed_repo.dart';

@LazySingleton(as: MissedRepo)
class MissedRepoImpl implements MissedRepo {
  final MissedService _service;

  MissedRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<MissedItem>>> getMissed({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getMissed(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      } else {
        return left(
          BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveMissed({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveMissed(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? "Lưu dữ liệu thành công");
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<ApproverItem>>> getApprover() async {
    try {
      final res = await _service.getApprover();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  String _dateIso(DateTime d) {
    return '${d.year.toString().padLeft(4, '0')}-'
        '${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}';
  }

  @override
  Future<Either<BaseError, bool>> checkMissedDuplicate({
    required int contextId,
    required int employeeId,
    required DateTime dateMissed,
    required int type,
  }) async {
    try {
      final res = await _service.checkDuplicateEnf(
        contextId: contextId,
        employeeId: employeeId,
        dateIso: _dateIso(dateMissed),
        type: type,
      );
      if (res.status != 1) {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Kiểm tra trùng thất bại',
          ),
        );
      }
      final duplicate = res.data ?? res.result;
      if (duplicate == null) {
        return left(
          BaseError.httpInternalServerError(
            'Không xác định kết quả kiểm tra trùng',
          ),
        );
      }
      return right(duplicate);
    } on DioException catch (e) {
      return left(e.baseError);
    } on FormatException catch (e) {
      return left(BaseError.httpInternalServerError(e.message));
    }
  }

  @override
  Future<Either<BaseError, FillApproverItem>> getFillApprover({
    required int employeeID,
    required String tableName,
  }) async {
    try {
      final res =
          await _service.getFillApprover(
            employeeID: employeeID,
            tableName: tableName,
          );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
