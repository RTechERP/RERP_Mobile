import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Dịch field form người nhận + kiện khi xoá một dòng (index 0..n-1).
abstract final class BookingVehicleReceiverFormShift {
  BookingVehicleReceiverFormShift._();

  static const List<List<String>> _stringPairs = [
    ['receiver_employee', 'receiver_employee_text'],
    ['receiver_name', 'receiver_name_text'],
    ['receiver_phone_number', 'receiver_phone_number_text'],
    ['commercial_package_name', 'commercial_package_name_text'],
    ['package_size', 'package_size_text'],
    ['package_weight', 'package_weight_text'],
    ['commercial_package_quantity', 'commercial_package_quantity_text'],
    ['note_return_or_delivery', 'note_return_or_delivery_text'],
  ];

  static Map<String, dynamic> computeShiftedFields({
    FormBuilderState? form,
    required int deletedIndex,
    required int oldLineCount,
  }) {
    if (form == null || oldLineCount <= 1) return {};
    if (deletedIndex < 0 || deletedIndex >= oldLineCount) return {};

    final newLength = oldLineCount - 1;
    final snap = form.instantValue;
    final patch = <String, dynamic>{};

    // 1. Shift existing rows up
    for (var newIdx = deletedIndex; newIdx < newLength; newIdx++) {
      final oldIdx = newIdx + 1;
      for (final pair in _stringPairs) {
        final bf = pair[0];
        final bt = pair[1];
        patch['${bf}_$newIdx'] = snap['${bf}_$oldIdx'] ?? '';
        patch['${bt}_$newIdx'] = snap['${bt}_$oldIdx'] ?? '';
      }
      final oldImg = snap['commercial_package_image_$oldIdx'];
      final files = oldImg is List
          ? oldImg.whereType<PlatformFile>().toList()
          : <PlatformFile>[];
      patch['commercial_package_image_$newIdx'] = List<PlatformFile>.from(files);
    }

    // 2. Clear (set null) deleted row fields so patchValue removes the keys
    final deletedRowIdx = oldLineCount - 1;
    for (final pair in _stringPairs) {
      patch['${pair[0]}_$deletedRowIdx'] = null;
      patch['${pair[1]}_$deletedRowIdx'] = null;
    }
    patch['commercial_package_image_$deletedRowIdx'] = null;

    return patch;
  }

  /// @deprecated Dùng [computeShiftedFields] thay thế.
  static void afterDeleteAt(
    FormBuilderState? form, {
    required int deletedIndex,
    required int oldLineCount,
  }) {
    final patch = computeShiftedFields(
      form: form,
      deletedIndex: deletedIndex,
      oldLineCount: oldLineCount,
    );
    if (patch.isNotEmpty) {
      form?.patchValue(patch);
    }
  }
}
