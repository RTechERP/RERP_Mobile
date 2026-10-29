part of 'summary_customer_bloc.dart';

/// Các sự kiện cho màn tổng hợp khách hàng CRM.
@freezed
class SummaryCustomerEvent with _$SummaryCustomerEvent {
  /// Khởi tạo: tải danh sách khách hàng + dự án.
  const factory SummaryCustomerEvent.init() = _Init;

  /// Thay đổi từ khoá tìm kiếm.
  const factory SummaryCustomerEvent.changeKeyword({
    required String keyword,
  }) = _ChangeKeyword;

  /// Refresh: tải lại dữ liệu.
  const factory SummaryCustomerEvent.refresh() = _Refresh;
}
