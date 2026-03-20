import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';

import '../../data/datasource/models/booking_vehicle_model.dart';

/// Mỗi dòng "nhân viên n" (expand/collapse) cho form "Người đi".
class PassengerGoInfoItem extends StatefulWidget {
  const PassengerGoInfoItem({
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
  State<PassengerGoInfoItem> createState() =>
      _PassengerGoInfoItemState();
}

class _PassengerGoInfoItemState
    extends State<PassengerGoInfoItem> {
  FormFieldState<String>? employeeSelectField;
  FormFieldState<String>? departmentField;
  FormFieldState<String>? employeeCodeField;
  FormFieldState<String>? employeeNameField;
  FormFieldState<String>? contactPhoneField;

  BookingVehiclePersonalItem? _selectedEmployee;

  @override
  void initState() {
    super.initState();
    _selectedEmployee = widget.prefillEmployee;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _syncFieldsToEmployee(_selectedEmployee);
    });
  }

  @override
  void didUpdateWidget(covariant PassengerGoInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _syncFieldsToEmployee(_selectedEmployee);
      });
    }
  }

  void _syncFieldsToEmployee(BookingVehiclePersonalItem? employee) {
    // Khi chưa có dữ liệu thì hiển thị chuỗi rỗng.
    employeeSelectField?.didChange(employee?.fullName ?? '');
    departmentField?.didChange(employee?.departmentName ?? '');
    employeeCodeField?.didChange(employee?.code ?? '');
    employeeNameField?.didChange(employee?.fullName ?? '');
    contactPhoneField?.didChange(employee?.sdtCaNhan ?? '');
  }

  Future<void> _pickEmployee() async {
    final items = widget.employeeOptions;

    await openSelectBottomSheet<BookingVehiclePersonalItem>(
      context: context,
      title: 'Chọn nhân viên',
      items: items,
      displayText: (v) => '${v.code ?? ''} - ${v.fullName ?? ''}',
      onSelected: (item) {
        setState(() {
          _selectedEmployee = item;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _syncFieldsToEmployee(item);
        });
      },
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
          final fullName = (_selectedEmployee?.fullName ?? '').trim();
          final headerTitle =
              'Người đi: ${fullName.isNotEmpty ? fullName : 'Chưa chọn'}';

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
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: collapsed
                      ? const SizedBox.shrink()
                      : Column(
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

                            /// Phòng ban (disable)
                            FormInputField(
                              nameForm:
                                  'passenger_department_$employeeIndex',
                              nameTextField:
                                  'passenger_department_text_$employeeIndex',
                              label: 'Phòng ban (nếu có)',
                              icon: Icons.apartment_outlined,
                              enabled: false,
                              readOnly: true,
                              onFieldCreated: (field) => departmentField =
                                  field,
                            ),
                            const SizedBox(height: 8),

                            /// Mã người đi (disable)
                            FormInputField(
                              nameForm: 'passenger_code_$employeeIndex',
                              nameTextField:
                                  'passenger_code_text_$employeeIndex',
                              label: 'Mã người đi (nếu có)',
                              icon: Icons.assignment_ind_outlined,
                              enabled: false,
                              readOnly: true,
                              onFieldCreated: (field) => employeeCodeField =
                                  field,
                            ),
                            const SizedBox(height: 8),

                            /// Tên người đi (disable)
                            FormInputField(
                              nameForm:
                                  'passenger_full_name_$employeeIndex',
                              nameTextField:
                                  'passenger_full_name_text_$employeeIndex',
                              label: 'Tên người đi (disable theo API)',
                              icon: Icons.person_pin_outlined,
                              enabled: false,
                              readOnly: true,
                              onFieldCreated: (field) =>
                                  employeeNameField = field,
                            ),
                            const SizedBox(height: 8),

                            /// SĐT liên hệ (disable)
                            FormInputField(
                              nameForm:
                                  'passenger_contact_phone_$employeeIndex',
                              nameTextField:
                                  'passenger_contact_phone_text_$employeeIndex',
                              label: 'SĐT liên hệ (disable theo API)',
                              icon: Icons.phone_outlined,
                              readOnly: true,
                              onFieldCreated: (field) =>
                                  contactPhoneField = field,
                            ),
                            const SizedBox(height: 8),

                            /// Note
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

