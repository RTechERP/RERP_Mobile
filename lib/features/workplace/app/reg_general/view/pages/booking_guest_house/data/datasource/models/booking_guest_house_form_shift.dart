import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Khi xoá dòng [deletedIndex], dịch toàn bộ field `roommate_*` từ index cao
/// xuống để index UI luôn là 0..n-1.
abstract final class BookingGuestHouseRoommateFormShift {
  BookingGuestHouseRoommateFormShift._();

  static const List<List<String>> _pairs = [
    ['roommate_full_name', 'roommate_full_name_text'],
    ['roommate_department', 'roommate_department_text'],
    ['roommate_code', 'roommate_code_text'],
    ['roommate_roommate_name', 'roommate_roommate_name_text'],
    ['roommate_phone', 'roommate_phone_text'],
    ['roommate_note', 'roommate_note_text'],
  ];

  static Map<String, dynamic> computeShiftedFields({
    required FormBuilderState form,
    required int deletedIndex,
    required int oldLineCount,
  }) {
    if (oldLineCount <= 1) return {};
    if (deletedIndex < 0 || deletedIndex >= oldLineCount) return {};

    final newLength = oldLineCount - 1;
    final snap = form.instantValue;
    final result = <String, dynamic>{};

    // 1. Shift rows up
    for (var newIdx = deletedIndex; newIdx < newLength; newIdx++) {
      final oldIdx = newIdx + 1;
      for (final pair in _pairs) {
        final fk = '${pair[0]}_$newIdx';
        final tk = '${pair[1]}_$newIdx';
        result[fk] = snap['${pair[0]}_$oldIdx'] ?? '';
        result[tk] = snap['${pair[1]}_$oldIdx'] ?? '';
      }
    }

    // 2. Clear last row keys
    final lastIdx = oldLineCount - 1;
    for (final pair in _pairs) {
      result['${pair[0]}_$lastIdx'] = null;
      result['${pair[1]}_$lastIdx'] = null;
    }

    return result;
  }
}