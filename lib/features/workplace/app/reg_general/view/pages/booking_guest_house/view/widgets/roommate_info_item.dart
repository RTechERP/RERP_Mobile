// Widget dòng "Người ở n" cho form Đặt phòng nhà nghỉ.
//
// Pattern theo booking_vehicle/PassengerInfoItem:
// - State local `_selectedEmployee` quyết định 3 field readonly hay không.
// - Hydrate từ infoFieldValues (Map<String, dynamic>) do parent cung cấp
//   (đóng vai trò source-of-truth giống BLoC state bên vehicle).
// - User có thể chọn Employee từ picker hoặc nhập tay (bỏ chọn nhân viên).

import 'package:flutter/material.dart';

import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';

import '../../data/datasource/models/booking_guest_house_model.dart';

class RoommateInfoItem extends StatefulWidget {
  const RoommateInfoItem({
    super.key,
    required this.index,
    required this.employeeOptions,
    required this.infoFieldValues,
    this.prefillEmployee,
    required this.onChanged,
  });

  /// Index dòng (0 = slip đầu tiên = currentUser).
  final int index;

  /// Danh sách Employee có thể pick.
  final List<EmployeeFilterItem> employeeOptions;

  /// Source-of-truth cho dữ liệu dòng: parent cung cấp Map<String, dynamic>
  /// với key `roommate_*_$i` và `roommate_*_text_$i`.
  final Map<String, dynamic> infoFieldValues;

  /// Prefill Employee (currentUser cho dòng 0).
  final EmployeeFilterItem? prefillEmployee;

  /// Callback mỗi khi widget muốn parent sync dữ liệu mới vào infoFieldValues
  /// (sau khi chọn Employee hoặc nhập tay).
  final ValueChanged<Map<String, dynamic>> onChanged;

  @override
  State<RoommateInfoItem> createState() => _RoommateInfoItemState();
}

class _RoommateInfoItemState extends State<RoommateInfoItem> {
  // FormFieldState handles — dùng để didChange() cập nhật FormBuilder.
  FormFieldState<String>? nameField;
  FormFieldState<String>? departmentField;
  FormFieldState<String>? codeField;
  FormFieldState<String>? roommateNameField;
  FormFieldState<String>? phoneField;
  FormFieldState<String>? noteField;

  EmployeeFilterItem? _selectedEmployee;

  bool get _isFromEmployee => _selectedEmployee != null;

