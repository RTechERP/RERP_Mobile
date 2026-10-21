// Implementation repository cho màn Duyệt phiếu yêu cầu mua hàng.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/models/approve_purchasing_model.dart';
import '../datasource/service/approve_purchasing_service.dart';
import 'approve_purchasing_repo.dart';

@LazySingleton(as: ApprovePurchasingRepo)
class ApprovePurchasingRepoImpl implements ApprovePurchasingRepo {
  final ApprovePurchasingService _service;

  ApprovePurchasingRepoImpl(this._service);

  /// Lấy danh sách phiếu yêu cầu mua hàng theo bộ lọc.
  /// Trả về `left(BaseError)` nếu API trả `status != 1` hoặc `data == null`.
  @override
  Future<Either<BaseError, List<ApprovePurchasingItem>>> getAllPurchasing({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final res = await _service.getAllPurchasing(payload: payload);
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách phiếu mua',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Lấy danh sách loại phiếu mua (dùng để tạo tab UI).
  @override
  Future<Either<BaseError, List<ApprovePurchasingRequestTypeItem>>>
      getRequestTypes() async {
    try {
      final res = await _service.getRequestTypes();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải loại phiếu mua',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Lấy danh sách loại tiền tệ.
  @override
  Future<Either<BaseError, List<CurrencyItem>>> getCurrencies() async {
    try {
      final res = await _service.getCurrencies();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách tiền tệ',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Lấy danh sách nhóm sản phẩm.
  @override
  Future<Either<BaseError, List<ProductGroupItem>>> getProductGroups() async {
    try {
      final res = await _service.getProductGroups();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách nhóm sản phẩm',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Lấy danh sách nhà cung cấp.
  @override
  Future<Either<BaseError, List<SupplierItem>>> getSuppliers() async {
    try {
      final res = await _service.getSuppliers();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách nhà cung cấp',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Lấy danh sách dự án.
  @override
  Future<Either<BaseError, List<ProjectFilterItem>>> getProjects() async {
    try {
      final res = await _service.getProjects();
      if (res.status == 1 && res.data != null) {
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(
          res.message ?? res.msg ?? 'Không thể tải danh sách dự án',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }

  /// Duyệt / huỷ duyệt hàng loạt. Trả về các phiếu đã được BE cập nhật
  /// (có thể khác giá trị cũ — ví dụ `isApprovedBgd` đã đổi) kèm message
  /// gốc từ API để UI hiển thị.
  @override
  Future<Either<BaseError, ApprovePurchasingResult>> approvePurchasing({
    required bool status,
    required List<ApprovePurchasingItem> items,
  }) async {
    try {
      // BE cần body là list các map đầy đủ field của item. Dùng
      // `toJson()` để map PascalCase (ID, ProjectCode, ...) cho khớp
      // schema BE.
      final payload = items.map((e) => e.toJson()).toList();
      final res = await _service.approvedPurchasing(
        status: status,
        items: payload,
      );
      final apiMessage = res.message ?? res.msg;
      if (res.status == 1) {
        return right(
          ApprovePurchasingResult(
            updatedItems: res.data ?? const [],
            // BE luôn trả message khi thành công; fallback phòng khi
            // response thiếu field.
            message: (apiMessage == null || apiMessage.trim().isEmpty)
                ? 'Cập nhật trạng thái phiếu thành công'
                : apiMessage,
          ),
        );
      }
      return left(
        BaseError.httpInternalServerError(
          apiMessage ?? 'Không thể cập nhật trạng thái phiếu mua',
        ),
      );
    } on DioException catch (e) {
      return left(e.baseError);
    } catch (e) {
      return left(BaseError.httpInternalServerError(e.toString()));
    }
  }
}
