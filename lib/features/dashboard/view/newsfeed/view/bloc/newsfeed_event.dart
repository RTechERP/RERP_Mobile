part of 'newsfeed_bloc.dart';

@freezed
class NewsfeedEvent with _$NewsfeedEvent {
  const factory NewsfeedEvent.init() = _Init;
  const factory NewsfeedEvent.refresh() = _Refresh;
  const factory NewsfeedEvent.loadCalendar() = _LoadCalendar;
  const factory NewsfeedEvent.changeCalendarMonth({
    required int month,
    required int year,
  }) = _ChangeCalendarMonth;
  const factory NewsfeedEvent.refreshCalendar() = _RefreshCalendar;
  const factory NewsfeedEvent.loadNewsfeedDetail({
    required NewsletterItem item,
  }) = _LoadNewsfeedDetail;
  const factory NewsfeedEvent.clearNewsfeedDetail() = _ClearNewsfeedDetail;

  /// Chuyển nhóm tin đang xem ở tab "Tin nổi bật" (HCNS / MKT).
  const factory NewsfeedEvent.changeCategory({
    required NewsletterCategory category,
  }) = _ChangeCategory;
}
