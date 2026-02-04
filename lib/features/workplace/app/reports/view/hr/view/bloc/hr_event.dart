part of 'hr_bloc.dart';

@freezed
class HrEvent with _$HrEvent{
  const factory HrEvent.initAd() = _InitAd;

  const factory HrEvent.initLxcp() = _InitLxcp;
}