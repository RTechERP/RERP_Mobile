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
    this.onRemove,
  });

  /// Index dòng (0 = slip đầu tiên = currentUser).
  final int index;

  /// Danh sách Employee có thể pick.
  final List<EmployeeFilterItem> employeeOptions;

  /// Source-of-truth cho dữ liệu dòng: parent cung cấp
  /// `Map<String, dynamic>` với key `roommate_*_$i` và `roommate_*_text_$i`.
  final Map<String, dynamic> infoFieldValues;

  /// Prefill Employee (currentUser cho dòng 0).
  final EmployeeFilterItem? prefillEmployee;

  /// Callback mỗi khi widget muốn parent sync dữ liệu mới vào infoFieldValues
  /// (sau khi chọn Employee hoặc nhập tay).
  final ValueChanged<Map<String, dynamic>> onChanged;

  /// Callback yêu cầu parent xoá slip này (chỉ gọi khi index > 0).
  final VoidCallback? onRemove;

  @override
  State<RoommateInfoItem> createState() => _RoommateInfoItemState();
}

class _RoommateInfoItemState extends State<RoommateInfoItem> {
  // FormFieldState handles — dùng cho validate / focus khi cần.
  FormFieldState<String>? nameField;
  FormFieldState<String>? departmentField;
  FormFieldState<String>? codeField;
  FormFieldState<String>? roommateNameField;
  FormFieldState<String>? phoneField;
  FormFieldState<String>? noteField;

  // Controllers cho 5 field readonly (Chọn NV / Phòng ban / Mã NV / Tên
  // người ở cùng / SĐT). Dùng external controller để khi prefillEmployee
  // thay đổi (vd: _loadCurrentUser vừa resolve currentUser), set controller.text
  // → field hiển thị value ngay lập tức, không phụ thuộc FormFieldState handle
  // có bind hay chưa.
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _departmentCtrl = TextEditingController();
  final TextEditingController _codeCtrl = TextEditingController();
  final TextEditingController _roommateNameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();

  EmployeeFilterItem? _selectedEmployee;

  bool get _isFromEmployee => _selectedEmployee != null;

  /// Slip 0 = currentUser: parent đã resolve xong và đẩy dữ liệu
  /// (fullName/code/phone/department) vào infoFieldValues. Kể cả khi không
  /// match được EmployeeFilterItem nào từ API, data vẫn đã có nên 4 field
  /// readonly phải hiện xám — dùng `prefillEmployee` làm tín hiệu sẽ bị
  /// miss và field trắng/còn thao tác được.
  bool _isPrefilled = false;

  /// Đặt = true sau khi hết timeout chờ resolve currentUser (slip 0) mà
  /// vẫn chưa có data. Cho phép user gõ tay thay vì mãi màu xám
  /// nếu `_loadCurrentUser` fail.
  bool _resolveTimedOut = false;

  /// Slip 0 đang chờ resolve currentUser. Trong khoảng thời gian chờ (vài
  /// chục ms đến vài trăm ms tuỳ cache), field phải show ở trạng thái disabled
  /// (màu xám) như khi đã có data — tránh flash trắng (enabled → disabled).
  /// Sau 500ms nếu vẫn chưa có data → fallback enable để user gõ tay.
  bool get _isResolvingCurrentUser =>
      widget.index == 0 && !_isPrefilled && !_resolveTimedOut;

