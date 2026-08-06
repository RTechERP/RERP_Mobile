import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../../../common/constants.dart';
import '../models/sale_gdn_model.dart';

@injectable
class SaleGdnService extends DioBaseApiService {
  SaleGdnService(super.dio);

  Future<BaseData<List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<BillExporResponse>>>(
      ApiEndPoint.getBillExport,
      body: payload,
      parser: (json) =>
      BaseData<List<BillExporResponse>>.fromJson(
        json,
            (data) =>
            ((data as List?) ?? const <dynamic>[])
                .map((e) => BillExporResponse.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
    );
  }

  Future<BaseData<List<TypeWarehouseResponse>>> getProductGroups({
    required bool isAdmin,
    required int departmentId,
  }) async {
    return get<BaseData<List<TypeWarehouseResponse>>>(
      ApiEndPoint.getProductGroup,
      query: {'isAdmin': isAdmin, 'departmentID': departmentId},
      parser: (json) => BaseData<List<TypeWarehouseResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => TypeWarehouseResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<DetailGDNResponse>>> getBillExportDetail({
    required int id,
  }) async {
    return get<BaseData<List<DetailGDNResponse>>>(
      ApiEndPoint.getBillExportDetail.replaceAll('{id}', id.toString()),
      parser: (json) => BaseData<List<DetailGDNResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => DetailGDNResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ViewGDNDetailResponse>>> getViewExportDetail({
    required int id,
  }) async {
    return get<BaseData<List<ViewGDNDetailResponse>>>(
      '${ApiEndPoint.getViewExportDetail}/$id',
      parser: (json) => BaseData<List<ViewGDNDetailResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => ViewGDNDetailResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<UploadFileResponse>>> uploadBillExportFiles({
    required List<File> files,
  }) async {
    final form = FormData();
    form.fields.add(MapEntry('key', 'BillExport'));
    for (final f in files) {
      form.files.add(MapEntry(
        'files',
        await MultipartFile.fromFile(f.path),
      ));
    }

    return post<BaseData<List<UploadFileResponse>>>(
      ApiEndPoint.uploadBillExportFiles,
      body: form,
      options: Options(contentType: 'multipart/form-data'),
      parser: (json) => BaseData<List<UploadFileResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => UploadFileResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<List<ReadFileResponse>>> getBillExportFiles({
    required int billExportDetailId,
  }) async {
    return get<BaseData<List<ReadFileResponse>>>(
      ApiEndPoint.getBillExportFiles,
      query: {'billExportDetailId': billExportDetailId},
      parser: (json) => BaseData<List<ReadFileResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => ReadFileResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<BaseData<bool>> deleteBillExportFile({
    required int fileId,
  }) async {
    return delete<BaseData<bool>>(
      ApiEndPoint.deleteBillExportFile.replaceAll('{fileId}', fileId.toString()),
      parser: (json) => BaseData<bool>.fromJson(
        json,
            (data) => data as bool? ?? false,
      ),
    );
  }

  Future<BaseData<SaveBillExportDataResponse>> saveBillExportData({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<SaveBillExportDataResponse>>(
      ApiEndPoint.saveBillExportData,
      body: payload,
      parser: (json) => BaseData<SaveBillExportDataResponse>.fromJson(
        json,
            (data) => SaveBillExportDataResponse.fromJson(data as Map<String, dynamic>),
      ),
    );
  }
}