import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_checkbox.dart';
import '../../../../../../../../../common/widgets/form/form_choice_group.dart';
import '../../../../../../../../../common/widgets/form/form_date_time_picker.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import 'overtime_add_constants.dart';

/// Form fields cho một khoảng thời gian làm thêm (một "phiếu").
///
/// Nhãn form:
///   ot_slip_${slipKey}_time_start   → DateTime?
///   ot_slip_${slipKey}_time_end     → DateTime?
///   ot_slip_${slipKey}_overnight    → bool
///   ot_slip_${slipKey}_type_id      → String (ẩn, lưu int)
///   ot_slip_${slipKey}_type_text    → String (hiển thị tên loại)
///   ot_slip_${slipKey}_project_id   → String (ẩn, lưu int)
///   ot_slip_${slipKey}_project_text → String (hiển thị tên dự án)
///   ot_slip_${slipKey}_location_id  → int (lưu trực tiếp vào FormChoiceGroup)
///   ot_slip_${slipKey}_reason       → String
class OvertimeSlipFormFields extends StatelessWidget {
  const OvertimeSlipFormFields({
    super.key,
    required this.slipKey,
    required this.dateRegister,
    required this.onTypeTap,
    required this.onProjectTap,
    this.computedHours,
    this.readOnly = false,
    this.initialTimeStart,
    this.initialTimeEnd,
    this.initialTypeId,
    this.initialTypeLabel,
    this.initialLocationId,
    this.initialProjectId,
    this.initialProjectLabel,
    this.initialReason,
    this.initialOvernight = false,
    this.onTimeStartChanged,
    this.onEndTimeChanged,
    this.onOvernightChanged,
    this.isProjectRequired = true,
  });

  final String slipKey;
  final DateTime dateRegister;
  final void Function(String slipKey) onTypeTap;
  final void Function(String slipKey) onProjectTap;

  /// Số giờ tính toán từ màn hình cha (EndTime - TimeStart).
  final double? computedHours;
  final bool readOnly;

  final DateTime? initialTimeStart;
  final DateTime? initialTimeEnd;
  final int? initialTypeId;
  final String? initialTypeLabel;
  final int? initialLocationId;
  final int? initialProjectId;
  final String? initialProjectLabel;
  final String? initialReason;
  final bool initialOvernight;

  /// Callback khi ô "Từ" thay đổi — parent dùng để auto-tick overnight.
  final void Function(String slipKey, DateTime? value)? onTimeStartChanged;

  /// Callback khi ô "Đến" thay đổi — parent dùng để kiểm tra endTime > startTime.
  final void Function(String slipKey, DateTime? value)? onEndTimeChanged;

  /// Callback khi checkbox "Phụ cấp ăn tối" thay đổi — parent kiểm tra giờ.
  final void Function(String slipKey, bool? value)? onOvernightChanged;

  /// Whether project field is required (based on department).
  final bool isProjectRequired;

  /// Format double: bỏ ".0" nếu chẵn, hiện 1 chữ số thập phân nếu lẻ.
  static String _fmtDouble(double h) {
    final s = h.toStringAsFixed(2).replaceAll(RegExp(r'0+$'), '');
    return s.endsWith('.') ? s.substring(0, s.length - 1) : s;
  }

