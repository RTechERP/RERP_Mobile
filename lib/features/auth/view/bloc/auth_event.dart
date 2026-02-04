part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;

  const factory AuthEvent.login(String loginName, String passwordHarsh) = _Login;

  const factory AuthEvent.logout() = _Logout;
}