part of 'auth_bloc.dart';

@CopyWith()
class AuthState extends BaseBlocState {
  final LoginResponse? loginResponse;

  final User? user;

  const AuthState({
    required super.status,
    super.message,
    this.loginResponse,
    this.user
  });

  factory AuthState.init() => const AuthState(
    status: BaseStateStatus.init,
    loginResponse: null,
    user: null,
  );

  bool get isLoggedIn => loginResponse?.accessToken.isNotEmpty == true;

  bool get isAuthenticated => user != null;
  @override
  List get props => [status, message, loginResponse, user];
}