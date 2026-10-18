part of 'personal_approve_menu_bloc.dart';

/// State cho Personal Approve menu.
@CopyWith()
class PersonalApproveMenuState extends BaseBlocState {
  /// employeeID của user hiện tại (cache để child screens dùng).
  final int? currentUserEmployeeId;

  /// Tên hiển thị của user hiện tại.
  final String? currentUserName;

  const PersonalApproveMenuState({
    required super.status,
    super.message,
    this.currentUserEmployeeId,
    this.currentUserName,
  });

  factory PersonalApproveMenuState.init() =>
      const PersonalApproveMenuState(status: BaseStateStatus.init);

  @override
  List get props => [status, message, currentUserEmployeeId, currentUserName];
}