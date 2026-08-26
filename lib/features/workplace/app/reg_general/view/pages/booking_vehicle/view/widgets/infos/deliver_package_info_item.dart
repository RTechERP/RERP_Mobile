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

/// Mỗi dòng "Người giao n" (lấy hàng thương mại / Demo) — cùng UX với [ReceiverPackageInfoItem] nhưng field/nhãn riêng.
class DeliverPackageInfoItem extends StatefulWidget {
  const DeliverPackageInfoItem({
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
  State<DeliverPackageInfoItem> createState() =>
      _DeliverPackageInfoItemState();
}

class _DeliverPackageInfoItemState
    extends State<DeliverPackageInfoItem> {
  FormFieldState<String>? employeeSelectField;
  FormFieldState<String>? giverNameField;
  FormFieldState<String>? giverPhoneField;

  BookingVehiclePersonalItem? _selectedEmployee;

  bool get _isGiverFromEmployee => _selectedEmployee != null;

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
  void didUpdateWidget(covariant DeliverPackageInfoItem oldWidget) {
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
        widget.infoFieldValues['pickup_giver_employee_$i'] as String? ?? '';
    final nameVal =
        widget.infoFieldValues['pickup_giver_name_$i'] as String? ?? '';
    final phoneVal =
        widget.infoFieldValues['pickup_giver_phone_number_$i'] as String? ?? '';

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
        if (giverNameField?.value != nameVal) {
          giverNameField?.didChange(nameVal);
        }
        if (giverPhoneField?.value != phoneVal) {
          giverPhoneField?.didChange(phoneVal);
        }
      }
    }
  }

  void _syncFieldsToEmployee(BookingVehiclePersonalItem? employee) {
    final fullName = (employee?.fullName ?? '').trim();
    final phone = (employee?.sdtCaNhan ?? '').trim();

    employeeSelectField?.didChange(fullName);
    giverNameField?.didChange(fullName);
    giverPhoneField?.didChange(phone);
  }

  void _switchToManualGiverEntry() {
    setState(() => _selectedEmployee = null);
    employeeSelectField?.didChange('');
    giverNameField?.didChange('');
    giverPhoneField?.didChange('');
  }

  Future<void> _pickGiverEmployee() async {
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
          hadEmployee ? () => _switchToManualGiverEntry() : null,
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
        (widget.infoFieldValues['pickup_giver_name_$i'] as String?)?.trim() ?? '';
    final headerTitle =
        'Người giao: ${nameFromState.isNotEmpty ? nameFromState : "Chưa chọn"}';

    return Slidable(
      key: ValueKey('pickup_giver_row_${widget.index}_$gen'),
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
                        onTap: _pickGiverEmployee,
                        child: AbsorbPointer(
                          child: FormInputField(
                            nameForm: 'pickup_giver_employee_$i',
                            nameTextField: 'pickup_giver_employee_text_$i',
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
                        nameForm: 'pickup_giver_name_$i',
                        nameTextField: 'pickup_giver_name_text_$i',
                        label: 'Tên người giao',
                        onFieldCreated: (field) => giverNameField = field,
                        onChanged: (_) {
                          if (mounted) setState(() {});
                        },
                        enabled: !_isGiverFromEmployee,
                        readOnly: _isGiverFromEmployee,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập tên người giao',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormInputField(
                        icon: Icons.phone_outlined,
                        nameForm: 'pickup_giver_phone_number_$i',
                        nameTextField: 'pickup_giver_phone_number_text_$i',
                        label: 'SDT liên hệ',
                        onFieldCreated: (field) => giverPhoneField = field,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập SĐT liên hệ',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormInputField(
                        icon: Icons.description_outlined,
                        nameForm: 'pickup_package_name_$i',
                        nameTextField: 'pickup_package_name_text_$i',
                        label: 'Tên kiện hàng',
                        autoExpand: true,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập tên kiện hàng',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormInputField(
                        icon: Icons.crop_square_outlined,
                        nameForm: 'pickup_package_size_$i',
                        nameTextField: 'pickup_package_size_text_$i',
                        label: 'Kích thước (cm)',
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction
                            .newline,
                        autoExpand: true,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng nhập kích thước',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: FormInputField(
                              icon: Icons.monitor_weight_outlined,
                              nameForm: 'pickup_package_weight_$i',
                              nameTextField: 'pickup_package_weight_text_$i',
                              label: 'C.nặng (kg)',
                              keyboardType: TextInputType.text,
                              isRequired: true,
                              validator: FormBuilderValidators.required(
                                errorText: 'Vui lòng nhập cân nặng',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FormInputField(
                              icon: Icons.inventory_2_outlined,
                              nameForm: 'pickup_package_quantity_$i',
                              nameTextField: 'pickup_package_quantity_text_$i',
                              label: 'S.lượng',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      FormBuilderField<List<PlatformFile>>(
                        name: 'pickup_package_image_$i',
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
                      const SizedBox(height: 16),
                      FormInputField(
                        icon: Icons.note_outlined,
                        nameForm: 'note_pickup_package_$i',
                        nameTextField: 'note_pickup_package_text_$i',
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
