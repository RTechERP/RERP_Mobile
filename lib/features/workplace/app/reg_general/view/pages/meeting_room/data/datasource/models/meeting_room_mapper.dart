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
      int? currentRoomId;

      /// sort chuẩn theo time
      final sortedSlots = item.timeSlots.keys.toList()
        ..sort((a, b) {
          final t1 = _merge(date, a);
          final t2 = _merge(date, b);
          return t1.compareTo(t2);
        });

      for (final time in sortedSlots) {
        final raw = item.timeSlots[time];
        final rawStr = raw?.toString();
        final value = rawStr != null ? _formatName(rawStr) : null;
        final parsedRoomId = rawStr != null ? _parseRoomId(rawStr) : null;

        final currentTime = _merge(date, time);

        /// CASE 1: có booking
        if (value != null) {
          /// start mới
          if (start == null) {
            start = currentTime;
            end = currentTime.add(const Duration(minutes: 30));
            currentValue = value;
            currentRoomId = parsedRoomId;
          }
          /// cùng meeting → extend
          else if (currentValue == value &&
              (currentRoomId == null ||
                  parsedRoomId == null ||
                  currentRoomId == parsedRoomId)) {
            end = currentTime.add(const Duration(minutes: 30));
            // keep currentRoomId; but if it's missing try fill from raw
            if (currentRoomId == null && parsedRoomId != null) {
              currentRoomId = parsedRoomId;
            }
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
                roomId: currentRoomId,
              ),
            );

            /// mở block mới
            start = currentTime;
            end = currentTime.add(const Duration(minutes: 30));
            currentValue = value;
            currentRoomId = parsedRoomId;
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
                roomId: currentRoomId,
              ),
            );
            start = null;
            end = null;
            currentValue = null;
            currentRoomId = null;
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
            roomId: currentRoomId,
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

  static int? _parseRoomId(String raw) {
    final idx = raw.indexOf('#');
    if (idx == -1) return null;

    final suffix = raw.substring(idx + 1).trim();
    if (suffix.isEmpty) return null;

    // Backend format unknown; try to extract the first integer in suffix.
    final match = RegExp(r'\d+').firstMatch(suffix);
    if (match == null) return null;

    return int.tryParse(match.group(0) ?? '');
  }

  static String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
