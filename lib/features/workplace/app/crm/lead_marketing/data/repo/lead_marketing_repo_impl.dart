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

  @override
  Future<Either<BaseError, LeadCustomer>> getCustomerDetail({
    required int id,
  }) async {
    try {
      final res = await _service.getCustomerDetail(id: id);
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
  Future<Either<BaseError, LeadDuplicateCheckResult>> checkDuplicate({
    required String phone,
    String? email,
    String? taxCode,
    String? companyName,
    int excludeLeadId = 0,
  }) async {
    try {
      final res = await _service.checkDuplicate(
        phone: phone,
        email: email,
        taxCode: taxCode,
        companyName: companyName,
        excludeLeadId: excludeLeadId,
      );
      if (res.status == 1) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Dữ liệu bị trùng lặp, không thể tạo phiếu lead',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, LeadSaveResult>> saveData({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveData(payload: payload);
      if (res.status == 1) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu phiếu lead thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<int>>> deleteLeads({
    required List<int> ids,
  }) async {
    try {
      final res = await _service.deleteLeads(ids: ids);
      // Chỉ coi là thành công khi API trả `message` và `data` có dữ liệu.
      if (res.status == 1 && res.data != null && res.data!.isNotEmpty) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Xoá phiếu lead thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, LeadActivitySaveResult>> saveActivity({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveActivity(payload: payload);
      if (res.status == 1) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Ghi hoạt động thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<int>>> disqualifyLeads({
    required List<int> ids,
    required String note,
  }) async {
    try {
      final res = await _service.disqualifyLeads(ids: ids, note: note);
      // Chỉ coi là thành công khi API trả `message` và `data` có dữ liệu.
      if (res.status == 1 && res.data != null && res.data!.isNotEmpty) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Xác nhận TT không phù hợp thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<int>>> reopenLeads({
    required List<int> ids,
    required String note,
  }) async {
    try {
      final res = await _service.reopenLeads(ids: ids, note: note);
      if (res.status == 1 && res.data != null && res.data!.isNotEmpty) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Huỷ xác nhận TT không phù hợp thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<LeadActivityType>>> getActivityTypes() async {
    try {
      final res = await _service.getActivityTypes();
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
  Future<Either<BaseError, List<LeadEmployee>>> getSaleLeaders() async {
    try {
      final res = await _service.getSaleLeaders();
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
  Future<Either<BaseError, List<LeadEmployee>>> getSaleAdmins() async {
    try {
      final res = await _service.getSaleAdmins();
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
  Future<Either<BaseError, int>> getAdminSaleId({
    required int leaderSaleId,
  }) async {
    try {
      final res = await _service.getAdminSaleId(leaderSaleId: leaderSaleId);
      final adminSaleId = res.data;
      if (res.status == 1 && adminSaleId != null && adminSaleId > 0) {
        return right(adminSaleId);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Không tìm thấy Admin Sale tương ứng',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, LeadHandoverResult>> handoverLeads({
    required List<int> ids,
    required int leaderEmployeeId,
    required int adminSaleId,
    required String note,
  }) async {
    try {
      final res = await _service.handoverLeads(
        ids: ids,
        leaderEmployeeId: leaderEmployeeId,
        adminSaleId: adminSaleId,
        note: note,
      );
      // Chỉ coi là thành công khi API trả `message` và `data` có dữ liệu.
      final result = res.data;
      final handoverIds = result?.ids;
      if (res.status == 1 &&
          result != null &&
          handoverIds != null &&
          handoverIds.isNotEmpty) {
        return right(result);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Bàn giao lead thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
