// Flutter Imports:
import 'package:flutter/material.dart';

// Package Imports:
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

extension StringToDateTime on String {
  // Định dạng mẫu cho chuỗi ngày/tháng/năm
  static final DateFormat _inputFormat = DateFormat("dd/MM/yyyy");

  // Phương thức chuyển đổi chuỗi thành DateTime
  DateTime toDateTime() {
    return _inputFormat.parse(this);
  }
}

extension DateTimeToString on DateTime {
  // Phương thức chuyển đổi DateTime thành chuỗi theo định dạng 'dd/MM/yyyy'
  String formatDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String convertTo12HFormatReminder() {
    String time12h = DateFormat('hh:mm a', 'en_US').format(this);

    String hour = time12h.substring(0, 2).padLeft(2, '0');
    String minute = time12h.substring(3, 5).padLeft(2, '0');
    String amPm = time12h.substring(6);

    return '$hour:$minute $amPm';
  }

  Future<tz.TZDateTime> convertToTZDateTime() async {
    final tzInfo = await FlutterTimezone.getLocalTimezone();
    String timeZoneName = tzInfo.identifier;

    if (timeZoneName == 'Asia/Saigon') {
      timeZoneName = 'Asia/Ho_Chi_Minh';
    }

    return tz.TZDateTime.from(this, tz.getLocation(timeZoneName));
  }

}

extension TimeOfDayExt on TimeOfDay {
  DateTime toDateTime() {
    DateTime now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
  }
}
