import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    required this.infoFieldValues,
    this.prefillEmployee,
    required this.onToggleExpand,
    this.onDelete,
    this.generation = 0,
  });

  final int index;
  final int totalCount;
  final bool isExpanded;
  final List<BookingVehiclePersonalItem> employeeOptions;
  /// Map infoFieldValues từ BLoC state — source of truth cho dữ liệu dòng.
  final Map<String, dynamic> infoFieldValues;
  final BookingVehiclePersonalItem? prefillEmployee;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  /// Dùng để buộc Slidable + child rebuild khi generation thay đổi (sau xoá dòng).
  final int generation;

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

    // Hydrate từ BLoC state (infoFieldValues) — đọc trực tiếp từ state, không cần postFrame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _hydrateFromState();
    });
  }

  @override
  void didUpdateWidget(covariant PassengerInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
    }
  }

  /// Hydrate form fields từ infoFieldValues (BLoC state).
  /// Đọc trực tiếp từ state — đảm bảo đúng sau patchValue + shift.
  void _hydrateFromState() {
    if (widget.infoFieldValues.isEmpty) {
      if (widget.prefillEmployee != null) {
        _syncFieldsToEmployee(_selectedEmployee);
      }
      return;
    }

    final i = widget.index;
    final empVal = widget.infoFieldValues['passenger_employee_$i'] as String?;
    final codeVal = widget.infoFieldValues['passenger_code_$i'] as String?;
    final nameVal = widget.infoFieldValues['passenger_full_name_$i'] as String?;
    final phoneVal = widget.infoFieldValues['passenger_contact_phone_$i'] as String?;
    final deptVal = widget.infoFieldValues['passenger_department_$i'] as String?;

    final empTrim = (empVal ?? '').trim();
    final codeTrim = (codeVal ?? '').trim();
    final nameTrim = (nameVal ?? '').trim();

    // Ưu tiên prefillEmployee (user hiện tại dòng 0).
    if (widget.prefillEmployee != null) {
      _syncFieldsToEmployee(_selectedEmployee);
      return;
    }

    // Ngược lại: hydrate từ infoFieldValues.
    final hasEmpData = empTrim.isNotEmpty || codeTrim.isNotEmpty || nameTrim.isNotEmpty;
    if (!hasEmpData) return;

    // Tìm employee object từ employeeOptions.
    BookingVehiclePersonalItem? matched;
    for (final e in widget.employeeOptions) {
      final ec = (e.code ?? '').trim();
      final en = (e.fullName ?? '').trim();
      if (ec.isNotEmpty && ec == codeTrim) {
        matched = e;
        break;
      }
      if (en.isNotEmpty && en == nameTrim) {
        matched = e;
        break;
      }
    }

    if (matched != null) {
      setState(() => _selectedEmployee = matched);
      _syncFieldsToEmployee(matched);
    } else {
      // Manual entry: chỉ didChange, không sync _selectedEmployee.
      if (empTrim.isNotEmpty && employeeSelectField?.value?.trim() != empTrim) {
        employeeSelectField?.didChange(empTrim);
      }
      if (deptVal != null && deptVal.trim().isNotEmpty) {
        departmentField?.didChange(deptVal.trim());
      }
      if (codeTrim.isNotEmpty && employeeCodeField?.value?.trim() != codeTrim) {
        employeeCodeField?.didChange(codeTrim);
      }
      if (nameTrim.isNotEmpty && employeeNameField?.value?.trim() != nameTrim) {
        employeeNameField?.didChange(nameTrim);
      }
      if (phoneVal != null && phoneVal.trim().isNotEmpty) {
        contactPhoneField?.didChange(phoneVal.trim());
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
    final gen = widget.generation;

    return Slidable(
      key: ValueKey('passenger_${widget.index}_$gen'),
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
          // Đọc trực tiếp từ infoFieldValues (BLoC state) — source of truth cuối cùng.
          final i = widget.index;
          final nameFromState =
              (widget.infoFieldValues['passenger_full_name_$i'] as String?)
                      ?.trim() ??
                  '';
          final headerTitle =
              'Người đi: ${nameFromState.isNotEmpty ? nameFromState : 'Chưa chọn'}';

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
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập tên người đi',
                        ),
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
                        keyboardType: TextInputType.phone,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập SĐT liên hệ',
                        ),
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        icon: Icons.note_outlined,
                        nameForm: 'passenger_note_$employeeIndex',
                        nameTextField:
                            'passenger_note_text_$employeeIndex',
                        label: 'Ghi chú (nếu có)',
                        autoExpand: true,
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
