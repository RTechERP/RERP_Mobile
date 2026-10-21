// Service cho màn Duyệt phiếu yêu cầu mua hàng (ProjectPartlistPurchaseRequest).
// API:
//   - POST  /ProjectPartlistPurchaseRequest/get-all
//   - GET   /ProjectPartlistPurchaseRequest/request-types
//   - POST  /ProjectPartlistPurchaseRequest/approved   (duyệt / huỷ duyệt)
//   - GET   /currency/get-all
//   - GET   /ProductGroup/get-productgroup-purchase
//   - GET   /suppliersale/list-supplier-sale
//   - GET   /ProjectPartlistPurchaseRequest/get-all-project

import 'package:injectable/injectable.dart';

import '../../../../../../../../../base/network/dio/dio_base_api_service.dart';
import '../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../common/constants.dart';
import '../models/approve_purchasing_model.dart';

@injectable
class ApprovePurchasingService extends DioBaseApiService {
  ApprovePurchasingService(super.dio);

  /// Lấy danh sách phiếu yêu cầu mua hàng theo bộ lọc.
  /// API: POST /ProjectPartlistPurchaseRequest/get-all
  Future<BaseData<List<ApprovePurchasingItem>>> getAllPurchasing({
    required Map<String, dynamic> payload,
  }) async {
    return post<BaseData<List<ApprovePurchasingItem>>>(
      ApiEndPoint.getApprovePurchasing,
      body: payload,
      parser: (json) => BaseData<List<ApprovePurchasingItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => ApprovePurchasingItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách loại phiếu mua để làm tab UI.
  /// API: GET /ProjectPartlistPurchaseRequest/request-types
  Future<BaseData<List<ApprovePurchasingRequestTypeItem>>>
      getRequestTypes() {
    return get<BaseData<List<ApprovePurchasingRequestTypeItem>>>(
      ApiEndPoint.getApprovePurchasingRequestTypes,
      parser: (json) => BaseData<List<ApprovePurchasingRequestTypeItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => ApprovePurchasingRequestTypeItem.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách loại tiền tệ (cho dropdown đơn vị tiền).
  /// API: GET /currency/get-all
  Future<BaseData<List<CurrencyItem>>> getCurrencies() {
    return get<BaseData<List<CurrencyItem>>>(
      ApiEndPoint.getCurrencyAll,
      parser: (json) => BaseData<List<CurrencyItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => CurrencyItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách nhóm sản phẩm (cho dropdown nhóm SP).
  /// API: GET /ProductGroup/get-productgroup-purchase
  Future<BaseData<List<ProductGroupItem>>> getProductGroups() {
    return get<BaseData<List<ProductGroupItem>>>(
      ApiEndPoint.getProductGroupPurchase,
      parser: (json) => BaseData<List<ProductGroupItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => ProductGroupItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách nhà cung cấp (cho dropdown NCC).
  /// API: GET /suppliersale/list-supplier-sale
  Future<BaseData<List<SupplierItem>>> getSuppliers() {
    return get<BaseData<List<SupplierItem>>>(
      ApiEndPoint.getSupplierSaleList,
      parser: (json) => BaseData<List<SupplierItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => SupplierItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Lấy danh sách dự án (cho dropdown dự án).
  /// API: GET /ProjectPartlistPurchaseRequest/get-all-project
  Future<BaseData<List<ProjectFilterItem>>> getProjects() {
    return get<BaseData<List<ProjectFilterItem>>>(
      ApiEndPoint.getApprovePurchasingAllProject,
      parser: (json) => BaseData<List<ProjectFilterItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => ProjectFilterItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Duyệt (status=true) hoặc huỷ duyệt (status=false) hàng loạt
  /// phiếu. BE nhận body là 1 list các phiếu (mỗi phiếu là 1 map đầy
  /// đủ field của item) và trả về `BaseData<List<...>>` tương tự
  /// `/get-all` (cùng envelope `status` / `data`).
  ///
  /// - [status]: `true` → duyệt, `false` → huỷ duyệt.
  /// - [items]: danh sách các phiếu đã chọn (toàn bộ field, BE dựa
  ///   vào `id` và các flag để cập nhật).
  Future<BaseData<List<ApprovePurchasingItem>>> approvedPurchasing({
    required bool status,
    required List<Map<String, dynamic>> items,
  }) async {
    return post<BaseData<List<ApprovePurchasingItem>>>(
      '${ApiEndPoint.getApprovePurchasingApproved}?status=$status&type=false',
      body: items,
      parser: (json) => BaseData<List<ApprovePurchasingItem>>.fromJson(
        json as Map<String, dynamic>,
        (data) => (data as List)
            .map(
              (e) => ApprovePurchasingItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }
}
