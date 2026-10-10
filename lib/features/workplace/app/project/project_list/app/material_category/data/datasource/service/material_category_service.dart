import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';
import 'package:rtc_erp/base/network/models/base_data.dart';

import '../../../../../../../../../../common/constants.dart';
import '../model/part_list_model.dart';
import '../model/solution_model.dart';
import '../model/version_model.dart';

/// Service cung cấp dữ liệu cho màn Danh mục vật tư gồm:
/// - Danh mục vật tư (API - TODO: cập nhật path khi backend sẵn sàng).
/// - Giải pháp (API GET /projectworker/get-solution/{projectRequestId}).
/// - Phiên bản (API GET /ProjectPartListVersion/get-all).
@injectable
class MaterialCategoryService extends DioBaseApiService {
  MaterialCategoryService(super.dio);

  /// Lấy danh sách vật tư theo phiên bản.
  /// Endpoint: POST /ProjectPartList/get-all
  /// Payload: { projectId, projectPartListVersionId, keywords, partlistTypeId, isDeleted, isConsumable, isApprovedTBP, isApprovedPurchase }
  Future<List<PartListModel>> getPartList({
    required int projectId,
    required int projectPartListVersionId,
    required int projectTypeId,
    String keyword = '',
    int isDeleted = 0,
    bool isConsumable = false,
    int isApprovedTbp = -1,
    int isApprovedPurchase = -1,
  }) async {
    final body = {
      'ProjectID': projectId,
      'ProjectPartListVersionID': projectPartListVersionId,
      'PartlistTypeID': projectTypeId,
      'Keywords': keyword,
      'IsDeleted': isDeleted,
      'IsConsumable': isConsumable,
      'IsApprovedTBP': isApprovedTbp,
      'IsApprovedPurchase': isApprovedPurchase,
    };
    final result = await post<dynamic>(
      ApiEndPoint.getPartList,
      body: body,
    );
    return _parsePartListResponse(result);
  }

  /// Huỷ duyệt mới cho 1 vật tư (TBP).
  /// Endpoint: POST /ProjectPartList/approved-newcode?isApprovedNew=false
  /// Body: List of PartListModel JSON trực tiếp — không wrapper.
  /// Truyền List 1 phần tử để dễ mở rộng batch sau này.
  Future<void> cancelApproveNew(PartListModel item) async {
    final result = await post<dynamic>(
      ApiEndPoint.approvedNewCode,
      body: [_toFixPayload(item)],
      query: {'isApprovedNew': false},
    );
    _throwIfApiFailed(result);
  }

  /// Check điều kiện duyệt mới trước khi gọi API duyệt thật.
  /// Endpoint: POST /ProjectPartList/check-approve-newcode.
  /// Body: List of PartListModel JSON.
  /// Trả về `message` từ response body — repo sẽ so sánh với chuỗi
  /// "Đã xử lý thành công!" để quyết định có gọi tiếp API duyệt hay không.
  /// Dùng [_toFixPayload] thay vì `item.toJson()` để tránh gửi `IsLeaf`/`IsNewCode`
  /// null — backend C# không convert được null sang `System.Boolean` (400).
  Future<String> checkApproveNew(PartListModel item) async {
    final result = await post<dynamic>(
      ApiEndPoint.checkApproveNewCode,
      body: [_toFixPayload(item)],
    );
    return _extractMessage(result);
  }

  /// Duyệt mới cho 1 vật tư (TBP).
  /// Endpoint: POST /ProjectPartList/approved-newcode?isApprovedNew=true.
  /// Body: List of PartListModel JSON.
  /// Gọi sau khi [checkApproveNew] trả message "Đã xử lý thành công!".
  Future<void> approveNew(PartListModel item) async {
    final result = await post<dynamic>(
      ApiEndPoint.approvedNewCode,
      body: [_toFixPayload(item)],
      query: {'isApprovedNew': true},
    );
    _throwIfApiFailed(result);
  }

  /// Trích `message` từ response body (Map). Trả về chuỗi rỗng nếu body
  /// không phải Map hoặc thiếu field `message`.
  String _extractMessage(dynamic data) {
    if (data is Map) {
      final m = data['message'];
      if (m is String) return m;
    }
    return '';
  }

  /// Duyệt / huỷ duyệt tích xanh cho 1 vật tư.
  /// Endpoint: POST /ProjectPartList/approved-fix?isFix={bool}
  /// Body: List rút gọn các field bắt buộc (ID, ProjectID, ProjectTypeID,
  /// ProjectPartListVersionID, TT, ProductCode, GroupMaterial, Manufacturer,
  /// Unit, IsLeaf, IsNewCode, IsDeleted) — backend chỉ nhận field có trong DTO.
  /// isFix=true  → duyệt tích xanh.
  /// isFix=false → huỷ duyệt tích xanh.
  Future<void> approveFix(PartListModel item, {required bool isFix}) async {
    final result = await post<dynamic>(
      ApiEndPoint.approvedFix,
      body: [_toFixPayload(item)],
      query: {'isFix': isFix},
    );
    _throwIfApiFailed(result);
  }

  /// Build payload rút gọn cho API approved-fix.
  /// Backend DTO là `bool` non-nullable, nên phải default `false` thay vì gửi
  /// null — JSON `null` không thể convert sang System.Boolean.
  Map<String, dynamic> _toFixPayload(PartListModel item) {
    return {
      'ID': item.id,
      'ProjectID': item.projectId,
      'ProjectTypeID': item.projectTypeId,
      'ProjectPartListVersionID': item.projectPartListVersionId,
      'TT': item.tt,
      'ProductCode': item.productCode,
      'GroupMaterial': item.groupMaterial,
      'Manufacturer': item.manufacturer,
      'Unit': item.unit,
      'IsLeaf': item.isLeaf ?? false,
      'IsNewCode': item.isNewCode ?? false,
      'IsDeleted': item.isDeleted ?? false,
    };
  }

