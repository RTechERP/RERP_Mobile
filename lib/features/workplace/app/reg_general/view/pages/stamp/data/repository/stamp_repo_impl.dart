import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/stamp/data/repository/stamp_repo.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/stamp_model.dart';
import '../datasource/service/stamp_service.dart';

@LazySingleton(as: StampRepo)
class StampRepoImpl implements StampRepo {
  final StampService _service;

  StampRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<StampItem>>> getStamp({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getStamp(payload: payload);

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<AssignerStampItem>>> getEmployees() async {
    try {
      final res = await _service.getEmployees();

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, StampDetailItem>> getStampDetail({
    required int id,
  }) async {
    try {
      final res = await _service.getStampDetail(id: id);
      return right(res);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<SealItem>>> getSealRegulations() async {
    try {
      final res = await _service.getSealRegulations();

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DocumentStampItem>>> getDocumentTypes() async {
    try {
      final res = await _service.getDocumentTypes();

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<CompanyStampItem>>> getTaxCompanies() async {
    try {
      final res = await _service.getTaxCompanies();

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, Map<String, dynamic>>> saveStamp({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveStamp(payload: payload);
      final status = res['status'] ?? 0;
      if (status == 1) {
        return right(res);
      }

      return left(
        BaseError.httpInternalServerError(
          res['message'] ?? res['msg'] ?? 'Lưu đăng ký dấu thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, Map<String, dynamic>>> deleteStamp({
    required int id,
  }) async {
    try {
      final res = await _service.deleteStamp(id: id);
      final status = res['status'] ?? 0;
      if (status == 1) {
        return right(res);
      }

      return left(
        BaseError.httpInternalServerError(
          res['message'] ?? res['msg'] ?? 'Xóa đăng ký dấu thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpUnknownError(e.toString()));
    }
  }
}
