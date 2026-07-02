part of 'app_version_bloc.dart';

@CopyWith()
class AppVersionState extends BaseBlocState {
  final AppVersion? appVersion;
  const AppVersionState({
    required super.status,
    super.message,
    this.appVersion,
  });

  factory AppVersionState.init() =>
      const AppVersionState(status: BaseStateStatus.init);

  @override
  List get props => [status, message, appVersion];
}
