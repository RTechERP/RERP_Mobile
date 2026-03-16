import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';

import '../../../../../../base/network/errors/error.dart';
import '../../../../../../common/logger/index.dart';
import '../datasource/models/report_model.dart';
import '../datasource/service/report_service.dart';
import 'report_repo.dart';

@LazySingleton(as: ReportRepo)
class ReportRepoImpl implements ReportRepo {
  final ReportService _service;

  ReportRepoImpl(this._service);

  /// Danh sách báo cáo hàng ngày
  @override
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  }) async {
    try {
      final res = await _service.getDailyReportTech(
        dateStart: dateStart,
        dateEnd: dateEnd,
        teamId: teamId,
        userId: userId,
        keyword: keyword,
        departmentId: departmentId,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      final log = LogUtils();

      log.logE('Dio status: ${e.response?.statusCode}');
      log.logE('Dio data: ${e.response?.data}');

      return left(e.baseError);
    }
  }

  /// Danh sách phòng ban
  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async {
    try {
      final res = await _service.getDepart();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  /// Danh sách dự án
  @override
  Future<Either<BaseError, List<ProjectResponse>>> getProject() async {
    try {
      final res = await _service.getProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  /// Danh sách hạng mục công việc theo dự án
  @override
  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    try {
      final res = await _service.getProjectItemByUser(
        projectId: projectId,
        status: status,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  /// Lưu báo cáo công việc "Phòng Kỹ thuật"
  @override
  Future<Either<BaseError, String>> saveReportTech({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveReportTech(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
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

  /// Gửi mail báo cáo phòng kỹ thuật
  @override
  Future<Either<BaseError, String>> sendMailReport({
    required SendMailRequestModel request,
  }) async {
    try {
      final res = await _service.sendMailReport(request: request);
      if (res.status == 1) {
        return right(res.message ?? 'Gửi email thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Gửi email thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  /// Lấy chi tiết báo cáo theo ID
  @override
  Future<Either<BaseError, DetailReportResponse>> getById({
    required int dailyID,
  }) async {
    try {
      final res = await _service.getById(dailyID: dailyID);
      return right(res.data!); // DetailReportResponse
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  /// Xoá báo cáo theo ID
  @override
  Future<Either<BaseError, String>> deleteReportById({
    required int dailyID,
  }) async {
    try {
      final res = await _service.deleteReportById(dailyID: dailyID);

      if (res.status == 1) {
        return right(res.message ?? 'Xoá thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Xoá dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<CopyResponse>>> copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    try {
      final res = await _service.copyReport(
        dateStart: dateStart,
        dateEnd: dateEnd,
        teamId: teamId,
        userId: userId,
        keyword: keyword,
        departmentId: departmentId,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<UploadFileResponse>>> uploadReportFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    try {
      final res = await _service.uploadReportFile(
        files: files,
        key: key,
        subPath: subPath,
      );
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> saveReportMarketing({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveReportMarketing(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, DetailMarketingReportResponse>> getMarketingById({
    required int dailyID,
  }) async {
    try {
      final res = await _service.getMarketingById(dailyID: dailyID);

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> saveReportHR({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveReportHr(payload: payload);

      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, List<CopyNullResponse>>> copyHrReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    try {
      final res = await _service.copyHrReport(
        dateStart: dateStart,
        dateEnd: dateEnd,
        teamId: teamId,
        userId: userId,
        keyword: keyword,
        departmentId: departmentId,
      );

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, DetailReportNullResponse>> getByIdNull({
    required int dailyID,
  }) async {
    try {
      final res = await _service.getByIdNull(dailyID: dailyID);
      return right(res.data!); // DetailReportResponse
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, ReportLXCPResponse>> getLXCPDailyReport({
    required String employeeId,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
  }) async {
    try {
      final res = await _service.getLXCPDailyReport(
        dateStart: dateStart,
        dateEnd: dateEnd,
        keyword: keyword,
        employeeID: employeeId,
      );

      return right(res.data!);
    } on DioException catch (e) {
      final log = LogUtils();

      log.logE('Dio status: ${e.response?.statusCode}');
      log.logE('Dio data: ${e.response?.data}');

      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, String>> saveReportLXCP({
    required List<Map<String, dynamic>> payload,
  }) async {
    try {
      final res = await _service.saveReportLXCP(payload: payload);
      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, List<FilmDetailResponse>>> getFilmDetail() async {
    try {
      final res = await _service.getFilmDetail();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, DetailLXCPReportResponse>> getLXCPById({
    required int dailyID,
  }) async {
    try {
      final res = await _service.getLXCPById(dailyID: dailyID);
      return right(res.data!); // DetailReportResponse
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveReportAgvAd({
    required List<Map<String, dynamic>> payload,
  }) async {
    try {
      final res = await _service.saveReportAgvAd(payload: payload);
      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, String>> deleteSaleReport({
    required int dailyID,
  }) async {
    try {
      final res = await _service.deleteSaleReportById(dailyID: dailyID);

      if (res.status == 1) {
        return right(res.message ?? 'Xoá thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Xoá dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<CustomerResponse>>> getCustomer() async {
    try {
      final res = await _service.getCustomer();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<CustomerContactResponse>>> getCustomerContact({
    required int customerId,
  }) async {
    try {
      final res = await _service.getCustomerContact(customerId: customerId);

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<CustomerPartResponse>>> getCustomerPart({
    required int customerId,
  }) async {
    try {
      final res = await _service.getCustomerPart(customerId: customerId);

      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<FirmBaseResponse>>> getFirmBase() async {
    try {
      final res = await _service.getFirmBase();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, DetailSaleReportResponse>> getSaleById({
    required int dailyID,
  }) async {
    try {
      final res = await _service.getSaleById(dailyID: dailyID);

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SaleProjectResponse>>> getSaleProject() async {
    try {
      final res = await _service.getSaleProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<TeamSaleResponse>>> getTeamSale() async {
    try {
      final res = await _service.getTeamSale();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<TypeProjectResponse>>> getTypeProject() async {
    try {
      final res = await _service.getTypeProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<TypeTeamSaleResponse>>>
  getTypeTeamSale() async {
    try {
      final res = await _service.getTypeTeamSale();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveReportSaleStaff({
    required List<Map<String, dynamic>> payload,
  }) async {
    try {
      final res = await _service.saveReportSaleStaff(payload: payload);
      if (res.status == 1) {
        return right(res.message ?? 'Lưu dữ liệu thành công');
      } else {
        return left(
          BaseError.httpInternalServerError(
            res.message ?? 'Lưu dữ liệu thất bại',
          ),
        );
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, SaleReportResponse>> getSaleDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int userId,
    required int employeeTeamSaleId,
    int page = 1,
    int size = 10,
    String filterText = '',
    int customerId = 0,
    int groupType = -1,
    int projectId = 0,
  }) async {
    try {
      final res = await _service.getSaleDailyReport(
        dateStart: dateStart,
        dateEnd: dateEnd,
        userId: userId,
        employeeTeamSaleId: employeeTeamSaleId,
        page: page,
        size: size,
        filterText: filterText,
        customerId: customerId,
        groupType: groupType,
        projectId: projectId,
      );

      return Right(res.data!);
    } on DioException catch (e) {
      return Left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<StatusProjectResponse>>> getStatusProject() async{
    try {
      final res = await _service.getStatusProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<UserResponse>>> getAllUser() async {
    try {
      final res = await _service.getAllUser();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, void>> saveReportSaleAdmin({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveReportSaleAdmin(payload: payload);

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
      rethrow;
    }
  }

  @override
  Future<Either<BaseError, List<SaleAdminTypeReportResponse>>> getAdminTypeReport() async {
    try {
      final res = await _service.getAdminTypeReport();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SaleAdminCustomerResponse>>> getAdminCustomer() async {
    try {
      final res = await _service.getAdminCustomer();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<SaleAdminProjectResponse>>> getAdminProject() async {
    try {
      final res = await _service.getAdminProject();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
