import '../utils/formatter/date_formatter.dart';

class SortDaysHelper {
  /// Nhóm các phần tử theo ngày, tuỳ chọn lọc theo khoảng thời gian, sau đó sắp xếp theo ngày.
  /// Mặc định sắp xếp giảm dần (mới nhất lên trên).
  static Map<DateTime, List<T>> groupAndSort<T>({
    required List<T> items,
    required DateTime Function(T) getDate,
    DateTime? filterStartDate,
    DateTime? filterEndDate,
    bool descending = true,
  }) {
    final grouped = <DateTime, List<T>>{};
    
    for (final item in items) {
      final day = DateFormatter.dateOnly(getDate(item));
      
      if (filterStartDate != null && filterEndDate != null) {
        final st = DateFormatter.dateOnly(filterStartDate);
        final en = DateFormatter.dateOnly(filterEndDate);
        if (day.isBefore(st) || day.isAfter(en)) {
          continue;
        }
      }
      grouped.putIfAbsent(day, () => []).add(item);
    }
    
    final sortedKeys = grouped.keys.toList();
    if (descending) {
      sortedKeys.sort((a, b) => b.compareTo(a));
    } else {
      sortedKeys.sort((a, b) => a.compareTo(b));
    }
    
    final sortedMap = <DateTime, List<T>>{};
    for (final k in sortedKeys) {
      sortedMap[k] = grouped[k]!;
    }
    
    return sortedMap;
  }
}
