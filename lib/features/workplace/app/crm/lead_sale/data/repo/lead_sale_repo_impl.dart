import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/lead_sale_model.dart';
import '../datasource/service/lead_sale_service.dart';
import 'lead_sale_repo.dart';

/// Triển khai repo: ánh xạ dữ liệu và xử lý lỗi.
@LazySingleton(as: LeadSaleRepo)
class LeadSaleRepoImpl implements LeadSaleRepo {
  final LeadSaleService _service;

  LeadSaleRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleEmployees() async {
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
  Future<Either<BaseError, List<LeadSaleEmployee>>>
  getMarketingEmployees() async {
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
  Future<Either<BaseError, List<LeadSaleSource>>> getLeadSources() async {
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
  Future<Either<BaseError, LeadSaleRoleContext>> getRoleContext() async {
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
  Future<Either<BaseError, List<LeadSaleItem>>> getLeadData({
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
  Future<Either<BaseError, LeadSaleDetail>> getLeadDetail({
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
  Future<Either<BaseError, List<LeadSaleFile>>> getLeadFiles({
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
  Future<Either<BaseError, List<LeadSaleFile>>> saveLeadFiles({
    required int customerContactId,
    required int fileType,
    required List<PlatformFile> files,
    String note = '',
  }) async {
    try {
      final res = await _service.saveLeadFiles(
        customerContactId: customerContactId,
        fileType: fileType,
        files: files,
        note: note,
      );
      if (res.status == 1) {
        return right(res.data ?? const <LeadSaleFile>[]);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Lưu file đính kèm thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> deleteLeadFile({
    required int customerContactFileId,
  }) async {
    try {
      final res = await _service.deleteLeadFile(
        customerContactFileId: customerContactFileId,
      );
      if (res.status == 1) {
        return right(null);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Xoá file đính kèm thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<LeadSalePoType>>> getLeadPoTypes() async {
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
  Future<Either<BaseError, List<LeadSaleCustomerIndustry>>>
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
  Future<Either<BaseError, List<LeadSaleCustomerSpecialization>>>
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
  Future<Either<BaseError, List<LeadSaleBusinessField>>>
  getBusinessFields() async {
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
  Future<Either<BaseError, List<LeadSaleProvince>>>
  getCustomerProvinces() async {
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
  Future<Either<BaseError, List<LeadSaleCustomer>>> getCustomers() async {
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
  Future<Either<BaseError, LeadSaleCustomer>> getCustomerDetail({
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
  Future<Either<BaseError, LeadSaleDuplicateCheckResult>> checkDuplicate({
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
  Future<Either<BaseError, LeadSaleSaveResult>> saveData({
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
  Future<Either<BaseError, LeadSaleActivitySaveResult>> saveActivity({
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
          res.message ?? 'Mở lại lead thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String?>> returnLead({
    required int leadId,
    required String reason,
  }) async {
    try {
      final res = await _service.returnLead(leadId: leadId, reason: reason);
      if (res.status == 1) return right(res.message);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Hoàn trả Marketing thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String?>> closeLead({
    required int leadId,
    required String lostReason,
  }) async {
    try {
      final res = await _service.closeLead(
        leadId: leadId,
        lostReason: lostReason,
      );
      if (res.status == 1) return right(res.message);
      return left(
        BaseError.httpInternalServerError(
          res.message ?? 'Xác nhận không thành công thất bại',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<LeadSaleActivityType>>>
  getActivityTypes() async {
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
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleLeaders() async {
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
  Future<Either<BaseError, List<LeadSaleEmployee>>> getSaleAdmins() async {
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
  Future<Either<BaseError, LeadSaleHandoverResult>> handoverLeads({
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
