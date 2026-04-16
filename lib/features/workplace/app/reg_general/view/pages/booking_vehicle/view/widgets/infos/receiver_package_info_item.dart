import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/data/datasource/models/booking_vehicle_model.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/view/booking_vehicle_package_image_form.dart';
import 'package:rtc_erp/features/workplace/app/reg_general/view/pages/booking_vehicle/view/widgets/booking_vehicle_package_images_section.dart';

/// Mỗi dòng "Người nhận n" (expand/collapse): chọn NV / tên / SĐT + kiện hàng (giao hàng thương mại / demo).
class ReceiverPackageInfoItem extends StatefulWidget {
  const ReceiverPackageInfoItem({
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
  final bool isExpanded;
  final int totalCount;
  final List<BookingVehiclePersonalItem> employeeOptions;
  final Map<String, dynamic> infoFieldValues;
  final BookingVehiclePersonalItem? prefillEmployee;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  /// Dùng để buộc Slidable + child rebuild khi generation thay đổi (sau xoá dòng).
  final int generation;

  @override
  State<ReceiverPackageInfoItem> createState() =>
      _ReceiverPackageInfoItemState();
}

class _ReceiverPackageInfoItemState extends State<ReceiverPackageInfoItem> {
  FormFieldState<String>? employeeSelectField;
  FormFieldState<String>? receiverNameField;
  FormFieldState<String>? receiverPhoneField;

  BookingVehiclePersonalItem? _selectedEmployee;

  bool get _isReceiverFromEmployee => _selectedEmployee != null;

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
  void didUpdateWidget(covariant ReceiverPackageInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.prefillEmployee != oldWidget.prefillEmployee) {
      _selectedEmployee = widget.prefillEmployee;
    }
    if (widget.employeeOptions != oldWidget.employeeOptions ||
        widget.index != oldWidget.index ||
        widget.infoFieldValues != oldWidget.infoFieldValues) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _hydrateFromState();
      });
    }
  }

  void _hydrateFromState() {
    if (widget.infoFieldValues.isEmpty) {
      if (widget.prefillEmployee != null) {
        _syncFieldsToEmployee(_selectedEmployee);
      }
      return;
    }

    final i = widget.index;
    final empVal =
        widget.infoFieldValues['receiver_employee_$i'] as String? ?? '';
    final nameVal =
        widget.infoFieldValues['receiver_name_$i'] as String? ?? '';
    final phoneVal =
        widget.infoFieldValues['receiver_phone_number_$i'] as String? ?? '';

    if (empVal.isNotEmpty) {
      final options = widget.employeeOptions;
      BookingVehiclePersonalItem? matched;
      for (final o in options) {
        if ((o.fullName ?? '').trim() == empVal) {
          matched = o;
          break;
        }
      }
      if (matched != null) {
        setState(() => _selectedEmployee = matched);
        _syncFieldsToEmployee(matched);
      } else if (nameVal.isNotEmpty || phoneVal.isNotEmpty) {
        setState(() => _selectedEmployee = null);
        if (receiverNameField?.value != nameVal) {
          receiverNameField?.didChange(nameVal);
        }
        if (receiverPhoneField?.value != phoneVal) {
          receiverPhoneField?.didChange(phoneVal);
        }
      }
    }
  }

  void _syncFieldsToEmployee(BookingVehiclePersonalItem? employee) {
    final fullName = (employee?.fullName ?? '').trim();
    final phone = (employee?.sdtCaNhan ?? '').trim();

    employeeSelectField?.didChange(fullName);
    receiverNameField?.didChange(fullName);
    receiverPhoneField?.didChange(phone);
  }

  void _switchToManualReceiverEntry() {
    setState(() => _selectedEmployee = null);
    employeeSelectField?.didChange('');
    receiverNameField?.didChange('');
    receiverPhoneField?.didChange('');
  }

  Future<void> _pickReceiverEmployee() async {
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
      secondaryActionLabel:
          hadEmployee ? 'Nhập tay (bỏ chọn nhân viên)' : null,
      onSecondaryAction:
          hadEmployee ? () => _switchToManualReceiverEntry() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final showExpanded = widget.isExpanded;
    final collapsed = !showExpanded;
    final canDelete = widget.totalCount > 1;
    final i = widget.index;
    final gen = widget.generation;

    final nameFromState =
        (widget.infoFieldValues['receiver_name_$i'] as String?)?.trim() ?? '';
    final headerTitle =
        'Người nhận: ${nameFromState.isNotEmpty ? nameFromState : "Chưa chọn"}';

    return Slidable(
      key: ValueKey('commercial_receiver_${widget.index}_$gen'),
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
                      GestureDetector(
                        onTap: _pickReceiverEmployee,
                        child: AbsorbPointer(
                          child: FormInputField(
                            nameForm: 'receiver_employee_$i',
                            nameTextField: 'receiver_employee_text_$i',
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
                        icon: Icons.person_pin_outlined,
                        nameForm: 'receiver_name_$i',
                        nameTextField: 'receiver_name_text_$i',
                        label: 'Tên người nhận',
                        onFieldCreated: (field) => receiverNameField = field,
                        onChanged: (_) {
                          if (mounted) setState(() {});
                        },
                        enabled: !_isReceiverFromEmployee,
                        readOnly: _isReceiverFromEmployee,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập tên người nhận',
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormInputField(
                        icon: Icons.phone_outlined,
                        nameForm: 'receiver_phone_number_$i',
                        nameTextField: 'receiver_phone_number_text_$i',
                        label: 'SDT liên hệ',
                        onFieldCreated: (field) =>
                            receiverPhoneField = field,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập SĐT liên hệ',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormInputField(
                        icon: Icons.description_outlined,
                        nameForm: 'commercial_package_name_$i',
                        nameTextField: 'commercial_package_name_text_$i',
                        label: 'Tên kiện hàng',
                        autoExpand: true,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập tên kiện hàng',
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormBuilderField<List<PlatformFile>>(
                        name: 'commercial_package_image_$i',
                        builder: (field) {
                          final files =
                              field.value ?? const <PlatformFile>[];
                          return BookingVehiclePackageImagesSection(
                            files: files,
                            onAddPressed: () async {
                              final picked =
                                  await pickBookingVehiclePackageImagesFromGallery();
                              if (picked.isNotEmpty) {
                                field.didChange([...files, ...picked]);
                                setState(() {});
                              }
                            },
                            onRemoveAt: (index) {
                              final next = List<PlatformFile>.from(files)
                                ..removeAt(index);
                              field.didChange(next);
                              setState(() {});
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: FormInputField(
                              icon: Icons.crop_square_outlined,
                              nameForm: 'package_size_$i',
                              nameTextField: 'package_size_text_$i',
                              label: 'Kích thước (cm)',
                              keyboardType: TextInputType.number,
                              isRequired: true,
                              validator: FormBuilderValidators.required(
                                errorText: 'Vui lòng nhập kích thước',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FormInputField(
                              icon: Icons.monitor_weight_outlined,
                              nameForm: 'package_weight_$i',
                              nameTextField: 'package_weight_text_$i',
                              label: 'Cân nặng (kg)',
                              keyboardType: TextInputType.number,
                              isRequired: true,
                              validator: FormBuilderValidators.required(
                                errorText: 'Vui lòng nhập cân nặng',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      FormInputField(
                        icon: Icons.inventory_2_outlined,
                        nameForm: 'commercial_package_quantity_$i',
                        nameTextField:
                            'commercial_package_quantity_text_$i',
                        label: 'Số lượng kiện hàng',
                        keyboardType: TextInputType.number,
                        initialValue: '1',
                        isRequired: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Vui lòng nhập số lượng kiện hàng',
                          ),
                          FormBuilderValidators.numeric(
                            errorText: 'Số lượng phải là số',
                          ),
                        ]),
                      ),
                      const SizedBox(height: 8),
                      FormInputField(
                        icon: Icons.note_outlined,
                        nameForm: 'note_return_or_delivery_$i',
                        nameTextField:
                            'note_return_or_delivery_text_$i',
                        label: 'Ghi chú (nếu có)',
                        autoExpand: true,
                        initialValue: '[Hàng đang chuẩn bị]',
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
