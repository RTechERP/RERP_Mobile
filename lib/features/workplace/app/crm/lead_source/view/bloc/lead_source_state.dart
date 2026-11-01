part of 'lead_source_bloc.dart';

/// Trạng thái của Bloc Nguồn Lead.
@CopyWith()
class LeadSourceState extends BaseBlocState {
  /// Danh sách nguồn lead.
  final List<LeadSourceItem> sources;

  /// Thông báo lỗi khi tải danh sách.
  final String? message;

  /// Trạng thái lưu.
  final BaseStateStatus saveStatus;

  /// Thông báo khi lưu.
  final String? saveMessage;

  /// Trạng thái xoá.
  final BaseStateStatus deleteStatus;

  /// Thông báo khi xoá.
  final String? deleteMessage;

  const LeadSourceState({
    required super.status,
    this.sources = const [],
    this.message,
    this.saveStatus = BaseStateStatus.init,
    this.saveMessage,
    this.deleteStatus = BaseStateStatus.init,
    this.deleteMessage,
  });

  factory LeadSourceState.init() => const LeadSourceState(
        status: BaseStateStatus.init,
      );

  @override
  List get props => [
        status,
        sources,
        message,
        saveStatus,
        saveMessage,
        deleteStatus,
        deleteMessage,
      ];
}
