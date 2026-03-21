import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';

import '../../../data/datasource/models/booking_vehicle_model.dart';

/// Mỗi dòng "nhân viên n" (expand/collapse) cho form "Người đi".
class PassengerInfoItem extends StatefulWidget {
  const PassengerInfoItem({
    super.key,
    required this.index,
    required this.isExpanded,
    required this.employeeOptions,
    required this.totalCount,
    this.prefillEmployee,
    required this.onToggleExpand,
    this.onDelete,
  });

  final int index;
  final int totalCount;
  final bool isExpanded;
  final List<BookingVehiclePersonalItem> employeeOptions;
  final BookingVehiclePersonalItem? prefillEmployee;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;

  @override
  State<PassengerInfoItem> createState() =>
      _PassengerInfoItemState();
}

class _PassengerInfoItemState
    extends State<PassengerInfoItem> {
  FormFieldState<String>? employeeSelectField;
  FormFieldState<String>? departmentField;
  FormFieldState<String>? employeeCodeField;
  FormFieldState<String>? employeeNameField;
  FormFieldState<String>? contactPhoneField;

  BookingVehiclePersonalItem? _selectedEmployee;

  bool get _isPassengerFromEmployee => _selectedEmployee != null;

  @override
  void initState() {
    super.initState();
    _selectedEmployee = widget.prefillEmployee;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.prefillEmployee != null) {
        _syncFieldsToEmployee(_selectedEmployee);
      } else {
        _tryHydrateSelectionFromForm();
      }
    });
  }

  @override
  void didUpdateWidget(covariant PassengerInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _syncFieldsToEmployee(_selectedEmployee);
      });
    }
    if (widget.employeeOptions != oldWidget.employeeOptions ||
        widget.index != oldWidget.index) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (widget.prefillEmployee == null) {
          _tryHydrateSelectionFromForm();
        }
      });
    }
  }

  /// Khôi phục NV đã chọn từ form (sau khi xoá dòng 0 và dịch field lên index mới).
  void _tryHydrateSelectionFromForm() {
    if (!mounted) return;
    final form = context.findAncestorStateOfType<FormBuilderState>();
    if (form == null) return;
    final code =
        (form.fields['passenger_code_${widget.index}']?.value as String?)
                ?.trim() ??
            '';
    final name =
        (form.fields['passenger_full_name_${widget.index}']?.value as String?)
                ?.trim() ??
            '';
    final empPick =
        (form.fields['passenger_employee_${widget.index}']?.value as String?)
                ?.trim() ??
            '';
    if (code.isEmpty && name.isEmpty && empPick.isEmpty) return;

    for (final e in widget.employeeOptions) {
      final c = (e.code ?? '').trim();
      final n = (e.fullName ?? '').trim();
      if (c.isEmpty && n.isEmpty) continue;
      if (code.isNotEmpty && c == code) {
        setState(() => _selectedEmployee = e);
        _syncFieldsToEmployee(e);
        return;
      }
      if (name.isNotEmpty && n == name) {
        setState(() => _selectedEmployee = e);
        _syncFieldsToEmployee(e);
        return;
      }
      if (empPick.isNotEmpty &&
          (n == empPick || empPick.contains(n) || c == empPick)) {
        setState(() => _selectedEmployee = e);
        _syncFieldsToEmployee(e);
        return;
      }
    }
  }

  void _syncFieldsToEmployee(BookingVehiclePersonalItem? employee) {
    employeeSelectField?.didChange(employee?.fullName ?? '');
    departmentField?.didChange(employee?.departmentName ?? '');
    employeeCodeField?.didChange(employee?.code ?? '');
    employeeNameField?.didChange(employee?.fullName ?? '');
    contactPhoneField?.didChange(employee?.sdtCaNhan ?? '');
  }

  void _switchToManualPassengerEntry() {
    setState(() => _selectedEmployee = null);
    employeeSelectField?.didChange('');
    departmentField?.didChange('');
    employeeCodeField?.didChange('');
    employeeNameField?.didChange('');
    contactPhoneField?.didChange('');
  }

  Future<void> _pickEmployee() async {
    final items = widget.employeeOptions;
    final hadEmployee = _selectedEmployee != null;

    await openSelectBottomSheet<BookingVehiclePersonalItem>(
      context: context,
      title: 'Chọn nhân viên',
      items: items,
      displayText: (v) => '${v.code ?? ''} - ${v.fullName ?? ''}',
      onSelected: (item) {
        setState(() => _selectedEmployee = item);
        _syncFieldsToEmployee(item);
      },
      secondaryActionLabel: hadEmployee
          ? 'Nhập tay (bỏ chọn nhân viên)'
          : null,
      onSecondaryAction:
          hadEmployee ? () => _switchToManualPassengerEntry() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final employeeIndex = widget.index;
    final canDelete = widget.totalCount > 1;
    final showExpanded = widget.isExpanded;

    return Slidable(
      key: ValueKey('passenger_${widget.index}'),
      enabled: !showExpanded && canDelete,
      endActionPane: showExpanded || !canDelete
          ? null
          : ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.22,
              children: [
                SlidableAction(
                  onPressed: (_) => widget.onDelete?.call(),
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  label: 'Xoá',
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
      child: Builder(
        builder: (slidableCtx) {
          final nameFromField = (employeeNameField?.value ?? '').trim();
          final headerTitle =
              'Người đi: ${nameFromField.isNotEmpty ? nameFromField : 'Chưa chọn'}';

          final collapsed = !widget.isExpanded;

          void toggle() {
            Slidable.of(slidableCtx)?.close();
            widget.onToggleExpand();
          }

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: collapsed ? 10 : 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(collapsed ? 12 : 16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: toggle,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            headerTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          widget.isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
                Offstage(
                  offstage: collapsed,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),

                      /// Chọn nhân viên
                      GestureDetector(
                        onTap: _pickEmployee,
                        child: AbsorbPointer(
                          child: FormInputField(
                            nameForm: 'passenger_employee_$employeeIndex',
                            nameTextField:
                                'passenger_employee_text_$employeeIndex',
                            label: 'Chọn là nhân viên (nếu có)',
                            icon: Icons.person_outline,
                            onFieldCreated: (field) =>
                                employeeSelectField = field,
                            readOnly: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      FormInputField(
                        nameForm: 'passenger_department_$employeeIndex',
                        nameTextField:
                            'passenger_department_text_$employeeIndex',
                        label: 'Phòng ban',
                        icon: Icons.apartment_outlined,
                        onFieldCreated: (field) => departmentField = field,
                        enabled: !_isPassengerFromEmployee,
                        readOnly: _isPassengerFromEmployee,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        nameForm: 'passenger_code_$employeeIndex',
                        nameTextField: 'passenger_code_text_$employeeIndex',
                        label: 'Mã người đi',
                        icon: Icons.assignment_ind_outlined,
                        onFieldCreated: (field) => employeeCodeField = field,
                        enabled: !_isPassengerFromEmployee,
                        readOnly: _isPassengerFromEmployee,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        nameForm: 'passenger_full_name_$employeeIndex',
                        nameTextField:
                            'passenger_full_name_text_$employeeIndex',
                        label: 'Tên người đi',
                        icon: Icons.person_pin_outlined,
                        onFieldCreated: (field) => employeeNameField = field,
                        onChanged: (_) {
                          if (mounted) setState(() {});
                        },
                        enabled: !_isPassengerFromEmployee,
                        readOnly: _isPassengerFromEmployee,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        nameForm:
                            'passenger_contact_phone_$employeeIndex',
                        nameTextField:
                            'passenger_contact_phone_text_$employeeIndex',
                        label: 'SĐT liên hệ',
                        icon: Icons.phone_outlined,
                        onFieldCreated: (field) =>
                            contactPhoneField = field,
                        enabled: !_isPassengerFromEmployee,
                        readOnly: _isPassengerFromEmployee,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        icon: Icons.note_outlined,
                        nameForm: 'passenger_note_$employeeIndex',
                        nameTextField:
                            'passenger_note_text_$employeeIndex',
                        label: 'Ghi chú (nếu có)',
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

