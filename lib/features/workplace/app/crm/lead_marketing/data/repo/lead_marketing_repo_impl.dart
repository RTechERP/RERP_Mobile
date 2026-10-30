import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/lead_marketing_model.dart';
import '../datasource/service/lead_marketing_service.dart';
import 'lead_marketing_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: LeadMarketingRepo)
class LeadMarketingRepoImpl implements LeadMarketingRepo {
  final LeadMarketingService _service;

  LeadMarketingRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<LeadEmployee>>> getSaleEmployees() async {
    try {
      final res = await _service.getSaleEmployees();
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
  Future<Either<BaseError, List<LeadEmployee>>> getMarketingEmployees() async {
    try {
      final res = await _service.getMarketingEmployees();
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
  Future<Either<BaseError, List<LeadSource>>> getLeadSources() async {
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
  Future<Either<BaseError, LeadRoleContext>> getRoleContext() async {
    try {
      final res = await _service.getRoleContext();
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
  Future<Either<BaseError, List<LeadMarketingItem>>> getLeadData({
    required int viewMode,
    required DateTime dateStart,
    required DateTime dateEnd,
    required int leadType,
    required int leadSourceId,
    required int marketingEmployeeId,
    required int saleEmployeeId,
    required bool includeOpen,
  }) async {
    try {
      final res = await _service.getLeadData(
        viewMode: viewMode,
        dateStart: dateStart,
        dateEnd: dateEnd,
        leadType: leadType,
        leadSourceId: leadSourceId,
        marketingEmployeeId: marketingEmployeeId,
        saleEmployeeId: saleEmployeeId,
        includeOpen: includeOpen,
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
  Future<Either<BaseError, LeadDetail>> getLeadDetail({
    required int id,
  }) async {
    try {
      final res = await _service.getLeadDetail(id: id);
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
  Future<Either<BaseError, List<LeadFile>>> getLeadFiles({
    required int customerContactId,
    required int fileType,
  }) async {
    try {
      final res = await _service.getLeadFiles(
        customerContactId: customerContactId,
        fileType: fileType,
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
  Future<Either<BaseError, List<LeadPoType>>> getLeadPoTypes() async {
    try {
      final res = await _service.getLeadPoTypes();
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
  Future<Either<BaseError, List<LeadCustomerIndustry>>>
      getCustomerIndustries() async {
    try {
      final res = await _service.getCustomerIndustries();
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
  Future<Either<BaseError, List<LeadCustomerSpecialization>>>
      getCustomerSpecializations() async {
    try {
      final res = await _service.getCustomerSpecializations();
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
  Future<Either<BaseError, List<LeadBusinessField>>> getBusinessFields() async {
    try {
      final res = await _service.getBusinessFields();
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
  Future<Either<BaseError, List<LeadProvince>>> getCustomerProvinces() async {
    try {
      final res = await _service.getCustomerProvinces();
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
  Future<Either<BaseError, List<LeadCustomer>>> getCustomers() async {
    try {
      final res = await _service.getCustomers();
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
