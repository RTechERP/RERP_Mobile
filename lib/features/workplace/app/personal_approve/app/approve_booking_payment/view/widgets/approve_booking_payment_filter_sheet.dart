// Bottom-sheet bộ lọc cho màn Duyệt ĐNTT: từ khoá + loại nội dung (chip) +
// bước duyệt + phòng ban + người tạo.
// Giá trị chỉ được gửi lên bloc khi bấm "Áp dụng" để tránh gọi API mỗi lần
// chọn.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../approve_purchasing/view/widgets/filter_field.dart';
import '../../../approve_purchasing/view/widgets/filter_section_label.dart';
import '../../../approve_purchasing/view/widgets/picker_sheet.dart';
import '../../data/datasource/models/approve_booking_payment_model.dart';
import '../bloc/approve_booking_payment_bloc.dart';

class ApproveBookingPaymentFilterSheet extends StatefulWidget {
  const ApproveBookingPaymentFilterSheet({super.key});

  @override
  State<ApproveBookingPaymentFilterSheet> createState() =>
      _ApproveBookingPaymentFilterSheetState();
}

class _ApproveBookingPaymentFilterSheetState
    extends State<ApproveBookingPaymentFilterSheet> {
  /// Các loại nội dung (`TypeName` của phiếu) cho phép lọc nhanh bằng chip.
  static const List<String> _typeNames = [
    'Chi phí phương tiện',
    'Công tác phí',
  ];

  late final TextEditingController _keywordCtl;
  String? _typeName;
  ApproveBookingPaymentStep? _step;
  ApproveBookingPaymentDepartment? _department;
  ApproveBookingPaymentEmployee? _employee;

  @override
  void initState() {
    super.initState();
    final state = context.read<ApproveBookingPaymentBloc>().state;
    _keywordCtl = TextEditingController(text: state.keyword);
    _typeName = state.selectedTypeName;
    _step = state.selectedStep;
    _department = state.selectedDepartment;
    _employee = state.selectedEmployee;
  }

  @override
  void dispose() {
    _keywordCtl.dispose();
    super.dispose();
  }

  /// Chọn bước duyệt từ API get-approve-steps. Bỏ bước đầu (không có `code`)
  /// vì không có `ApproverCode` để lọc.
  void _pickStep(List<ApproveBookingPaymentStep> steps) {
    showPickerBottomSheet<ApproveBookingPaymentStep>(
      context: context,
      title: 'Chọn bước duyệt',
      items: steps.where((s) => (s.code ?? '').isNotEmpty).toList(),
      label: (s) => s.stepName ?? s.code ?? '#${s.step}',
      onSelected: (s) => setState(() => _step = s),
    );
  }

  /// Chọn phòng ban. Nếu người tạo đã chọn không thuộc phòng ban mới thì bỏ chọn.
  void _pickDepartment(List<ApproveBookingPaymentDepartment> departments) {
    showPickerBottomSheet<ApproveBookingPaymentDepartment>(
      context: context,
      title: 'Chọn phòng ban',
      items: departments,
      label: (d) => d.name ?? d.code ?? '#${d.id}',
      onSelected: (d) => setState(() {
        _department = d;
        if (_employee != null && _employee!.departmentId != d.id) {
          _employee = null;
        }
      }),
    );
  }

  /// Chọn người tạo, thu hẹp theo phòng ban đang chọn (nếu có).
  void _pickEmployee(List<ApproveBookingPaymentEmployee> employees) {
    final deptId = _department?.id;
    final source = deptId == null
        ? employees
        : employees.where((e) => e.departmentId == deptId).toList();
    showPickerBottomSheet<ApproveBookingPaymentEmployee>(
      context: context,
      title: 'Chọn người tạo',
      items: source,
      label: _employeeLabel,
      onSelected: (e) => setState(() => _employee = e),
    );
  }

  String _employeeLabel(ApproveBookingPaymentEmployee e) {
    final name = e.fullName ?? '';
    final code = e.code ?? '';
    if (code.isEmpty) return name;
    return name.isEmpty ? code : '$code - $name';
  }

  void _apply() {
    context.read<ApproveBookingPaymentBloc>().add(
      ApproveBookingPaymentEvent.applyFilter(
        typeName: _typeName,
        step: _step,
        department: _department,
        employee: _employee,
        keyword: _keywordCtl.text,
      ),
    );
    Navigator.of(context).pop();
  }

  void _reset() {
    context.read<ApproveBookingPaymentBloc>().add(
      const ApproveBookingPaymentEvent.resetFilter(),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<ApproveBookingPaymentBloc>().state;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bộ lọc',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.enableText,
                ),
              ),
              const SizedBox(height: 16),
              const FilterSectionLabel(
                icon: Icons.search,
                label: 'Từ khoá tìm kiếm',
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _keywordCtl,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _apply(),
                decoration: InputDecoration(
                  hintText: 'Mã phiếu, lý do...',
                  hintStyle: const TextStyle(
                    color: AppColors.gray,
                    fontSize: 13,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.gray,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const FilterSectionLabel(
                icon: Icons.category_outlined,
                label: 'Loại nội dung',
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final name in _typeNames)
                    ChoiceChip(
                      label: Text(name),
                      selected: _typeName == name,
                      // Bấm lại chip đang chọn để bỏ lọc.
                      onSelected: (on) =>
                          setState(() => _typeName = on ? name : null),
                      selectedColor: AppColors.primaryERP.withValues(
                        alpha: 0.15,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _typeName == name
                            ? AppColors.primaryERP
                            : AppColors.gray,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 18),
              const FilterSectionLabel(
                icon: Icons.account_tree_outlined,
                label: 'Bước duyệt',
              ),
              const SizedBox(height: 8),
              FilterField(
                icon: Icons.account_tree_outlined,
                placeholder: 'Chọn bước duyệt',
                value: _step?.stepName,
                onTap: () => _pickStep(state.steps),
                onClear: () => setState(() => _step = null),
              ),
              const SizedBox(height: 18),
              const FilterSectionLabel(
                icon: Icons.apartment_outlined,
                label: 'Phòng ban',
              ),
              const SizedBox(height: 8),
              FilterField(
                icon: Icons.apartment_outlined,
                placeholder: 'Chọn phòng ban',
                value: _department?.name,
                onTap: () => _pickDepartment(state.departments),
                onClear: () => setState(() => _department = null),
              ),
              const SizedBox(height: 18),
              const FilterSectionLabel(
                icon: Icons.person_outline,
                label: 'Người tạo',
              ),
              const SizedBox(height: 8),
              FilterField(
                icon: Icons.person_outline,
                placeholder: 'Chọn người tạo',
                value: _employee == null ? null : _employeeLabel(_employee!),
                onTap: () => _pickEmployee(state.employees),
                onClear: () => setState(() => _employee = null),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _reset,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.gray,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Xoá lọc'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _apply,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryERP,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Áp dụng'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
