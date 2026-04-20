class GetDaysHelper {
  GetDaysHelper._();

  static (DateTime start, DateTime end) calendarMonthBounds(DateTime anyDayInMonth) {
    final y = anyDayInMonth.year, m = anyDayInMonth.month;
    return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
  }
}
