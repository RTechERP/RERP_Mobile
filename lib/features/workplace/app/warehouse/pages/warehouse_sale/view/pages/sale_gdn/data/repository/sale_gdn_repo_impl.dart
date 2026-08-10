import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/service/sale_gdn_service.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/repository/sale_gdn_repo.dart';

@LazySingleton(as: SaleGdnRepo)
class SaleGdnRepoImpl implements SaleGdnRepo {
  final SaleGdnService _service;

  SaleGdnRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<BillExporResponse>>> getBillExports({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getBillExports(payload: payload);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<TypeWarehouseResponse>>> getProductGroups({
    required bool isAdmin,
    required int departmentId,
  }) async {
    try {
      final res = await _service.getProductGroups(
        isAdmin: isAdmin,
        departmentId: departmentId,
      );
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<DetailGDNResponse>>> getBillExportDetail({
    required int id,
  }) async {
    try {
      final res = await _service.getBillExportDetail(id: id);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, DetailGDNItemResponse>> getBillExportById({
    required int id,
  }) async {
    try {
      final res = await _service.getBillExportById(id: id);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const DetailGDNItemResponse());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ViewGDNDetailResponse>>> getViewExportDetail({
    required int id,
  }) async {
    try {
      final res = await _service.getViewExportDetail(id: id);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<UploadFileResponse>>> uploadBillExportFiles({
    required List<File> files,
  }) async {
    try {
      final res = await _service.uploadBillExportFiles(
        files: files,
      );
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ReadFileResponse>>> getBillExportFiles({
    required int billExportDetailId,
  }) async {
    try {
      final res = await _service.getBillExportFiles(
        billExportDetailId: billExportDetailId,
      );
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteBillExportFile({
    required int fileId,
  }) async {
    try {
      final res = await _service.deleteBillExportFile(fileId: fileId);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(true);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, SaveBillExportDataResponse>> saveBillExportData({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.saveBillExportData(payload: payload);
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const SaveBillExportDataResponse());
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  // ---------------------------------------------------------------------------
  // Lookup repositories for BillExport form fields
  // ---------------------------------------------------------------------------

  @override
  Future<Either<BaseError, List<SupplierResponse>>> getSuppliers() async {
    try {
      final res = await _service.getSuppliers();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <SupplierResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<SenderResponse>>> getSenders() async {
    try {
      final res = await _service.getSenders();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <SenderResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<CustomerResponse>>> getCustomers() async {
    try {
      final res = await _service.getCustomers();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <CustomerResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ProjectGDNResponse>>> getAllProjects() async {
    try {
      final res = await _service.getAllProjects();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <ProjectGDNResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<WarehouseResponse>>> getWarehouses() async {
    try {
      final res = await _service.getWarehouses();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <WarehouseResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<ProductGroupNewResponse>>> getProductGroupNew({
    int? warehouseId,
    bool? isDeleted,
    bool? isVisible,
  }) async {
    try {
      final res = await _service.getProductGroupNew(
        warehouseId: warehouseId,
        isDeleted: isDeleted,
        isVisible: isVisible,
      );
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <ProductGroupNewResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  @override
  Future<Either<BaseError, List<BillExportUserResponse>>> getBillExportUsers() async {
    try {
      final res = await _service.getBillExportUsers();
      if (res.status != 1) {
        return left(BaseError.httpInternalServerError(res.message ?? 'Lỗi'));
      }
      return right(res.data ?? const <BillExportUserResponse>[]);
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}