part of 'poll_bloc.dart';

@freezed
class PollEvent with _$PollEvent {
  const factory PollEvent.init() = _Init;

  const factory PollEvent.refresh() = _Refresh;

  const factory PollEvent.initDetail(PollItem item) = _InitDetail;

  const factory PollEvent.refreshDetail() = _RefreshDetail;
}
