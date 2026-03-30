import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/leave_model.dart';
import '../datasource/service/leave_service.dart';
import 'leave_repo.dart';

@LazySingleton(as: LeaveRepo)
class LeaveRepoImpl implements LeaveRepo {
  final LeaveService _service;

  LeaveRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<LeaveItem>>> getLeave({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getLeave(payload: payload);
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

  @override
  Future<Either<BaseError, void>> saveLeave({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveLeave(payload: payload);

      if (res.status == 1) {
        return right(null);
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

  @override
  Future<Either<BaseError, List<LeaveTimeItem>>> getLeaveTimeItem({
    required DateTime dateStart,
    required int employeeId,
  }) async {
    try {
      final start = DateTime(dateStart.year, dateStart.month, dateStart.day);
      final res = await _service.getLeaveTime(
        body: <String, dynamic>{
          'DateStart': start.toIso8601String(),
          'EmployeeID': employeeId,
        },
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

  @override
  Future<Either<BaseError, void>> saveMultiLeave({required Map<String, dynamic> payload}) async {
    try {
      final res = await _service.saveMultiLeave(payload: payload);

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
}
