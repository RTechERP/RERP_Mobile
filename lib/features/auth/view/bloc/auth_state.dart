part of 'auth_bloc.dart';

@CopyWith()
class AuthState extends BaseBlocState {
  final LoginResponse? loginResponse;

  const AuthState({
    required super.status,
    super.message,
    this.loginResponse,
  });

  factory AuthState.init() => const AuthState(
    status: BaseStateStatus.init,
    loginResponse: null,
  );

  bool get isLoggedIn => loginResponse?.accessToken.isNotEmpty == true;

  @override
  List get props => [status, message, loginResponse];
}