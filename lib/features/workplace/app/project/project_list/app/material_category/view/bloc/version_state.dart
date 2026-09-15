part of 'version_bloc.dart';

@CopyWith()
class VersionState extends BaseBlocState {
  final List<VersionItem> versions;

  const VersionState({
    required super.status,
    super.message,
    this.versions = const [],
  });

  factory VersionState.init() => const VersionState(
        status: BaseStateStatus.init,
        versions: [],
      );

  @override
  List get props => [identityHashCode(this), status, message, versions];
}