  /// Yêu cầu chuyển kho cho nhiều vật tư.
  /// Endpoint: POST /ProjectPartList/request-export
  /// Body: { "WarehouseCode": "HN|HCM|BN|HP|DP", "ListItem": [ ... ] }
  /// Trong đó mỗi item chỉ cần các field backend yêu cầu:
  /// ID, RemainQuantity, QuantityReturn, QtyFull, ProductNewCode,
  /// GroupMaterial, Unit, ProjectCode, ProjectID, ProductID, TT, WarehouseID.
  ///
  /// Mặc dù API trả HTTP 200, body có thể báo lỗi nghiệp vụ qua
  /// `{ status: 0, message: "..." }`. Hàm sẽ ném [DioException] để bloc
  /// hiện snackbar đúng message backend.
  Future<void> requestExport({
    required String warehouseCode,
    required List<PartListModel> items,
  }) async {
    final result = await post<dynamic>(
      ApiEndPoint.requestExport,
      body: {
        'WarehouseCode': warehouseCode,
        'ListItem': items.map(_toTransferItem).toList(),
      },
    );
    _throwIfApiFailed(result);
  }

  /// Validate response body dạng `{ status, message, data, error }`.
  /// Nếu `status == 0` thì ném DioException để chuyển về flow lỗi, đảm bảo
  /// bloc hiện đúng message backend thay vì snackbar "thành công" giả.
  void _throwIfApiFailed(dynamic data) {
    if (data is! Map) return;
    final status = data['status'];
    final message = data['message'];
    if (status == 0 && message is String && message.isNotEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400,
          data: data,
        ),
        type: DioExceptionType.badResponse,
        message: message,
      );
    }
  }

  /// Build 1 item trong ListItem của API request-export.
  /// Các field kiểu số gửi 0 thay vì null để backend C# nhận đúng kiểu dữ liệu.
  Map<String, dynamic> _toTransferItem(PartListModel item) {
    return {
      'ID': item.id,
      'RemainQuantity': item.remainQuantity ?? 0,
      'QuantityReturn': item.quantityReturn ?? 0,
      'QtyFull': item.qtyFull ?? 0,
      'ProductNewCode': item.productNewCode ?? '',
      'GroupMaterial': item.groupMaterial ?? '',
      'Unit': item.unit ?? '',
      'ProjectCode': item.projectCode ?? '',
      'ProjectID': item.projectId,
      'ProductID': item.productId ?? 0,
      'TT': item.tt ?? '',
      'WarehouseID': 0,
    };
  }

  /// Parse response part list - có thể trả về List trực tiếp hoặc wrapped.
  List<PartListModel> _parsePartListResponse(dynamic json) {
    if (json is List) {
      return json
          .map((e) => PartListModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json is Map<String, dynamic>) {
      final data = json['data'];
      if (data is List) {
        return data
            .map((e) => PartListModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    }
    return <PartListModel>[];
  }

  /// Lấy danh sách giải pháp theo projectRequestId.
  /// Endpoint: GET /projectworker/get-solution/{projectRequestId}
  /// Response format: `{ status, message, data: List of SolutionModel }`.
  Future<List<SolutionModel>> getSolutions(int projectRequestId) async {
    final result = await get<BaseData<List<SolutionModel>>>(
      '${ApiEndPoint.getSolution}/$projectRequestId',
      parser: (json) => _parseList(
        json,
        SolutionModel.fromJson,
      ),
    );
    return result.data ?? <SolutionModel>[];
  }

  /// Lấy danh sách phiên bản theo projectSolutionId, gọi đồng thời cả hai API
  /// với isPO = true / false. Trả về cặp (versions giải pháp, versions PO).
  /// Endpoint: GET /ProjectPartListVersion/get-all
  /// Response format: `{ status, message, data: List of VersionModel }`.
  Future<({List<VersionModel> solutionVersions, List<VersionModel> poVersions})>
      getVersions(int projectSolutionId) async {
    final results = await Future.wait([
      get<BaseData<List<VersionModel>>>(
        ApiEndPoint.getVersions,
        query: {'projectSolutionId': projectSolutionId, 'isPO': false},
        parser: (json) => _parseList(
          json,
          VersionModel.fromJson,
        ),
      ),
      get<BaseData<List<VersionModel>>>(
        ApiEndPoint.getVersions,
        query: {'projectSolutionId': projectSolutionId, 'isPO': true},
        parser: (json) => _parseList(
          json,
          VersionModel.fromJson,
        ),
      ),
    ]);

    return (
      solutionVersions: results[0].data ?? <VersionModel>[],
      poVersions: results[1].data ?? <VersionModel>[],
    );
  }

  /// Parse response thành BaseData&lt;List&lt;T&gt;&gt;, hỗ trợ nhiều format khác nhau.
  BaseData<List<T>> _parseList<T>(
    dynamic json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json is List) {
      return BaseData<List<T>>.fromJson(
        {'status': 1, 'data': json},
        (data) => (data as List)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return BaseData<List<T>>.fromJson(
      json as Map<String, dynamic>,
      (data) {
        if (data is List) {
          return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
        }
        if (data is Map) {
          final items = (data as Map<String, dynamic>).values
              .whereType<List>()
              .expand((e) => e)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList();
          if (items.isNotEmpty) return items;
        }
        return <T>[];
      },
    );
  }
}
