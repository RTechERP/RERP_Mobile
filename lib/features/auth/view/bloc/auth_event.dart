// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Event definitions cho auth - init, login, logout, toggleRememberMe

part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  /// Khởi tạo - kiểm tra token đã lưu, validate, load cached user.
  const factory AuthEvent.init() = _Init;

  /// Đăng nhập - gọi API login, lưu token, fetch user info.
  const factory AuthEvent.login(
    String loginName,
    String passwordHash,
    bool rememberMe,
  ) = _Login;

  /// Đăng xuất - xóa token, clear cached user.
  const factory AuthEvent.logout() = _Logout;

  /// Toggle remember me checkbox - cập nhật state, không gọi API.
  const factory AuthEvent.toggleRememberMe(bool value) = _ToggleRememberMe;
}