  @override
  Widget build(BuildContext context) {
    final defaultStart = initialTimeStart ??
        DateTime(
            dateRegister.year, dateRegister.month, dateRegister.day, 18, 0);
    // "Từ": chỉ hôm qua hoặc hôm nay.
    // "Đến": cho phép qua đêm đến hết ngày mai (hỗ trợ ca qua nửa đêm).
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final yesterdayStart = todayStart.subtract(const Duration(days: 1));
    final tomorrowStart = todayStart.add(const Duration(days: 1));
    // Cho phép "Đến" qua đêm đến tối đa 5:00 sáng ngày mai.
    final endDateMax = tomorrowStart.add(const Duration(hours: 5));

    final hoursText = computedHours != null
        ? computedHours! < 0
            ? '—'
            : '${_fmtDouble(computedHours!)} giờ'
        : '—';

    return KeyedSubtree(
      key: ValueKey<String>(slipKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Dự án ───────────────────────────────────────────────────
          FormBuilderField<String>(
            name: 'ot_slip_${slipKey}_project_id',
            initialValue:
            initialProjectId != null ? initialProjectId.toString() : '',

            builder: (_) => const SizedBox.shrink(),
          ),
          FormInputField(
            readOnly: true,
            nameForm: 'ot_slip_${slipKey}_project_text',
            nameTextField: 'ot_slip_${slipKey}_project_text_tf',
            label: 'Dự án',
            icon: Icons.work_outline,
            initialValue: initialProjectLabel ?? '',

            isRequired: isProjectRequired,
            onTap: readOnly ? null : () => onProjectTap(slipKey),
            validator: (v) {
              if (isProjectRequired && (v == null || v.isEmpty)) {
                return 'Vui lòng chọn dự án';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Thời gian bắt đầu
          FormDateTimePicker(
            nameForm: 'ot_slip_${slipKey}_time_start',
            nameTimePicker: 'ot_slip_${slipKey}_time_start_inner',
            label: 'Từ',
            icon: Icons.access_time_outlined,
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy HH:mm'),
            initialValue: defaultStart,
            initialDate: dateRegister,
            enabled: !readOnly,
            firstDate: yesterdayStart,
            lastDate: tomorrowStart,

            isRequired: true,
            onChanged: onTimeStartChanged == null
                ? null
                : (v) => onTimeStartChanged!(slipKey, v),
            validator: (v) {
              if (v == null) return 'Vui lòng chọn thời gian bắt đầu';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Thời gian kết thúc
          FormDateTimePicker(
            nameForm: 'ot_slip_${slipKey}_time_end',
            nameTimePicker: 'ot_slip_${slipKey}_time_end_inner',
            label: 'Đến',
            icon: Icons.access_time_filled_outlined,
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy HH:mm'),
            initialValue: initialTimeEnd,
            initialDate: dateRegister,
            enabled: !readOnly,
            firstDate: yesterdayStart,
            lastDate: endDateMax,

            isRequired: true,
            onChanged: onEndTimeChanged == null
                ? null
                : (v) => onEndTimeChanged!(slipKey, v),
            validator: (v) {
              if (v == null) return 'Vui lòng chọn thời gian kết thúc';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Row: Số giờ + Phụ cấp ăn tối ────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.hintText, width: 1.4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timelapse_outlined,
                          color: AppColors.hintText, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số giờ',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.hintText,
                              ),
                            ),
                            Text(
                              hoursText,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FormCheckbox(
                  name: 'ot_slip_${slipKey}_overnight',
                  title: const Text(
                    'Phụ cấp ăn tối',
                    style: TextStyle(fontSize: 13),
                  ),
                  initialValue: initialOvernight,
                  enabled: !readOnly,
                  onChanged: onOvernightChanged == null
                      ? null
                      : (v) => onOvernightChanged!(slipKey, v),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Loại làm thêm ────────────────────────────────────────────
          FormBuilderField<String>(
            name: 'ot_slip_${slipKey}_type_id',
            initialValue:
                initialTypeId != null ? initialTypeId.toString() : '',

            builder: (_) => const SizedBox.shrink(),
          ),
          FormInputField(
            readOnly: true,
            nameForm: 'ot_slip_${slipKey}_type_text',
            nameTextField: 'ot_slip_${slipKey}_type_text_tf',
            label: 'Loại làm thêm',
            icon: Icons.category_outlined,
            initialValue: initialTypeLabel ?? '',

            isRequired: true,
            onTap: readOnly ? null : () => onTypeTap(slipKey),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Vui lòng chọn loại làm thêm';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Địa điểm ────────────────────────────────────────────────
          FormChoiceGroup<int>(
            name: 'ot_slip_${slipKey}_location_id',
            label: 'Địa điểm',
            columns: 2,
            icon: Icons.location_on_outlined,
            enabled: !readOnly,
            initialValue: initialLocationId ?? kOvertimeLocationOptions.first.value,
            options: [
              for (final o in kOvertimeLocationOptions)
                FormChoiceOption(
                  value: o.value,
                  label: o.label,
                  selectedColor: AppColors.primaryERP,
                ),
            ],
            validator: (v) {
              if (v == null) return 'Vui lòng chọn địa điểm';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Lý do ────────────────────────────────────────────────────
          FormInputField(
            label: 'Lý do',
            nameForm: 'ot_slip_${slipKey}_reason',
            nameTextField: 'ot_slip_${slipKey}_reason_tf',
            icon: Icons.note_alt_outlined,
            maxLines: 3,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            readOnly: readOnly,
            initialValue: initialReason,

            isRequired: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Vui lòng nhập lý do';
              return null;
            },
          ),
        ],
      ),
    );
  }
}
