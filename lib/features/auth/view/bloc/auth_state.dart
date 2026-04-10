part of 'auth_bloc.dart';

@CopyWith()
class AuthState extends BaseBlocState {
  final LoginResponse? loginResponse;

  final User? user;

  final bool rememberMe;
  final String? savedUsername;
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

  bool get isLoggedIn => loginResponse?.accessToken.isNotEmpty == true;

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