  @override
  void initState() {
    super.initState();
    _selectedEmployee = widget.prefillEmployee;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _hydrateFromState();
    });
  }

  @override
  void didUpdateWidget(covariant RoommateInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
    }
  }

  void _hydrateFromState() {
    final i = widget.index;
    final codeVal = widget.infoFieldValues['roommate_code_$i'] as String?;
    final nameVal =
        widget.infoFieldValues['roommate_full_name_$i'] as String?;

    final codeTrim = (codeVal ?? '').trim();
    final nameTrim = (nameVal ?? '').trim();

    if (widget.prefillEmployee != null) {
      _syncFieldsToEmployee(_selectedEmployee);
      return;
    }

    final hasData = codeTrim.isNotEmpty || nameTrim.isNotEmpty;
    if (!hasData) return;

    // Match employee theo code hoặc fullName.
    EmployeeFilterItem? matched;
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
      return;
    }

    // Manual entry — đẩy value từ state xuống field.
    final deptVal =
        widget.infoFieldValues['roommate_department_$i'] as String?;
    final phoneVal =
        widget.infoFieldValues['roommate_phone_$i'] as String?;
    if (nameTrim.isNotEmpty && nameField?.value?.trim() != nameTrim) {
      nameField?.didChange(nameTrim);
    }
    if (deptVal != null && deptVal.trim().isNotEmpty) {
      departmentField?.didChange(deptVal.trim());
    }
    if (codeTrim.isNotEmpty && codeField?.value?.trim() != codeTrim) {
      codeField?.didChange(codeTrim);
    }
    if (nameTrim.isNotEmpty &&
        roommateNameField?.value?.trim() != nameTrim) {
      roommateNameField?.didChange(nameTrim);
    }
    if (phoneVal != null && phoneVal.trim().isNotEmpty) {
      phoneField?.didChange(phoneVal.trim());
    }
  }

  void _syncFieldsToEmployee(EmployeeFilterItem? employee) {
    nameField?.didChange(employee?.fullName ?? '');
    departmentField?.didChange(employee?.departmentName ?? '');
    codeField?.didChange(employee?.code ?? employee?.id?.toString() ?? '');
    roommateNameField?.didChange(employee?.fullName ?? '');
    phoneField?.didChange(employee?.sdtCaNhan ?? '');
  }

  void _emitInfoPatch({
    String? fullName,
    String? employeeCode,
    String? department,
    String? phone,
    String? note,
  }) {
    final i = widget.index;
    final patch = <String, dynamic>{};
    if (fullName != null) {
      patch['roommate_full_name_$i'] = fullName;
      patch['roommate_full_name_text_$i'] = fullName;
    }
    if (employeeCode != null) {
      patch['roommate_code_$i'] = employeeCode;
      patch['roommate_code_text_$i'] = employeeCode;
    }
    if (department != null) {
      patch['roommate_department_$i'] = department;
      patch['roommate_department_text_$i'] = department;
    }
    if (phone != null) {
      patch['roommate_phone_$i'] = phone;
      patch['roommate_phone_text_$i'] = phone;
    }
    if (note != null) {
      patch['roommate_note_$i'] = note;
      patch['roommate_note_text_$i'] = note;
    }
    widget.onChanged(patch);
  }

  void _switchToManual() {
    setState(() => _selectedEmployee = null);
    nameField?.didChange('');
    departmentField?.didChange('');
    codeField?.didChange('');
    roommateNameField?.didChange('');
    phoneField?.didChange('');
  }

  Future<void> _pickEmployee() async {
    final items = widget.employeeOptions;
    final hadEmployee = _selectedEmployee != null;

    await openSelectBottomSheet<EmployeeFilterItem>(
      context: context,
      title: 'Chọn nhân viên',
      hintText: 'Tìm theo tên nhân viên',
      items: items,
      initialSelectedItem: _selectedEmployee,
      displayText: (e) => e.fullName ?? 'N/A',
      onSelected: (item) {
        setState(() => _selectedEmployee = item);
        _syncFieldsToEmployee(item);
        // Đẩy info xuống parent để hydrate khi rebuild.
        _emitInfoPatch(
          fullName: item.fullName,
          employeeCode: item.code ?? item.id?.toString(),
          department: item.departmentName,
          phone: item.sdtCaNhan,
        );
      },
      secondaryActionLabel:
          hadEmployee ? 'Nhập tay (bỏ chọn nhân viên)' : null,
      onSecondaryAction: hadEmployee ? _switchToManual : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final i = widget.index;
    final nameFromState =
        (widget.infoFieldValues['roommate_full_name_$i'] as String?)?.trim() ??
            '';
    final headerTitle =
        'Người ở ${i + 1}${i == 0 ? '' : ''}: '
        '${nameFromState.isNotEmpty ? nameFromState : 'Chưa chọn'}';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.primaryERP.withValues(alpha: 0.1),
                child: Text(
                  '${i + 1}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Nhân viên — luôn mở picker, không auto-disable vì có thể nhập tay.
          GestureDetector(
            onTap: _pickEmployee,
            child: AbsorbPointer(
              child: FormInputField(
                nameForm: 'roommate_full_name_$i',
                nameTextField: 'roommate_full_name_text_$i',
                label: 'Chọn nhân viên',
                icon: Icons.person_outline,
                onFieldCreated: (field) => nameField = field,
                onChanged: (v) {
                  _emitInfoPatch(fullName: v);
                },
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Vui lòng nhập tên người ở';
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Phòng ban — readonly khi đã chọn nhân viên.
          FormInputField(
            nameForm: 'roommate_department_$i',
            nameTextField: 'roommate_department_text_$i',
            label: 'Phòng ban',
            icon: Icons.apartment_outlined,
            onFieldCreated: (field) => departmentField = field,
            enabled: !_isFromEmployee,
            readOnly: _isFromEmployee,
            onChanged: (v) => _emitInfoPatch(department: v),
          ),
          const SizedBox(height: 12),

          // Mã nhân viên — readonly khi đã chọn nhân viên.
          FormInputField(
            nameForm: 'roommate_code_$i',
            nameTextField: 'roommate_code_text_$i',
            label: 'Mã nhân viên',
            icon: Icons.badge_outlined,
            onFieldCreated: (field) => codeField = field,
            enabled: !_isFromEmployee,
            readOnly: _isFromEmployee,
            onChanged: (v) => _emitInfoPatch(employeeCode: v),
          ),
          const SizedBox(height: 12),

          // Tên người ở cùng — readonly khi đã chọn nhân viên.
          FormInputField(
            nameForm: 'roommate_roommate_name_$i',
            nameTextField: 'roommate_roommate_name_text_$i',
            label: 'Tên người ở cùng',
            icon: Icons.group_outlined,
            onFieldCreated: (field) => roommateNameField = field,
            enabled: !_isFromEmployee,
            readOnly: _isFromEmployee,
            onChanged: (v) => _emitInfoPatch(fullName: v),
          ),
          const SizedBox(height: 12),

          // SĐT liên hệ — luôn enable.
          FormInputField(
            nameForm: 'roommate_phone_$i',
            nameTextField: 'roommate_phone_text_$i',
            label: 'SĐT liên hệ',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            onFieldCreated: (field) => phoneField = field,
            isRequired: true,
            onChanged: (v) => _emitInfoPatch(phone: v),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Vui lòng nhập SĐT';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Ghi chú.
          FormInputField(
            nameForm: 'roommate_note_$i',
            nameTextField: 'roommate_note_text_$i',
            label: 'Ghi chú',
            icon: Icons.note_outlined,
            maxLines: 2,
            autoExpand: true,
            onFieldCreated: (field) => noteField = field,
            onChanged: (v) => _emitInfoPatch(note: v),
          ),
        ],
      ),
    );
  }
}