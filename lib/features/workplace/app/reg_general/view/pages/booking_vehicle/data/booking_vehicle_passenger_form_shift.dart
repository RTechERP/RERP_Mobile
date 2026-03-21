import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Khi xoá dòng [deletedIndex], dịch toàn bộ field `passenger_*` từ index cao xuống
/// để index UI luôn là 0..n-1 và dữ liệu các dòng sau không bị mất.
abstract final class BookingVehiclePassengerFormShift {
  BookingVehiclePassengerFormShift._();

  static const List<List<String>> _pairs = [
    ['passenger_employee', 'passenger_employee_text'],
    ['passenger_department', 'passenger_department_text'],
    ['passenger_code', 'passenger_code_text'],
    ['passenger_full_name', 'passenger_full_name_text'],
    ['passenger_contact_phone', 'passenger_contact_phone_text'],
    ['passenger_note', 'passenger_note_text'],
  ];

  static void afterDeleteAt(
    FormBuilderState? form, {
    required int deletedIndex,
    required int oldLineCount,
  }) {
    if (form == null || oldLineCount <= 1) return;
    if (deletedIndex < 0 || deletedIndex >= oldLineCount) return;

    final newLength = oldLineCount - 1;
    final snap = form.instantValue;
    final patch = <String, dynamic>{};

    for (var newIdx = deletedIndex; newIdx < newLength; newIdx++) {
      final oldIdx = newIdx + 1;
      for (final pair in _pairs) {
        final baseForm = pair[0];
        final baseText = pair[1];
        final fk = '${baseForm}_$newIdx';
        final tk = '${baseText}_$newIdx';
        final ofk = '${baseForm}_$oldIdx';
        final otk = '${baseText}_$oldIdx';
        patch[fk] = snap[ofk] ?? '';
        patch[tk] = snap[otk] ?? '';
      }
    }

    final lastIdx = oldLineCount - 1;
    for (final pair in _pairs) {
      final baseForm = pair[0];
      final baseText = pair[1];
      patch['${baseForm}_$lastIdx'] = '';
      patch['${baseText}_$lastIdx'] = '';
    }

    form.patchValue(patch);
  }
}
