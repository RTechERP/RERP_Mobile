part of 'personal_approve_menu_bloc.dart';

/// Event cho Personal Approve menu.
@freezed
class PersonalApproveMenuEvent with _$PersonalApproveMenuEvent {
  /// Load thông tin user hiện tại vào state.
  const factory PersonalApproveMenuEvent.init() = _Init;
}