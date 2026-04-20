// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: State cho auth - user info, login response, remember me credentials

part of 'auth_bloc.dart';

@CopyWith()
class AuthState extends BaseBlocState {
  /// API login response - chứa accessToken và expires.
  final LoginResponse? loginResponse;

  /// User info được fetch từ API sau khi login thành công.
  final User? user;

  /// Flag "Ghi nhớ đăng nhập" - khi true thì lưu credentials vào SharedPreferences.
  final bool rememberMe;

  /// Username đã lưu (khi rememberMe = true).
  final String? savedUsername;

  /// Password đã lưu (khi rememberMe = true).
  final String? savedPassword;

  const AuthState({
    required super.status,
    super.message,
    this.loginResponse,
    this.user,
    this.rememberMe = false,
    this.savedUsername,
    this.savedPassword,
  });

  factory AuthState.init() => const AuthState(
        status: BaseStateStatus.init,
        loginResponse: null,
        user: null,
        rememberMe: false,
        savedUsername: null,
        savedPassword: null,
      );

  /// True khi accessToken tồn tại và không rỗng.
  bool get isLoggedIn => loginResponse?.accessToken.isNotEmpty == true;

  /// True khi user info đã được load thành công.
  bool get isAuthenticated => user != null;

  @override
  List<Object?> get props => [
        status,
        message,
        loginResponse,
        user,
        rememberMe,
        savedUsername,
        savedPassword,
      ];
}
