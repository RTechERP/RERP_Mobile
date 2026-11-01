import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/lead_source_model.dart';
import '../datasource/service/lead_source_service.dart';
import 'lead_source_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: LeadSourceRepo)
class LeadSourceRepoImpl implements LeadSourceRepo {
  final LeadSourceService _service;

  LeadSourceRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<LeadSourceItem>>> getLeadSources() async {
    try {
      final res = await _service.getLeadSources();
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
  Future<Either<BaseError, LeadSourceItem>> saveLeadSource(LeadSourceItem source) async {
    try {
      final res = await _service.saveLeadSource(source);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Lưu nguồn lead thất bại'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<int>>> deleteLeadSource(List<int> ids) async {
    try {
      final res = await _service.deleteLeadSource(ids);
      if (res.status == 1 && res.data != null && res.data!.isNotEmpty) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Xoá nguồn lead thất bại'),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
