part of 'version_bloc.dart';

@freezed
class VersionEvent with _$VersionEvent {
  const factory VersionEvent.init() = _Init;
  const factory VersionEvent.refresh() = _Refresh;
}
