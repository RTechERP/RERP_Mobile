import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/work_requirement/data/repository/work_requirement_repo.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../datasource/models/work_requirement_model.dart';
import '../datasource/service/work_requirement_service.dart';

@LazySingleton(as: WorkRequirementRepo)
class WorkRequirementRepoImpl implements WorkRequirementRepo {
  final WorkRequirementService _service;

  WorkRequirementRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<WorkRequirementItem>>> getWorkRequirement({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getWorkRequirement(payload: payload);

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, WorkRequirementSaveResponse>> saveWorkRequirement({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveWorkRequirement(payload: payload);

      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Luu du lieu that bai',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepartments() async {
    try {
      final res = await _service.getDepartments();
      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }
      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<WorkRequirementApproverItem>>> getApprovers() async {
    try {
      final res = await _service.getApprovers();
      if (res.status == 1) {
        return right(res.data ?? []);
      }
      return right([]);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, WorkRequirementDetailData>> getWorkRequirementDetail(int id) async {
    try {
      final res = await _service.getWorkRequirementDetail(id);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Khong lay duoc chi tiet',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> deleteWorkRequirement(List<int> ids) async {
    try {
      final res = await _service.deleteWorkRequirement(ids: ids);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Xoa that bai',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> editWorkRequirement({
    required int id,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.editWorkRequirement(id: id, payload: payload);
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Cap nhat that bai',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<UploadFileResponse>>> uploadFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    try {
      final res = await _service.uploadFile(
        files: files,
        key: key,
        subPath: subPath,
      );
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Tai file that bai',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}


