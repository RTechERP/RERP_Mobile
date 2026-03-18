import 'meeting_calender_model.dart';
import 'meeting_room_model.dart';


class MeetingRoomMapper {
  static Map<int, MeetingDataSource> map(MeetingRoomData data) {
    return {
      0: MeetingDataSource(_mapRoom(data.room1)),
      1: MeetingDataSource(_mapRoom(data.room2)),
      2: MeetingDataSource(_mapRoom(data.room3)),
    };
  }

  static List<Meeting> _mapRoom(List<MeetingRoomItem> items) {
    final List<Meeting> meetings = [];

    for (final item in items) {
      final date = item.allDate;

      DateTime? start;
      DateTime? end;
      String? currentValue;

      /// sort chuẩn theo time
      final sortedSlots = item.timeSlots.keys.toList()
        ..sort((a, b) {
          final t1 = _merge(date, a);
          final t2 = _merge(date, b);
          return t1.compareTo(t2);
        });

      for (final time in sortedSlots) {
        final raw = item.timeSlots[time];
        final value = raw != null ? _formatName(raw.toString()) : null;

        final currentTime = _merge(date, time);

        /// CASE 1: có booking
        if (value != null) {
          /// start mới
          if (start == null) {
            start = currentTime;
            end = currentTime.add(const Duration(minutes: 30));
            currentValue = value;
          }
          /// cùng meeting → extend
          else if (currentValue == value) {
            end = currentTime.add(const Duration(minutes: 30));
          }
          /// khác meeting → đóng block cũ
          else {
            meetings.add(
              Meeting(
                eventName: _buildDisplayName(
                  raw: currentValue ?? '',
                  start: start,
                  end: end!,
                ),
                from: start,
                to: end,
                background: generateNiceColor('$currentValue$start'),
                isBooked: true,
              ),
            );

            /// mở block mới
            start = currentTime;
            end = currentTime.add(const Duration(minutes: 30));
            currentValue = value;
          }
        }

        /// CASE 2: null → kết thúc block
        else {
          if (start != null) {
            meetings.add(
              Meeting(
                eventName: _buildDisplayName(
                  raw: currentValue ?? '',
                  start: start,
                  end: end!,
                ),
                from: start,
                to: end,
                background: generateNiceColor('$currentValue$start'),
                isBooked: true,
              ),
            );
            start = null;
            end = null;
            currentValue = null;
          }
        }
      }

      /// flush cuối
      if (start != null) {
        meetings.add(
          Meeting(
            eventName: _buildDisplayName(
              raw: currentValue ?? '',
              start: start,
              end: end!,
            ),
            from: start,
            to: end,
            background: generateNiceColor('$currentValue$start'),
            isBooked: true,
          ),
        );
      }
    }

    return meetings;
  }

  static DateTime _merge(DateTime date, String time) {
    final t = time.split(':');

    return DateTime(
      date.year,
      date.month,
      date.day,
      int.parse(t[0]),
      int.parse(t[1]),
    );
  }

  static String _formatName(String raw) {
    final index = raw.indexOf('#');
    final clean = index != -1 ? raw.substring(0, index) : raw;

    /// tách theo " - "
    final parts = clean.split('-');

    if (parts.length == 2) {
      return '${parts[0]}\n-\n${parts[1]}'; // 👈 xuống dòng
    }

    return clean;
  }

  static String _buildDisplayName({
    required String raw,
    required DateTime start,
    required DateTime end,
  }) {
    final index = raw.indexOf('#');
    final clean = index != -1 ? raw.substring(0, index) : raw;

    final parts = clean.split('-');

    final code = parts.isNotEmpty ? parts[0].trim() : '';
    final name = parts.length > 1 ? parts[1].trim() : '';

    final time = '${_formatTime(start)} - ${_formatTime(end)}';

    return '$time\n $code\n$name'; // 👈 thêm space đầu dòng để đỡ lệch
  }

  static String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
