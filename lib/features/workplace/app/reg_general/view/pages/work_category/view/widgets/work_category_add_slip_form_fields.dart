import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import 'work_category_add_constants.dart';

class WorkCategorySlipFormFields extends StatelessWidget {
  const WorkCategorySlipFormFields({
    super.key,
    required this.slipKey,
    required this.onTypeTap,
    required this.onAssignerTap,
    required this.onParentTap,
  });

  final String slipKey;
  final VoidCallback onTypeTap;
  final VoidCallback onAssignerTap;
  final VoidCallback onParentTap;

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey<String>(slipKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ─── Kiểu hạng mục ───────────────────────────────────────────────
          FormBuilderField<String>(
            name: kTypeId(slipKey),
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: onTypeTap,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: kTypeText(slipKey),
                nameTextField: '${kTypeText(slipKey)}_tf',
                label: 'Kiểu hạng mục',
                isRequired: true,
                icon: Icons.category_outlined,
                validator: (v) => (v == null || v.isEmpty) ? 'Vui lòng chọn kiểu' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ─── Tình trạng (2x2 radio) ──────────────────────────────────────
          _StatusGridSection(slipKey: slipKey),
          const SizedBox(height: 12),

          // ─── Người giao việc ───────────────────────────────────────────────
          FormBuilderField<String>(
            name: kAssignerId(slipKey),
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: onAssignerTap,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: kAssignerText(slipKey),
                nameTextField: '${kAssignerText(slipKey)}_tf',
                label: 'Người giao việc',
                isRequired: true,
                icon: Icons.person_outline,
                validator: (v) => (v == null || v.isEmpty) ? 'Vui lòng chọn người giao việc' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ─── Hạng mục cấp cha ─────────────────────────────────────────────
          FormBuilderField<String>(
            name: kParentId(slipKey),
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: onParentTap,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: kParentText(slipKey),
                nameTextField: '${kParentText(slipKey)}_tf',
                label: 'Hạng mục cấp cha (nếu có)',
                icon: Icons.account_tree_outlined,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ─── Dự kiến / Thực tế ────────────────────────────────────────────
          _PlanActualSection(slipKey: slipKey, dateFmt: _dateFmt),
          const SizedBox(height: 12),

          // ─── Nội dung công việc ───────────────────────────────────────────
          FormInputField(
            nameForm: kMission(slipKey),
            nameTextField: '${kMission(slipKey)}_tf',
            label: 'Nội dung công việc',
            isRequired: true,
            icon: Icons.notes_outlined,
            maxLines: 3,
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Vui lòng nhập nội dung' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 12),

          // ─── Nơi làm việc ─────────────────────────────────────────────────
          _LocationSection(slipKey: slipKey),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ===========================================================================
// Status Grid (2x2)
// ===========================================================================
class _StatusGridSection extends StatelessWidget {
  const _StatusGridSection({required this.slipKey});
  final String slipKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: kStatus(slipKey),
      initialValue: '1',
      builder: (field) {
        final current = field.value ?? '1';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Tình trạng',
                children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _RadioChip(
                        label: kStatusOptions[0].label,
                        icon: kStatusOptions[0].icon,
                        selected: current == kStatusOptions[0].value,
                        onTap: () {
                          field.didChange(kStatusOptions[0].value);
                          _updateStatusFields(context, slipKey, kStatusOptions[0].value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _RadioChip(
                        label: kStatusOptions[1].label,
                        icon: kStatusOptions[1].icon,
                        selected: current == kStatusOptions[1].value,
                        onTap: () {
                          field.didChange(kStatusOptions[1].value);
                          _updateStatusFields(context, slipKey, kStatusOptions[1].value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _RadioChip(
                        label: kStatusOptions[2].label,
                        icon: kStatusOptions[2].icon,
                        selected: current == kStatusOptions[2].value,
                        onTap: () {
                          field.didChange(kStatusOptions[2].value);
                          _updateStatusFields(context, slipKey, kStatusOptions[2].value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _RadioChip(
                        label: kStatusOptions[3].label,
                        icon: kStatusOptions[3].icon,
                        selected: current == kStatusOptions[3].value,
                        onTap: () {
                          field.didChange(kStatusOptions[3].value);
                          _updateStatusFields(context, slipKey, kStatusOptions[3].value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _updateStatusFields(BuildContext context, String key, String status) {
    final form = FormBuilder.of(context);
    if (form == null) return;
    final today = DateTime.now();
    final todayOnlyDate = DateTime(today.year, today.month, today.day);

    if (status == '0' || status == '3') { // Chưa làm, Pending
      form.fields[kPlanStart(key)]?.didChange(null);
      form.fields[kPlanEnd(key)]?.didChange(null);
      form.fields[kActualStart(key)]?.didChange(null);
      form.fields[kActualEnd(key)]?.didChange(null);
    } else if (status == '1') { // Đang làm
      form.fields[kActualStart(key)]?.didChange(todayOnlyDate);
      form.fields[kActualEnd(key)]?.didChange(null);
    } else if (status == '2') { // Hoàn thành
      form.fields[kActualStart(key)]?.didChange(todayOnlyDate);
      form.fields[kActualEnd(key)]?.didChange(todayOnlyDate);
      form.fields[kPercent(key)]?.didChange('100');
    }
  }
}

// ===========================================================================
// Location section
// ===========================================================================
class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.slipKey});
  final String slipKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: kLocationType(slipKey),
      initialValue: kLocVtc,
      builder: (field) {
        final locType = field.value ?? kLocVtc;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Nơi làm việc',
                children: [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: _RadioChip(
                    label: 'VP RTC',
                    icon: locType == kLocVtc ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    selected: locType == kLocVtc,
                    onTap: () => field.didChange(kLocVtc),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _RadioChip(
                    label: 'Địa điểm khác',
                    icon: locType == kLocOther ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    selected: locType == kLocOther,
                    onTap: () => field.didChange(kLocOther),
                  ),
                ),
              ],
            ),
            if (locType == kLocOther) ...[
              const SizedBox(height: 8),
              FormInputField(
                nameForm: kLocationField(slipKey),
                nameTextField: '${kLocationField(slipKey)}_tf',
                label: 'Nhập địa điểm làm việc',
                icon: Icons.location_on_outlined,
                validator: (v) => (locType == kLocOther && (v == null || v.trim().isEmpty))
                    ? 'Vui lòng nhập địa điểm làm việc'
                    : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ],
        );
      },
    );
  }
}

// ===========================================================================
// Plan / Actual section
// ===========================================================================
class _PlanActualSection extends StatelessWidget {
  const _PlanActualSection({
    required this.slipKey,
    required this.dateFmt,
  });

  final String slipKey;
  final DateFormat dateFmt;

  @override
  Widget build(BuildContext context) {
    // Determine the initial component logic based on default status ('1')
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Default initial logic for Plan dates

    // final defaultPlanDate = today;
    final defaultActualStart = today; // vì default status = 1 (Đang làm)
    final defaultActualEnd = null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Dự kiến ─────────────────────────────────────────────────────
        _SectionLabel(label: 'Dự kiến', icon: Icons.event_outlined, color: AppColors.blueA500),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FormDateTimePicker(
                nameForm: kPlanStart(slipKey),
                nameTimePicker: '${kPlanStart(slipKey)}_inner',
                label: 'Ngày bắt đầu',
                isRequired: true,
                icon: Icons.play_arrow_outlined,
                inputType: InputType.date,
                format: dateFmt,
                initialDate: today,
                validator: (v) => v == null ? 'Vui lòng chọn ngày' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) => _calcPlanDays(context, slipKey),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FormDateTimePicker(
                nameForm: kPlanEnd(slipKey),
                nameTimePicker: '${kPlanEnd(slipKey)}_inner',
                label: 'Ngày kết thúc',
                isRequired: true,
                icon: Icons.stop_outlined,
                inputType: InputType.date,
                format: dateFmt,
                initialDate: today,
                validator: (v) => v == null ? 'Vui lòng chọn ngày' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) => _calcPlanDays(context, slipKey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        FormInputField(
          nameForm: kPlanDays(slipKey),
          nameTextField: '${kPlanDays(slipKey)}_tf',
          label: 'Số ngày',
          icon: Icons.calendar_today_outlined,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: '1',
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 16),

        // ─── Thực tế ──────────────────────────────────────────────────────
        _SectionLabel(label: 'Thực tế', icon: Icons.history_outlined, color: AppColors.greenA500),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FormDateTimePicker(
                nameForm: kActualStart(slipKey),
                nameTimePicker: '${kActualStart(slipKey)}_inner',
                label: 'Ngày bắt đầu',
                icon: Icons.play_arrow_outlined,
                inputType: InputType.date,
                format: dateFmt,
                initialValue: defaultActualStart,
                initialDate: today,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FormDateTimePicker(
                nameForm: kActualEnd(slipKey),
                nameTimePicker: '${kActualEnd(slipKey)}_inner',
                label: 'Ngày kết thúc',
                icon: Icons.stop_outlined,
                inputType: InputType.date,
                format: dateFmt,
                initialValue: defaultActualEnd,
                initialDate: today,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        FormInputField(
          nameForm: kPercent(slipKey),
          nameTextField: '${kPercent(slipKey)}_tf',
          label: '% Hoàn thành',
          icon: Icons.pie_chart_outline,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: '0',
          validator: (v) {
            final val = double.tryParse('${v ?? ''}'.trim());
            if (val == null || val < 0 || val > 100) return 'Giá trị 0-100';
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }

  void _calcPlanDays(BuildContext context, String slipId) {
    final form = FormBuilder.of(context);
    final start = form?.instantValue[kPlanStart(slipId)] as DateTime?;
    final end = form?.instantValue[kPlanEnd(slipId)] as DateTime?;
    if (start != null && end != null && !end.isBefore(start)) {
      final days = end.difference(start).inDays + 1;
      form?.fields[kPlanDays(slipId)]?.didChange(days.toString());
    } else {
      form?.fields[kPlanDays(slipId)]?.didChange('0');
    }
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
class _RadioChip extends StatelessWidget {
  const _RadioChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryERP.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.primaryERP : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: selected ? AppColors.primaryERP : Colors.grey,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  color: selected ? AppColors.primaryERP : Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label, required this.icon, required this.color});
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        Expanded(child: Divider(indent: 8, color: color.withValues(alpha: 0.3))),
      ],
    );
  }
}
