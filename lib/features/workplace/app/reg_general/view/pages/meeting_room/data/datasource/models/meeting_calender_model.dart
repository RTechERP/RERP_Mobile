import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Meeting {
  Meeting({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    this.isAllDay = false,
    this.recurrenceRule,
    this.isBooked = false,
  });

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? recurrenceRule;
  bool isBooked;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  Meeting _getMeeting(int index) {
    return appointments![index] as Meeting;
  }

  @override
  DateTime getStartTime(int index) => _getMeeting(index).from;

  @override
  DateTime getEndTime(int index) => _getMeeting(index).to;

  @override
  String getSubject(int index) => _getMeeting(index).eventName;

  @override
  Color getColor(int index) => _getMeeting(index).background;

  @override
  bool isAllDay(int index) => _getMeeting(index).isAllDay;

  @override
  String? getRecurrenceRule(int index) =>
      _getMeeting(index).recurrenceRule;
}

class MeetingRoom {
  final String name;

  MeetingRoom(this.name);
}

Color generateNiceColor(String seed) {
  final hash = seed.hashCode;
  final hue = (hash % 360).toDouble();

  return HSVColor.fromAHSV(
    1,
    hue,
    0.6,
    0.85,
  ).toColor();
}