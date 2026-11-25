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

  /// Nhóm tin đang chọn ở tab "Tin nổi bật".
  final NewsletterCategory selectedCategory;

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
    this.selectedCategory = NewsletterCategory.hcns,
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
      selectedCategory: NewsletterCategory.hcns,
    );
  }

  /// Danh sách tin nổi bật của nhóm tin đang chọn.
  ///
  /// Mặc định nhóm là HCNS (trước đây gọi là "tin nội bộ").
  List<NewsletterItem> get featuredNewsfeeds => newsfeeds
      .where((item) => item.category == selectedCategory)
      .toList(growable: false);

  /// Số lượng tin của một nhóm, dùng để hiển thị badge trên tab.
  int countOfCategory(NewsletterCategory category) =>
      newsfeeds.where((item) => item.category == category).length;

  List<HolidayItem> get holidays => calendar?.holidays ?? const [];

  List<CompanyEventItem> get companyEvents =>
      calendar?.companyEvents ?? const [];

  List<ScheduleWorkSaturdayItem> get scheduleWorkSaturdays =>
      calendar?.scheduleWorkSaturdays ?? const [];

  /// Ngày nghỉ của tháng đang xem, gom theo số ngày.
  ///
  /// Chỉ nhận ngày thuộc đúng tháng/năm đang xem để tránh gán nhầm khi API
  /// trả về ngày vượt biên tháng.
  Map<int, List<HolidayItem>> get holidaysByDay {
    final result = <int, List<HolidayItem>>{};
    for (final holiday in holidays) {
      final date = holiday.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      result.putIfAbsent(date.day, () => []).add(holiday);
    }
    return result;
  }

  /// Sự kiện công ty của tháng đang xem, gom theo số ngày.
  Map<int, List<CompanyEventItem>> get companyEventsByDay {
    final result = <int, List<CompanyEventItem>>{};
    for (final event in companyEvents) {
      final date = event.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      result.putIfAbsent(date.day, () => []).add(event);
    }
    return result;
  }

  /// Các thứ bảy được làm việc trong tháng đang xem.
  ///
  /// Quy luật của API `/Holiday`:
  ///
  /// - `holidays` liệt kê các ngày nghỉ. Ngày nghỉ cuối tuần cũng có mặt
  ///   ở đây (ví dụ tháng 11: 7 và 21 là "Thứ 7 nghỉ").
  /// - `scheduleWorkSaturdays` liệt kê các thứ bảy được **khai báo**, kèm
  ///   trường `Status`:
  ///   - `Status = true` → thứ bảy đó **đi làm**.
  ///   - `Status = false` → thứ bảy đó **vẫn nghỉ** (đã được khai báo nhưng
  ///     bị từ chối, ví dụ tháng 10: 10 và 24).
  /// - Thứ bảy không xuất hiện ở cả hai danh sách → thứ bảy **đi làm**
  ///   (tháng 10: 3, 17, 31; tháng 11: 14, 28).
  Set<int> get workSaturdayDays {
    final result = <int>{};
    final offDays = holidaysByDay.keys.toSet();

    // Thứ bảy được khai báo rõ trong `scheduleWorkSaturdays`.
    for (final saturday in scheduleWorkSaturdays) {
      final date = saturday.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      // `Status = true` là ngày đi làm, `Status = false` là ngày nghỉ.
      if (saturday.status == true) result.add(date.day);
    }

    // Thứ bảy không được khai báo ở đâu cả và không có trong `holidays`
    // thì là ngày đi làm. Chỉ suy ra khi API đã liệt kê ngày nghỉ cuối tuần
    // của tháng, nếu không thì dữ liệu có thể đang thiếu.
    if (_apiListsWeekendDays) {
      for (var day = 1; day <= _daysInMonth; day++) {
        final date = DateTime(selectedYear, selectedMonth, day);
        if (date.weekday != DateTime.saturday) continue;
        if (offDays.contains(day)) continue;
        if (_declaredSaturdayDays.contains(day)) continue;
        result.add(day);
      }
    }

    return result;
  }

  /// Các thứ bảy là ngày nghỉ nhưng không có trong `holidays`.
  ///
  /// Đây là các thứ bảy được khai báo trong `scheduleWorkSaturdays` với
  /// `Status = false`: đã được khai báo đi làm nhưng bị từ chối nên vẫn nghỉ
  /// (tháng 10: 10 và 24; tháng 9: 12 và 26).
  Set<int> get offSaturdayDays {
    final result = <int>{};
    final offDays = holidaysByDay.keys.toSet();
    for (final saturday in scheduleWorkSaturdays) {
      final date = saturday.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      if (saturday.status == false) result.add(date.day);
    }
    // Ngày đã có trong `holidays` thì đã hiển thị theo tên ngày nghỉ rồi.
    result.removeAll(offDays);
    return result;
  }

  /// API có trả về ngày nghỉ cuối tuần của tháng đang xem hay không.
  ///
  /// Tháng 10 chỉ liệt kê Chủ Nhật nghỉ trong `holidays` (không có "Thứ 7
  /// nghỉ") nhưng vẫn là dữ liệu đầy đủ vì thứ bảy nghỉ đã được khai báo ở
  /// `scheduleWorkSaturdays` với `Status = false`.
  bool get _apiListsWeekendDays {
    for (final holiday in holidays) {
      final date = holiday.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        return true;
      }
    }
    return false;
  }

  /// Các thứ bảy được khai báo trong `scheduleWorkSaturdays` của tháng đang xem.
  Set<int> get _declaredSaturdayDays {
    final result = <int>{};
    for (final saturday in scheduleWorkSaturdays) {
      final date = saturday.date;
      if (date == null) continue;
      if (date.year != selectedYear || date.month != selectedMonth) continue;
      result.add(date.day);
    }
    return result;
  }

  /// Số ngày của tháng đang xem.
  int get _daysInMonth => DateTime(selectedYear, selectedMonth + 1, 0).day;

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
    selectedCategory,
  ];
}
