part of 'newsfeed_bloc.dart';

@CopyWith()
class NewsfeedState extends BaseBlocState {
  final List<NewsletterItem> newsfeeds;
  final CalendarItem? calendar;
  final int selectedMonth;
  final int selectedYear;
  final BaseStateStatus calendarStatus;
  final String? calendarMessage;
  final NewsletterItem? selectedNewsfeed;
  final NewsletterDetailItem? selectedNewsfeedDetail;
  final List<NewsletterFileItem> selectedNewsfeedFiles;
  final BaseStateStatus detailStatus;
  final String? detailMessage;

  const NewsfeedState({
    required super.status,
    super.message,
    this.newsfeeds = const [],
    this.calendar,
    required this.selectedMonth,
    required this.selectedYear,
    this.calendarStatus = BaseStateStatus.init,
    this.calendarMessage,
    this.selectedNewsfeed,
    this.selectedNewsfeedDetail,
    this.selectedNewsfeedFiles = const [],
    this.detailStatus = BaseStateStatus.init,
    this.detailMessage,
  });

  factory NewsfeedState.init() {
    final now = DateTime.now();
    return NewsfeedState(
      status: BaseStateStatus.init,
      newsfeeds: const [],
      selectedMonth: now.month,
      selectedYear: now.year,
      calendarStatus: BaseStateStatus.init,
      detailStatus: BaseStateStatus.init,
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
        selectedNewsfeed,
        selectedNewsfeedDetail,
        selectedNewsfeedFiles,
        detailStatus,
        detailMessage,
      ];
}
