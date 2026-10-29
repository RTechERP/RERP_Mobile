part of 'summary_customer_bloc.dart';

/// State cho màn tổng hợp khách hàng CRM.
@CopyWith()
class SummaryCustomerState extends BaseBlocState {
  /// Danh sách khách hàng + dự án gốc từ API.
  final List<SummaryCustomerItem> customers;

  /// Từ khoá tìm kiếm hiện tại.
  final String keyword;

  const SummaryCustomerState({
    required super.status,
    super.message,
    this.customers = const [],
    this.keyword = '',
  });

  factory SummaryCustomerState.init() => const SummaryCustomerState(
        status: BaseStateStatus.init,
        customers: [],
        keyword: '',
      );

  /// Áp dụng từ khoá tìm kiếm lên dữ liệu gốc.
  ///
  /// Tìm theo tên/mã/tên ngắn khách hàng và mã/tên dự án.
  List<SummaryCustomerItem> get displayItems {
    if (keyword.isEmpty) return customers;

    final kw = keyword.toLowerCase();
    return customers.where((item) {
      final customerName = (item.customerName ?? '').toLowerCase();
      final customerCode = (item.customerCode ?? '').toLowerCase();
      final customerShortName = (item.customerShortName ?? '').toLowerCase();
      final projectCode = (item.projectCode ?? '').toLowerCase();
      final projectName = (item.projectName ?? '').toLowerCase();

      return customerName.contains(kw) ||
          customerCode.contains(kw) ||
          customerShortName.contains(kw) ||
          projectCode.contains(kw) ||
          projectName.contains(kw);
    }).toList();
  }

  /// Danh sách khách hàng đã gom nhóm từ dữ liệu đang lọc.
  ///
  /// Mỗi khách hàng gom theo mã KH và kèm số dự án tương ứng.
  List<SummaryCustomerGroup> get displayGroups =>
      SummaryCustomerGroup.groupByCustomer(displayItems);

  /// Số lượng khách hàng unique (theo mã khách hàng) của dữ liệu đang lọc.
  ///
  /// Dùng để hiển thị số lượng khách hàng trên header.
  int get customerCount => displayGroups.length;

  @override
  List get props => [
        status,
        message,
        customers,
        keyword,
      ];
}