  @override
  void initState() {
    super.initState();
    _selectedEmployee = widget.prefillEmployee;
    // Nếu có prefill, hydrate controller ngay để lần build đầu tiên đã có
    // value hiển thị (không cần đợi didUpdateWidget post-frame).
    if (_selectedEmployee != null) {
      _applyEmployeeToControllers(_selectedEmployee);
    } else if (_isPrefilledByState) {
      // Trường hợp detail screen: parent đẩy thẳng fullName/code/department/
      // phone vào infoFieldValues (không qua EmployeeFilterItem). Hydrate
      // controller từ state luôn để lần build đầu đã có value (không cần
      // đợi post-frame + FormFieldState bind).
      _applyStateToControllers();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // Parent có thể đã push data vào infoFieldValues trước frame đầu
      // (currentUser cache) → coi như đã prefill để field xám luôn.
      if (_isPrefilledByState) setState(() => _isPrefilled = true);
      _hydrateFromState();
    });
    // Slip 0: fallback enable sau 500ms nếu parent vẫn chưa resolve xong
    // (tránh mãi màu xám nếu _loadCurrentUser fail/treo).
    if (widget.index == 0 && _selectedEmployee == null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;
        if (!_isPrefilledByState) {
          setState(() => _resolveTimedOut = true);
        }
      });
    }
  }

  /// Parent đã có sẵn data cho dòng này trong infoFieldValues.
  bool get _isPrefilledByState {
    final i = widget.index;
    final code = widget.infoFieldValues['roommate_code_$i'];
    final name = widget.infoFieldValues['roommate_full_name_$i'];
    return (code is String && code.trim().isNotEmpty) ||
        (name is String && name.trim().isNotEmpty);
  }

  /// Hydrate 5 controller từ `infoFieldValues` (dùng cho chế độ readOnly —
  /// detail screen, nơi parent không cung cấp `EmployeeFilterItem`).
  void _applyStateToControllers() {
    final i = widget.index;
    final name =
        (widget.infoFieldValues['roommate_full_name_$i'] as String?)?.trim() ??
            '';
    final dept =
        (widget.infoFieldValues['roommate_department_$i'] as String?)?.trim() ??
            '';
    final code =
        (widget.infoFieldValues['roommate_code_$i'] as String?)?.trim() ?? '';
    final roommateName = (widget
                .infoFieldValues['roommate_roommate_name_$i'] as String?)
            ?.trim() ??
        name;
    final phone =
        (widget.infoFieldValues['roommate_phone_$i'] as String?)?.trim() ?? '';

    _nameCtrl.text = name;
    _departmentCtrl.text = dept;
    _codeCtrl.text = code;
    _roommateNameCtrl.text = roommateName;
    _phoneCtrl.text = phone;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _departmentCtrl.dispose();
    _codeCtrl.dispose();
    _roommateNameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RoommateInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
      // Sync controller + FormBuilder value xuống field. Cách này đảm bảo
      // ngay cả field "Tên người ở cùng" (cùng hiển thị fullName từ Employee)
      // cũng được fill khi parent resolve currentUser cho slip 0.
      _applyEmployeeToControllers(_selectedEmployee);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _syncFieldsToEmployee(_selectedEmployee);
      });
    }
    // Parent vừa push data cho dòng này (currentUser resolve xong, hoặc user
    // bấm FAB thêm người mới) → chuyển sang trạng thái readonly/xám.
    if (!_isPrefilled && _isPrefilledByState) {
      setState(() {
        _isPrefilled = true;
        _resolveTimedOut = false;
      });
    }
  }

  void _applyEmployeeToControllers(EmployeeFilterItem? e) {
    _nameCtrl.text = e?.fullName ?? '';
    _departmentCtrl.text = e?.departmentName ?? '';
    _codeCtrl.text = e?.code ?? e?.id?.toString() ?? '';
    _roommateNameCtrl.text = e?.fullName ?? '';
    _phoneCtrl.text = e?.sdtCaNhan ?? '';
  }

  void _hydrateFromState() {
    final i = widget.index;
    final codeVal = widget.infoFieldValues['roommate_code_$i'] as String?;
    final nameVal =
        widget.infoFieldValues['roommate_full_name_$i'] as String?;
    // Field "Tên người ở cùng" có key riêng — ưu tiên đọc key này, fallback về
    // fullName khi map chưa có (trường hợp parent chỉ patch full_name).
    final roommateNameVal =
        widget.infoFieldValues['roommate_roommate_name_$i'] as String?;
    final roommateNameTrim = ((roommateNameVal ?? nameVal) ?? '').trim();

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
        roommateNameField?.value?.trim() != roommateNameTrim) {
      roommateNameField?.didChange(roommateNameTrim);
    }
    if (phoneVal != null && phoneVal.trim().isNotEmpty) {
      phoneField?.didChange(phoneVal.trim());
    }
  }

  void _syncFieldsToEmployee(EmployeeFilterItem? employee) {
    // 1) Cập nhật controller (source-of-truth cho display khi controller != null).
    _applyEmployeeToControllers(employee);
    // 2) Đồng thời đẩy vào FormBuilder value qua FormFieldState handle.
    nameField?.didChange(employee?.fullName ?? '');
    departmentField?.didChange(employee?.departmentName ?? '');
    codeField?.didChange(employee?.code ?? employee?.id?.toString() ?? '');
    roommateNameField?.didChange(employee?.fullName ?? '');
    phoneField?.didChange(employee?.sdtCaNhan ?? '');
  }

  void _emitInfoPatch({
    int? employeeId,
    String? fullName,
    String? employeeCode,
    String? department,
    String? phone,
    String? note,
  }) {
    final i = widget.index;
    final patch = <String, dynamic>{};
    if (employeeId != null) {
      patch['roommate_employee_id_$i'] = employeeId;
    }
    if (fullName != null) {
      patch['roommate_full_name_$i'] = fullName;
      patch['roommate_full_name_text_$i'] = fullName;
      // Field "Tên người ở cùng" dùng key riêng — parent đọc map này để hydrate
      // lại khi rebuild, nên phải patch cả 2 key cùng lúc.
      patch['roommate_roommate_name_$i'] = fullName;
      patch['roommate_roommate_name_text_$i'] = fullName;
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
    // Bỏ chọn nhân viên → 4 field readonly phải trở lại trạng thái nhập tay
    // (trắng, editable) và xoá sạch data cũ.
    setState(() {
      _selectedEmployee = null;
      _isPrefilled = false;
    });
    _applyEmployeeToControllers(null);
    nameField?.didChange('');
    departmentField?.didChange('');
    codeField?.didChange('');
    roommateNameField?.didChange('');
    phoneField?.didChange('');
    // Báo cho parent biết slip này không còn gắn với Employee nào.
    _emitInfoPatch(employeeId: 0);
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
        // Chọn nhân viên → 4 field readonly chuyển sang xám/không thao tác được.
        setState(() {
          _selectedEmployee = item;
          _isPrefilled = true;
        });
        _syncFieldsToEmployee(item);
        // Đẩy info xuống parent để hydrate khi rebuild + resolve EmployeeID.
        _emitInfoPatch(
          employeeId: item.id ?? 0,
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

    // Khi slip 0 đang chờ resolve currentUser, coi như đã có data
    // (chỉ là tạm thời) để field hiển thị đúng trạng thái disabled ngay từ
    // frame đầu — tránh flash trắng (enabled → disabled) gây khó chịu.
    final looksFromEmployee = _isFromEmployee || _isPrefilled || _isResolvingCurrentUser;

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
              // Nút xoá slip — chỉ hiện cho các dòng >= 1 (parent truyền
              // onRemove = null cho slip 0 = currentUser).
              if (widget.onRemove != null)
                IconButton(
                  onPressed: widget.onRemove,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                    size: 22,
                  ),
                  tooltip: 'Xoá người ở',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
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
                controller: _nameCtrl,
                onFieldCreated: (field) => nameField = field,
                onChanged: (v) {
                  // Đồng bộ sang field "Tên người ở cùng" — vì khi chọn nhân
                  // viên, cả 2 hiển thị cùng fullName. onChanged chỉ fire khi
                  // user thao tác (gõ tay), nhưng vẫn đảm bảo flow nhập tay
                  // vẫn khớp giữa 2 field.
                  final vStr = v ?? '';
                  _roommateNameCtrl.text = vStr;
                  roommateNameField?.didChange(vStr);
                  _emitInfoPatch(fullName: vStr);
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
            controller: _departmentCtrl,
            onFieldCreated: (field) => departmentField = field,
            enabled: !looksFromEmployee,
            readOnly: looksFromEmployee,
            onChanged: (v) => _emitInfoPatch(department: v),
          ),
          const SizedBox(height: 12),

          // Mã nhân viên — readonly khi đã chọn nhân viên.
          FormInputField(
            nameForm: 'roommate_code_$i',
            nameTextField: 'roommate_code_text_$i',
            label: 'Mã nhân viên',
            icon: Icons.badge_outlined,
            controller: _codeCtrl,
            onFieldCreated: (field) => codeField = field,
            enabled: !looksFromEmployee,
            readOnly: looksFromEmployee,
            onChanged: (v) => _emitInfoPatch(employeeCode: v),
          ),
          const SizedBox(height: 12),

          // Tên người ở cùng — readonly khi đã chọn nhân viên.
          FormInputField(
            nameForm: 'roommate_roommate_name_$i',
            nameTextField: 'roommate_roommate_name_text_$i',
            label: 'Tên người ở cùng',
            icon: Icons.group_outlined,
            controller: _roommateNameCtrl,
            isRequired: true,
            onFieldCreated: (field) => roommateNameField = field,
            enabled: !looksFromEmployee,
            readOnly: looksFromEmployee,
            onChanged: (v) => _emitInfoPatch(fullName: v),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Vui lòng nhập tên người ở cùng';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // SĐT liên hệ — luôn enable.
          FormInputField(
            nameForm: 'roommate_phone_$i',
            nameTextField: 'roommate_phone_text_$i',
            label: 'SĐT liên hệ',
            icon: Icons.phone_outlined,
            controller: _phoneCtrl,
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
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            onFieldCreated: (field) => noteField = field,
            onChanged: (v) => _emitInfoPatch(note: v),
          ),
        ],
      ),
    );
  }
}