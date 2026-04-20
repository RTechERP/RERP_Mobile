class DateFormatter {
  static DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  static (DateTime start, DateTime end) calendarMonthBounds(DateTime d) {
    final y = d.year, m = d.month;
    return (DateTime(y, m, 1), DateTime(y, m + 1, 0));
  }
}