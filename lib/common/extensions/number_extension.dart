import 'package:intl/intl.dart';

extension IntFormatExt on int {
  String get formatVND =>
      NumberFormat('#,###', 'vi_VN').format(this);
}

extension NumFormatExt on num {
  String get formatVND =>
      NumberFormat('#,###', 'vi_VN').format(this);
}