import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../common/constants.dart';
import '../models/report_model.dart';

@injectable
class ReportService extends DioBaseApiService {
  ReportService(super.dio);

  /// Danh sách báo cáo hàng ngày
  Future<BaseData<List<ReportResponse>>> getDailyReportTech({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String teamId,
    required String userId,
    required String keyword,
    required String departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final body = <String, dynamic>{
      'DateStart': fmt(dateStart),
      'DateEnd': fmt(dateEnd),
      'TeamID': teamId,
      'UserID': userId,
      'Keyword': keyword,
      'DepartmentID': departmentId,
    };

    return post<BaseData<List<ReportResponse>>>(
      ApiEndPoint.getDailyReportTech,
      body: body,
      parser: (json) => BaseData<List<ReportResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ReportResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách phòng ban
  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.getDepart,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách dự án
  Future<BaseData<List<ProjectResponse>>> getProject() async {
    return get<BaseData<List<ProjectResponse>>>(
      ApiEndPoint.getProject,
      parser: (json) => BaseData<List<ProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách hạng mục công việc theo dự án
  Future<BaseData<List<ProjectItemResponse>>> getProjectItemByUser({
    required int projectId,
    int status = 2,
  }) async {
    return get<BaseData<List<ProjectItemResponse>>>(
      ApiEndPoint.getProjectItemByUser,
      query: {'projectId': projectId, 'status': status},
      parser: (json) => BaseData<List<ProjectItemResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => ProjectItemResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lưu báo cáo công việc "Phòng Kỹ thuật"
  Future<BaseData<void>> saveReportTech({
    required Map<String, dynamic> payload,
  }) async {
    final body = [payload]; // ✅ root là mảng
    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: body, // nếu wrapper không encode thì đổi thành jsonEncode(body)
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Gửi mail báo cáo phòng kỹ thuật
  Future<BaseData<void>> sendMailReport({
    required SendMailRequestModel request,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.sendMailReport,
      body: request.toJson(),
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Lấy chi tiết báo cáo theo ID
  Future<BaseData<DetailReportResponse>> getById({required int dailyID}) {
    return get<BaseData<DetailReportResponse>>(
      ApiEndPoint.getById,
      query: {'dailyID': dailyID},
      parser: (json) => BaseData<DetailReportResponse>.fromJson(
        json,
        (data) => DetailReportResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<DetailReportNullResponse>> getByIdNull({
    required int dailyID,
  }) {
    return get<BaseData<DetailReportNullResponse>>(
      ApiEndPoint.getById,
      query: {'dailyID': dailyID},
      parser: (json) => BaseData<DetailReportNullResponse>.fromJson(
        json,
        (data) =>
            DetailReportNullResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<DetailLXCPReportResponse>> getLXCPById({
    required int dailyID,
  }) {
    return get<BaseData<DetailLXCPReportResponse>>(
      ApiEndPoint.getLXCPById,
      query: {'id': dailyID},
      parser: (json) => BaseData<DetailLXCPReportResponse>.fromJson(
        json,
        (data) =>
            DetailLXCPReportResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  /// Xoá báo cáo theo ID
  Future<BaseData<void>> deleteReportById({required int dailyID}) async {
    return post<BaseData<void>>(
      ApiEndPoint.deleteReportById,
      query: {'dailyReportID': dailyID},
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<void>> deleteSaleReportById({required int dailyID}) async {
    return post<BaseData<void>>(
      ApiEndPoint.deleteSaleReport,
      query: {'id': dailyID},
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  Future<BaseData<void>> deleteSaleAdminReportById({required int dailyID}) async {
    return post<BaseData<void>>(
      ApiEndPoint.deleteSaleAdminReport,
      query: {'id': dailyID},
      parser: (json) => BaseData<void>.fromJson(json, (_) {}),
    );
  }

  /// Copy báo cáo
  Future<BaseData<List<CopyNullResponse>>> copyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      return '$y-$m-$day';
    }

    final body = <String, dynamic>{
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'team_id': teamId,
      'keyword': keyword,
      'userid': userId,
      'departmentid': departmentId,
    };

    return post<BaseData<List<CopyNullResponse>>>(
      ApiEndPoint.copyReport, // sửa đúng endpoint của bạn
      body: body,
      parser: (json) => BaseData<List<CopyNullResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => CopyNullResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<CopyNullResponse>>> copyHrReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required int teamId,
    required int userId,
    required String keyword,
    required int departmentId,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      return '$y-$m-$day';
    }

    final body = <String, dynamic>{
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'team_id': teamId,
      'keyword': keyword,
      'userid': userId,
      'departmentid': departmentId,
    };

    return post<BaseData<List<CopyNullResponse>>>(
      ApiEndPoint.copyReport, // sửa đúng endpoint của bạn
      body: body,
      parser: (json) => BaseData<List<CopyNullResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => CopyNullResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lưu file đính kèm
  Future<BaseData<List<UploadFileResponse>>> uploadReportFile({
    required List<File> files,
    required String key,
    required String subPath,
  }) async {
    final formData = FormData();

    // add file(s)
    for (final file in files) {
      formData.files.add(
        MapEntry(
          'files',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        ),
      );
    }

    // add text fields
    formData.fields.addAll([
      MapEntry('key', key),
      MapEntry('subPath', subPath),
    ]);

    return post<BaseData<List<UploadFileResponse>>>(
      ApiEndPoint.marketing_upload,
      body: formData,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => BaseData<List<UploadFileResponse>>.fromJson(
        json,
        (data) =>
            (data as List).map((e) => UploadFileResponse.fromJson(e)).toList(),
      ),
    );
  }

  /// Lưu báo cáo phòng Marketing
  Future<BaseData<void>> saveReportMarketing({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportMarketing,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Lấy chi tiết báo cáo Marketing theo ID
  Future<BaseData<DetailMarketingReportResponse>> getMarketingById({
    required int dailyID,
  }) {
    return get<BaseData<DetailMarketingReportResponse>>(
      ApiEndPoint.getMarketingById,
      query: {'dailyID': dailyID},
      parser: (json) {
        return BaseData<DetailMarketingReportResponse>.fromJson(
          json as Map<String, dynamic>,
          (dataJson) => DetailMarketingReportResponse.fromJson(
            dataJson as Map<String, dynamic>,
          ),
        );
      },
    );
  }

  /// Lưu báo cáo phòng Marketing
  Future<BaseData<void>> saveReportHr({
    required Map<String, dynamic> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportMarketing,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Danh sách báo cáo LXCP
  Future<BaseData<ReportLXCPResponse>> getLXCPDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    required String keyword,
    required String employeeID,
  }) async {
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final body = <String, dynamic>{
      'DateStart': fmt(dateStart),
      'DateEnd': fmt(dateEnd),
      'Keyword': keyword,
      'employeeID': employeeID,
    };

    return post<BaseData<ReportLXCPResponse>>(
      ApiEndPoint.getDailyLXCP,
      body: body,
      parser: (json) => BaseData<ReportLXCPResponse>.fromJson({
        "data": json,
      }, (data) => ReportLXCPResponse.fromJson(data as Map<String, dynamic>)),
    );
  }

  Future<BaseData<void>> saveReportLXCP({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportLXCP,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Lưu báo cáo phòng Kế toán (Accountant)
  Future<BaseData<void>> saveReportAccounting({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportAccounting,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  /// Danh sách chi tiết phim
  Future<BaseData<List<FilmDetailResponse>>> getFilmDetail() async {
    return get<BaseData<List<FilmDetailResponse>>>(
      ApiEndPoint.getFilmDetail,
      parser: (json) => BaseData<List<FilmDetailResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => FilmDetailResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveReportAgvAd({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;

    return post<BaseData<void>>(
      ApiEndPoint.saveReportTech,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  Future<BaseData<DetailSaleReportResponse>> getSaleById({
    required int dailyID,
  }) {
    return get<BaseData<DetailSaleReportResponse>>(
      ApiEndPoint.getSaleById,
      query: {'id': dailyID},
      parser: (json) => BaseData<DetailSaleReportResponse>.fromJson(
        json,
        (data) =>
            DetailSaleReportResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseData<List<DetailSaleAdminReportResponse>>> getSaleAdminById({
    required int dailyID,
  }) {
    return get<BaseData<List<DetailSaleAdminReportResponse>>>(
      ApiEndPoint.getSaleAdminById,
      query: {'id': dailyID},
      parser: (json) => BaseData<List<DetailSaleAdminReportResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map(
              (e) => DetailSaleAdminReportResponse.fromJson(
            e as Map<String, dynamic>,
          ),
        )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<SaleProjectResponse>>> getSaleProject() async {
    return get<BaseData<List<SaleProjectResponse>>>(
      ApiEndPoint.getSaleProject,
      parser: (json) => BaseData<List<SaleProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => SaleProjectResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<TeamSaleResponse>>> getTeamSale() async {
    return get<BaseData<List<TeamSaleResponse>>>(
      ApiEndPoint.getTeamSale,
      parser: (json) => BaseData<List<TeamSaleResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => TeamSaleResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<CustomerPartResponse>>> getCustomerPart({
    required int customerId,
  }) async {
    return get<BaseData<List<CustomerPartResponse>>>(
      ApiEndPoint.getCustomerPart,
      query: {'customerId': customerId},
      parser: (json) => BaseData<List<CustomerPartResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => CustomerPartResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<TypeTeamSaleResponse>>> getTypeTeamSale() async {
    return get<BaseData<List<TypeTeamSaleResponse>>>(
      ApiEndPoint.getTypeTeamSale,
      parser: (json) => BaseData<List<TypeTeamSaleResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => TypeTeamSaleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<CustomerResponse>>> getCustomer() async {
    return get<BaseData<List<CustomerResponse>>>(
      ApiEndPoint.getCustomer,
      parser: (json) => BaseData<List<CustomerResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => CustomerResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<FirmBaseResponse>>> getFirmBase() async {
    return get<BaseData<List<FirmBaseResponse>>>(
      ApiEndPoint.getFirmBase,
      parser: (json) => BaseData<List<FirmBaseResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => FirmBaseResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<TypeProjectResponse>>> getTypeProject() async {
    return get<BaseData<List<TypeProjectResponse>>>(
      ApiEndPoint.getTypeProject,
      parser: (json) => BaseData<List<TypeProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => TypeProjectResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<SaleAdminTypeReportResponse>>>
  getAdminTypeReport() async {
    return get<BaseData<List<SaleAdminTypeReportResponse>>>(
      ApiEndPoint.getAdminTypeReport,
      parser: (json) => BaseData<List<SaleAdminTypeReportResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => SaleAdminTypeReportResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<StatusProjectResponse>>> getStatusProject() async {
    return get<BaseData<List<StatusProjectResponse>>>(
      ApiEndPoint.getStatusProject,
      parser: (json) => BaseData<List<StatusProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) => StatusProjectResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<CustomerContactResponse>>> getCustomerContact({
    required int customerId,
  }) async {
    return get<BaseData<List<CustomerContactResponse>>>(
      ApiEndPoint.getCustomerContact,
      query: {'customerId': customerId},
      parser: (json) => BaseData<List<CustomerContactResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) =>
                  CustomerContactResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<void>> saveReportSaleStaff({
    required List<Map<String, dynamic>> payload,
  }) async {
    final body = payload;
    return post<BaseData<void>>(
      ApiEndPoint.saveSaleStaffReport,
      body: body,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  Future<BaseData<List<AccountantItem>>> getAccountantReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    int page = 1,
    int size = 50,
    String filterText = '',
    int employeeId = 0,
  }) async {
    final query = {
      'page': page,
      'size': size,
      'dateStart': '${dateStart.year}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}T${dateStart.hour.toString().padLeft(2, '0')}:${dateStart.minute.toString().padLeft(2, '0')}:${dateStart.second.toString().padLeft(2, '0')}',
      'dateEnd': '${dateEnd.year}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}T${dateEnd.hour.toString().padLeft(2, '0')}:${dateEnd.minute.toString().padLeft(2, '0')}:${dateEnd.second.toString().padLeft(2, '0')}',
      'filterText': filterText,
      'EmployeeID': employeeId,
    };

    return get<BaseData<List<AccountantItem>>>(
      ApiEndPoint.getAccountantReport,
      query: query,
      parser: (json) {
        final map = json as Map<String, dynamic>;
        final innerMap = map['data'] as Map<String, dynamic>;
        final dataList = innerMap['data'] as List<dynamic>;
        return BaseData<List<AccountantItem>>.fromJson(
          {'status': 1, 'data': dataList},
          (data) => (data as List)
              .map((e) => AccountantItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      },
    );
  }

  Future<BaseData<void>> saveReportSaleAdmin({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<void>>(
      ApiEndPoint.saveSaleAdminReport,
      body: payload,
      parser: (json) => BaseData<void>.fromJson(json, (_) => null),
    );
  }

  Future<BaseData<SaleReportResponse>> getSaleDailyReport({
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
    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final query = {
      'page': page,
      'size': size,
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'filterText': filterText,
      'customerId': customerId,
      'userId': userId,
      'groupType': groupType,
      'projectId': projectId,
      'employeeTeamSaleId': employeeTeamSaleId,
    };

    return get<BaseData<SaleReportResponse>>(
      ApiEndPoint.getSaleDailyReport,
      query: query,
      parser: (json) => BaseData<SaleReportResponse>.fromJson({
        "data": json,
      }, (data) => SaleReportResponse.fromJson(data as Map<String, dynamic>)),
    );
  }

  Future<BaseData<List<SaleAdminResponse>>> getSaleAdminDailyReport({
    required DateTime dateStart,
    required DateTime dateEnd,
    int? customerId,
    int? userId,
    String? keyword,
  }) async {

    String fmt(DateTime d) {
      final y = d.year.toString().padLeft(4, '0');
      final m = d.month.toString().padLeft(2, '0');
      final day = d.day.toString().padLeft(2, '0');
      final h = d.hour.toString().padLeft(2, '0');
      final min = d.minute.toString().padLeft(2, '0');
      final s = d.second.toString().padLeft(2, '0');
      return '$y-$m-$day'
          'T'
          '$h:$min:$s';
    }

    final query = {
      'dateStart': fmt(dateStart),
      'dateEnd': fmt(dateEnd),
      'customerId': customerId,
      'userId': userId,
      'keyword': keyword,
    };

    return get<BaseData<List<SaleAdminResponse>>>(
      ApiEndPoint.getAdminReport,
      query: query,
      parser: (json) => BaseData<List<SaleAdminResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => SaleAdminResponse.fromJson(e))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<UserResponse>>> getAllUser() async {
    return get<BaseData<List<UserResponse>>>(
      ApiEndPoint.getAllUser,
      parser: (json) => BaseData<List<UserResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<SaleAdminProjectResponse>>> getAdminProject() async {
    return get<BaseData<List<SaleAdminProjectResponse>>>(
      ApiEndPoint.getAdminProject,
      parser: (json) => BaseData<List<SaleAdminProjectResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) =>
                  SaleAdminProjectResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  Future<BaseData<List<SaleAdminCustomerResponse>>> getAdminCustomer() async {
    return get<BaseData<List<SaleAdminCustomerResponse>>>(
      ApiEndPoint.getAdminCustomer,
      parser: (json) => BaseData<List<SaleAdminCustomerResponse>>.fromJson(
        json,
        (data) => (data as List)
            .map(
              (e) =>
                  SaleAdminCustomerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }
}
