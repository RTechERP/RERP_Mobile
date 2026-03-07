import 'package:intl/intl.dart';

class NumberFormatter {
  static final _intFormatter = NumberFormat('#,###', 'vi_VN');

  /// 120000 -> 120.000
  static String formatInt(int? value) {
    if (value == null) return '--';
    return _intFormatter.format(value);
  }

  /// dynamic / num
  static String formatNum(num? value) {
    if (value == null) return '--';
    return _intFormatter.format(value);
  }
}