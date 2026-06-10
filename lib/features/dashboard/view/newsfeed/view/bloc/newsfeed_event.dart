part of 'newsfeed_bloc.dart';

@freezed
class NewsfeedEvent with _$NewsfeedEvent {
  const factory NewsfeedEvent.init() = _Init;
  const factory NewsfeedEvent.refresh() = _Refresh;
}
