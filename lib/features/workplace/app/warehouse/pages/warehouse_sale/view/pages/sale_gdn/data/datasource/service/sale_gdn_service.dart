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

  /// Lấy thông tin header của phiếu xuất kho theo ID.
  /// Trả về 1 đối tượng `DetailGDNItemResponse` để fill các trường form ở
  /// đầu trang Detail (mã phiếu, ngày tạo, kho, khách hàng, địa chỉ, ...).
  Future<BaseData<DetailGDNItemResponse>> getBillExportById({
    required int id,
  }) async {
    return get<BaseData<DetailGDNItemResponse>>(
      ApiEndPoint.getBillExportById.replaceAll('{id}', id.toString()),
      parser: (json) => BaseData<DetailGDNItemResponse>.fromJson(
        json,
            (data) => DetailGDNItemResponse.fromJson(
          (data as Map?)?.cast<String, dynamic>() ?? const {},
        ),
      ),
    );
  }

  /// Danh sách NCC (Supplier) — `/billexport/get-suppliers`.
  Future<BaseData<List<SupplierResponse>>> getSuppliers() async {
    return get<BaseData<List<SupplierResponse>>>(
      ApiEndPoint.getSuppliers,
      parser: (json) => BaseData<List<SupplierResponse>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => SupplierResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách người giao (Sender) — `/billexport/get-senders`.
  Future<BaseData<List<SenderResponse>>> getSenders() async {
    return get<BaseData<List<SenderResponse>>>(
      ApiEndPoint.getSenders,
      parser: (json) => BaseData<List<SenderResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => SenderResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách khách hàng — `/billexport/get-customers`.
  Future<BaseData<List<CustomerResponse>>> getCustomers() async {
    return get<BaseData<List<CustomerResponse>>>(
      ApiEndPoint.getCustomers,
      parser: (json) => BaseData<List<CustomerResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => CustomerResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách dự án — `/billexport/get-all-project`.
  Future<BaseData<List<ProjectGDNResponse>>> getAllProjects() async {
    return get<BaseData<List<ProjectGDNResponse>>>(
      ApiEndPoint.getAllProjects,
      parser: (json) => BaseData<List<ProjectGDNResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => ProjectGDNResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách kho — `/billexport/get-warehouses`.
  Future<BaseData<List<WarehouseResponse>>> getWarehouses() async {
    return get<BaseData<List<WarehouseResponse>>>(
      ApiEndPoint.getWarehouses,
      parser: (json) => BaseData<List<WarehouseResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => WarehouseResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Lấy địa chỉ giao hàng theo customerID.
  /// API: GET /AddressStock/get-by-customerID/?customerID={customerId}
  Future<BaseData<List<AddressStockResponse>>> getAddressStockByCustomerId({
    required int customerId,
  }) async {
    return get<BaseData<List<AddressStockResponse>>>(
      ApiEndPoint.getAddressStockByCustomerId,
      query: {'customerID': customerId},
      parser: (json) => BaseData<List<AddressStockResponse>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => AddressStockResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Danh sách loại kho (ProductGroup) —
  /// `/ProductGroup/product-group-new?warehouseId=1&isDeleted=false&isVisible=true`.
  Future<BaseData<List<ProductGroupNewResponse>>> getProductGroupNew({
    int? warehouseId,
    bool? isDeleted,
    bool? isVisible,
  }) async {
    return get<BaseData<List<ProductGroupNewResponse>>>(
      ApiEndPoint.getProductGroupNew,
      query: {
        if (warehouseId != null) 'warehouseId': warehouseId,
        if (isDeleted != null) 'isDeleted': isDeleted,
        if (isVisible != null) 'isVisible': isVisible,
      },
      parser: (json) => BaseData<List<ProductGroupNewResponse>>.fromJson(
        json,
            (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) =>
                ProductGroupNewResponse.fromJson(e as Map<String, dynamic>))
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

  /// Danh sách nhân viên cho bottom-sheet người giao / người nhận.
  /// API: GET /billexport/get-users
  Future<BaseData<List<BillExportUserResponse>>> getBillExportUsers() async {
    return get<BaseData<List<BillExportUserResponse>>>(
      ApiEndPoint.getBillExportUsers,
      parser: (json) => BaseData<List<BillExportUserResponse>>.fromJson(
        json,
        (data) => ((data as List?) ?? const <dynamic>[])
            .map((e) => BillExportUserResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}