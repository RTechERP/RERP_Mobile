part of 'newsfeed_bloc.dart';

@CopyWith()
class NewsfeedState extends BaseBlocState {
  final List<NewsletterItem> newsfeeds;
  final CalendarItem? calendar;
  final int selectedMonth;
  final int selectedYear;
  final BaseStateStatus calendarStatus;
  final String? calendarMessage;

  const NewsfeedState({
    required super.status,
    super.message,
    this.newsfeeds = const [],
    this.calendar,
    required this.selectedMonth,
    required this.selectedYear,
    this.calendarStatus = BaseStateStatus.init,
    this.calendarMessage,
  });

  factory NewsfeedState.init() {
    final now = DateTime.now();
    return NewsfeedState(
      status: BaseStateStatus.init,
      newsfeeds: const [],
      selectedMonth: now.month,
      selectedYear: now.year,
      calendarStatus: BaseStateStatus.init,
    );
  }

  List<HolidayItem> get holidays => calendar?.holidays ?? const [];

  @override
  List get props => [
        status,
        message,
        newsfeeds,
        calendar,
        selectedMonth,
        selectedYear,
        calendarStatus,
        calendarMessage,
      ];
}
