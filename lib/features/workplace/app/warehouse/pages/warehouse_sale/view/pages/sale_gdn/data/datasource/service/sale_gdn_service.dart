import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';
import 'package:rtc_erp/common/constants.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

@injectable
class SaleGdnService extends DioBaseApiService {
  SaleGdnService(super.dio);

  Future<BaseData<List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BillExporResponse>>>(
      ApiEndPoint.getBillExport,
      body: payload,
      parser: (json) {
        if (json is! Map<String, dynamic>) {
          return BaseData<List<BillExporResponse>>(
            status: 0,
            data: [],
          );
        }

        final status = json['status'] as int?;
        final dataJson = json['data'];

        List<BillExporResponse> items = [];
        if (dataJson is List) {
          items = dataJson
              .map((e) => BillExporResponse.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return BaseData<List<BillExporResponse>>(
          status: status,
          data: items,
        );
      },
    );
  }

  Future<BaseData<List<TypeWarehouseResponse>>> getProductGroups({
    required bool isAdmin,
    required int departmentId,
  }) async {
    return get<BaseData<List<TypeWarehouseResponse>>>(
      ApiEndPoint.getProductGroup,
      query: {
        'isAdmin': isAdmin,
        'departmentID': departmentId,
      },
      parser: (json) {
        if (json is! Map<String, dynamic>) {
          return BaseData<List<TypeWarehouseResponse>>(
            status: 0,
            data: [],
          );
        }

        final status = json['status'] as int?;
        final dataJson = json['data'];

        List<TypeWarehouseResponse> items = [];
        if (dataJson is List) {
          items = dataJson
              .map((e) => TypeWarehouseResponse.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return BaseData<List<TypeWarehouseResponse>>(
          status: status,
          data: items,
        );
      },
    );
  }

  /// Lấy chi tiết phiếu xuất kho theo ID (API chính cho trang detail).
  /// Endpoint: GET /BillExport/{id}
  /// Response: List<DetailGDNResponse>
  Future<BaseData<List<DetailGDNResponse>>> getBillExportDetail({
    required int id,
  }) async {
    return get<BaseData<List<DetailGDNResponse>>>(
      ApiEndPoint.getBillExportDetail.replaceAll('{id}', id.toString()),
      parser: (json) {
        if (json is! Map<String, dynamic>) {
          return BaseData<List<DetailGDNResponse>>(
            status: 0,
            data: [],
          );
        }

        final status = json['status'] as int?;
        final dataJson = json['data'];

        List<DetailGDNResponse> items = [];
        if (dataJson is List) {
          items = dataJson
              .map((e) => DetailGDNResponse.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return BaseData<List<DetailGDNResponse>>(
          status: status,
          data: items,
        );
      },
    );
  }

  /// Lấy chi tiết phiếu xuất kho (API phụ, dùng cho view).
  /// Endpoint: GET /BillExport/get-view-export-detail/{id}
  Future<BaseData<List<ViewGDNDetailResponse>>> getViewExportDetail({
    required int id,
  }) async {
    return get<BaseData<List<ViewGDNDetailResponse>>>(
      '${ApiEndPoint.getViewExportDetail}/$id',
      parser: (json) {
        if (json is! Map<String, dynamic>) {
          return BaseData<List<ViewGDNDetailResponse>>(
            status: 0,
            data: [],
          );
        }

        final status = json['status'] as int?;
        final dataJson = json['data'];

        List<ViewGDNDetailResponse> items = [];
        if (dataJson is List) {
          items = dataJson
              .map((e) => ViewGDNDetailResponse.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return BaseData<List<ViewGDNDetailResponse>>(
          status: status,
          data: items,
        );
      },
    );
  }

  /// Upload files for BillExport confirmation images.
  /// Endpoint: POST /BillExport/upload-files
  /// Key parameter: BillExport
  Future<BaseData<List<UploadFileResponse>>> uploadBillExportFiles({
    required List<File> files,
  }) async {
    final formData = FormData();

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

    formData.fields.addAll([
      const MapEntry('key', 'BillExport'),
    ]);

    return post<BaseData<List<UploadFileResponse>>>(
      ApiEndPoint.uploadBillExportFiles,
      body: formData,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => BaseData<List<UploadFileResponse>>.fromJson(
        json,
        (data) {
          if (data is List) {
            return data
                .map((e) => UploadFileResponse.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          return <UploadFileResponse>[];
        },
      ),
    );
  }
}
