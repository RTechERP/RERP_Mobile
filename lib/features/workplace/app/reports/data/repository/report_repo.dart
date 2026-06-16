import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../../base/network/errors/error.dart';
import '../datasource/models/report_model.dart';

abstract class ReportRepo {
  /// Danh sách báo cáo hàng ngày
  Future<Either<BaseError, List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  });

  /// Danh sách phòng ban
  Future<Either<BaseError, List<DepartResponse>>> getDepart();

  /// Danh sách dự án
  Future<Either<BaseError, List<ProjectResponse>>> getProject();

  /// Danh sách hạng mục công việc theo dự án
  Future<Either<BaseError, List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status,
  });

  /// Lưu báo cáo công việc "Phòng Kỹ thuật"
  Future<Either<BaseError, String>> saveReportTech({
    required Map<String, dynamic> payload,
  });

  /// Gửi mail báo cáo phòng kỹ thuật
  Future<Either<BaseError, String>> sendMailReport({
    required SendMailRequestModel request,
  });

  /// Lấy chi tiết báo cáo theo ID
  Future<Either<BaseError, DetailReportResponse>> getById({
    required int dailyID,
  });

  Future<Either<BaseError, DetailReportNullResponse>> getByIdNull({
    required int dailyID,
  });

  Future<Either<BaseError, DetailLXCPReportResponse>> getLXCPById({
    required int dailyID,
  });

  /// Xoá báo cáo theo ID
  Future<Either<BaseError, String>> deleteReportById({required int dailyID});

  /// Copy báo cáo
  Future<Either<BaseError, List<CopyNullResponse>>> copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  });

  Future<Either<BaseError, List<CopyNullResponse>>> copyHrReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  });

  /// Upload file báo cáo
  Future<Either<BaseError, List<UploadFileResponse>>> uploadReportFile({
    required List<File> files,
    required String key,
    required String subPath,
  });

  /// Lưu báo cáo phòng Marketing
  Future<Either<BaseError, void>> saveReportMarketing({
    required Map<String, dynamic> payload,
  });

  /// Lấy chi tiết báo cáo Marketing theo ID
  Future<Either<BaseError, DetailMarketingReportResponse>> getMarketingById({
    required int dailyID,
  });

  /// Lưu báo cáo phòng HR
  Future<Either<BaseError, void>> saveReportHR({
    required Map<String, dynamic> payload,
  });

  /// Danh sách báo cáo LXCP
  Future<Either<BaseError, ReportLXCPResponse>> getLXCPDailyReport({
    required String employeeId,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
  });

  /// Lưu báo cáo phòng LXCP
  Future<Either<BaseError, void>> saveReportLXCP({
    required List<Map<String, dynamic>> payload,
  });

  Future<Either<BaseError, List<FilmDetailResponse>>> getFilmDetail();

  Future<Either<BaseError, void>> saveReportAgvAd({
    required List<Map<String, dynamic>> payload,
  });

  Future<Either<BaseError, DetailSaleReportResponse>> getSaleById({
    required int dailyID,
  });

  Future<Either<BaseError, List<SaleProjectResponse>>> getSaleProject();
  Future<Either<BaseError, List<TeamSaleResponse>>> getTeamSale();

  Future<Either<BaseError, List<CustomerPartResponse>>> getCustomerPart({
    required int customerId,
  });

  Future<Either<BaseError, List<TypeTeamSaleResponse>>> getTypeTeamSale();

  Future<Either<BaseError, List<CustomerResponse>>> getCustomer();
  Future<Either<BaseError, List<FirmBaseResponse>>> getFirmBase();
  Future<Either<BaseError, List<TypeProjectResponse>>> getTypeProject();

  Future<Either<BaseError, List<StatusProjectResponse>>> getStatusProject();
  Future<Either<BaseError, List<CustomerContactResponse>>> getCustomerContact({
    required int customerId,
  });
  Future<Either<BaseError, String>> deleteSaleReport({required int dailyID});
  Future<Either<BaseError, void>> saveReportSaleStaff({
    required List<Map<String, dynamic>> payload,
  });

  Future<Either<BaseError, SaleReportResponse>> getSaleDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int userId,
    required int employeeTeamSaleId,
    int page,
    int size,
    String filterText,
    int customerId,
    int groupType,
    int projectId});

  Future<Either<BaseError, List<SaleAdminResponse>>> getSaleAdminDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    int? customerId,
    int? userId,
    String? keyword,
  });

  Future<Either<BaseError, List<UserResponse>>> getAllUser();

  Future<Either<BaseError, void>> saveReportSaleAdmin({
    required Map<String, dynamic> payload,
  });

  Future<Either<BaseError, List<SaleAdminTypeReportResponse>>> getAdminTypeReport();
  Future<Either<BaseError, List<SaleAdminProjectResponse>>> getAdminProject();
  Future<Either<BaseError, List<SaleAdminCustomerResponse>>> getAdminCustomer();

  Future<Either<BaseError, DetailSaleAdminReportResponse>> getSaleAdminById({
    required int dailyID,
  });

  Future<Either<BaseError, String>> deleteSaleAdminReport({required int dailyID});

  /// Lấy danh sách báo cáo phòng Kế toán (Accountant)
  Future<Either<BaseError, List<AccountantItem>>> getAccountantReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    int page,
    int size,
    String filterText,
    int employeeId,
  });

  /// Lưu báo cáo phòng Kế toán (Accountant)
  Future<Either<BaseError, String>> saveReportAccounting({
    required List<Map<String, dynamic>> payload,
  });

  /// Xoá báo cáo phòng Kế toán theo ID
  Future<Either<BaseError, String>> deleteReportAccounting({required int id});
}
