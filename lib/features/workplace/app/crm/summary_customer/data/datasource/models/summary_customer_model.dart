import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_customer_model.freezed.dart';
part 'summary_customer_model.g.dart';

/// Model cho một bản ghi tổng hợp khách hàng + dự án trong CRM.
///
/// Mỗi bản ghi gộp thông tin khách hàng (`CustomerName`, `CustomerCode`, ...)
/// với thông tin dự án tương ứng (`ProjectCode`, `ProjectName`, ...).
@freezed
class SummaryCustomerItem with _$SummaryCustomerItem {
  const factory SummaryCustomerItem({
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'CustomerShortName') String? customerShortName,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'TaxCode') String? taxCode,
    @JsonKey(name: 'IndustriesNameVI') String? industriesNameVi,
    @JsonKey(name: 'IndustryProduct') String? industryProduct,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'PIC') String? pic,
  }) = _SummaryCustomerItem;

  factory SummaryCustomerItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryCustomerItemFromJson(json);
}

/// Thông tin khách hàng sau khi gom từ nhiều bản ghi của API.
///
/// API trả về mỗi dự án là 1 bản ghi kèm thông tin khách hàng lặp lại,
/// model này gom theo mã khách hàng để hiển thị 1 card duy nhất cho mỗi
/// khách hàng kèm số dự án tương ứng.
class SummaryCustomerGroup {
  const SummaryCustomerGroup({
    required this.customerCode,
    required this.customerName,
    required this.typeName,
    required this.address,
    required this.taxCode,
    required this.industriesNameVi,
    required this.industryProduct,
    required this.projectCount,
    this.projects = const [],
  });

  /// Mã khách hàng.
  final String customerCode;

  /// Tên khách hàng.
  final String customerName;

  /// Loại khách hàng.
  final String typeName;

  /// Địa chỉ khách hàng.
  final String address;

  /// Mã số thuế.
  final String taxCode;

  /// Lĩnh vực.
  final String industriesNameVi;

  /// Ngành nghề.
  final String industryProduct;

  /// Số dự án phụ trách của khách hàng.
  ///
  /// Chỉ tính những bản ghi có ít nhất một trong ba thông tin
  /// mã dự án / tên dự án / PIC.
  final int projectCount;

  /// Danh sách dự án (mã - tên - PIC) của khách hàng.
  final List<SummaryCustomerItem> projects;

  /// Bản ghi được coi là dự án khi có ít nhất mã dự án, tên dự án hoặc PIC.
  ///
  /// Những bản ghi trống cả ba thông tin sẽ bị loại khỏi danh sách dự án.
  static bool _isValidProject(SummaryCustomerItem item) {
    return (item.projectCode ?? '').trim().isNotEmpty ||
        (item.projectName ?? '').trim().isNotEmpty ||
        (item.pic ?? '').trim().isNotEmpty;
  }

  /// Gom danh sách bản ghi API theo khách hàng.
  ///
  /// Khóa gom nhóm là mã khách hàng, khi mã rỗng thì dùng tên khách hàng.
  /// Các bản ghi không có cả mã lẫn tên sẽ bị bỏ qua.
  static List<SummaryCustomerGroup> groupByCustomer(
    List<SummaryCustomerItem> items,
  ) {
    final groups = <String, SummaryCustomerGroup>{};
    final projects = <String, List<SummaryCustomerItem>>{};

    for (final item in items) {
      final code = (item.customerCode ?? '').trim();
      final name = (item.customerName ?? '').trim();
      final key = code.isNotEmpty ? code : name;
      if (key.isEmpty) continue;

      if (_isValidProject(item)) {
        (projects[key] ??= <SummaryCustomerItem>[]).add(item);
      }

      final existing = groups[key];
      if (existing == null) {
        groups[key] = SummaryCustomerGroup(
          customerCode: code,
          customerName: name,
          typeName: (item.typeName ?? '').trim(),
          address: (item.address ?? '').trim(),
          taxCode: (item.taxCode ?? '').trim(),
          industriesNameVi: (item.industriesNameVi ?? '').trim(),
          industryProduct: (item.industryProduct ?? '').trim(),
          projectCount: 0,
        );
      } else {
        groups[key] = SummaryCustomerGroup(
          customerCode: existing.customerCode,
          customerName: existing.customerName,
          typeName: existing.typeName,
          address: existing.address,
          taxCode: existing.taxCode,
          industriesNameVi: existing.industriesNameVi,
          industryProduct: existing.industryProduct,
          projectCount: existing.projectCount,
        );
      }
    }

    return groups.entries
        .map(
          (entry) => SummaryCustomerGroup(
            customerCode: entry.value.customerCode,
            customerName: entry.value.customerName,
            typeName: entry.value.typeName,
            address: entry.value.address,
            taxCode: entry.value.taxCode,
            industriesNameVi: entry.value.industriesNameVi,
            industryProduct: entry.value.industryProduct,
            projectCount: projects[entry.key]?.length ?? 0,
            projects: projects[entry.key] ?? const [],
          ),
        )
        .toList();
  }
}
