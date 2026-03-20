import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/booking_vehicle_model.dart';

/// Mỗi dòng "Người nhận n" (expand/collapse) gồm cả:
/// - Chọn nhân viên / Tên / SĐT liên hệ
/// - Thông tin kiện hàng
class CommercialReceiverPackageInfoItem extends StatefulWidget {
  const CommercialReceiverPackageInfoItem({
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
  final bool isExpanded;
  final int totalCount;
  final List<BookingVehiclePersonalItem> employeeOptions;
  final BookingVehiclePersonalItem? prefillEmployee;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;

  @override
  State<CommercialReceiverPackageInfoItem> createState() =>
      _CommercialReceiverPackageInfoItemState();
}

class _CommercialReceiverPackageInfoItemState
    extends State<CommercialReceiverPackageInfoItem> {
  FormFieldState<String>? employeeSelectField;
  FormFieldState<String>? receiverNameField;
  FormFieldState<String>? receiverPhoneField;

  BookingVehiclePersonalItem? _selectedEmployee;

  bool get _isReceiverFromEmployee =>
      _selectedEmployee != null &&
      (_selectedEmployee?.fullName ?? '').trim().isNotEmpty;

  final List<String> _allowedImageExtensions = const ['png', 'jpeg', 'jpg'];

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
  void didUpdateWidget(covariant CommercialReceiverPackageInfoItem oldWidget) {
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
    final fullName = (employee?.fullName ?? '').trim();
    final phone = (employee?.sdtCaNhan ?? '').trim();

    employeeSelectField?.didChange(fullName);
    receiverNameField?.didChange(fullName);
    receiverPhoneField?.didChange(phone);
  }

  Future<void> _pickReceiverEmployee() async {
    final items = widget.employeeOptions;

    await openSelectBottomSheet<BookingVehiclePersonalItem>(
      context: context,
      title: 'Chọn nhân viên',
      items: items,
      displayText: (v) => '${v.code ?? ''} - ${v.fullName ?? ''}',
      onSelected: (item) {
        setState(() => _selectedEmployee = item);
        _syncFieldsToEmployee(item); // sync ngay để UI cập nhật tức thì
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showExpanded = widget.isExpanded;
    final canDelete = widget.totalCount > 1;
    final fullName = (_selectedEmployee?.fullName ?? '').trim();
    final headerTitle =
        'Người nhận: ${fullName.isNotEmpty ? fullName : "Chưa chọn"}';

    return Slidable(
      key: ValueKey('commercial_receiver_${widget.index}'),
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

          final i = widget.index;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: showExpanded ? 16 : 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(showExpanded ? 16 : 12),
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
                  child: showExpanded
                      ? Column(
                          children: [
                            const SizedBox(height: 8),

                            /// ===== NGƯỜI NHẬN =====
                            GestureDetector(
                              onTap: _pickReceiverEmployee,
                              child: AbsorbPointer(
                                child: FormInputField(
                                  nameForm: 'receiver_employee_$i',
                                  nameTextField:
                                      'receiver_employee_text_$i',
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
                              enabled: !_isReceiverFromEmployee,
                              readOnly: _isReceiverFromEmployee,
                              onFieldCreated: (field) =>
                                  receiverNameField = field,
                            ),
                            const SizedBox(height: 8),

                            FormInputField(
                              icon: Icons.phone_outlined,
                              nameForm: 'receiver_phone_number_$i',
                              nameTextField:
                                  'receiver_phone_number_text_$i',
                              label: 'SDT liên hệ',
                              enabled: !_isReceiverFromEmployee,
                              readOnly: _isReceiverFromEmployee,
                              onFieldCreated: (field) =>
                                  receiverPhoneField = field,
                            ),

                            const SizedBox(height: 16),

                            /// ===== KIỆN HÀNG =====
                            FormInputField(
                              icon: Icons.description_outlined,
                              nameForm: 'commercial_package_name_$i',
                              nameTextField:
                                  'commercial_package_name_text_$i',
                              label: 'Tên kiện hàng',
                              maxLines: 3,
                            ),
                            const SizedBox(height: 8),

                            FormBuilderField<List<PlatformFile>>(
                              name: 'commercial_package_image_$i',
                              builder: (field) {
                                final files =
                                    field.value ?? const <PlatformFile>[];
                                final name =
                                    files.isNotEmpty ? files.first.name : '';

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Icon(
                                        Icons.attach_file_outlined,
                                        color: AppColors.primaryERP,
                                      ),
                                      title: const Text(
                                        'Ảnh kiện hàng (png/jpeg)',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      trailing: const Icon(Icons.upload_file),
                                      onTap: () async {
                                        final result = await FilePicker
                                            .platform
                                            .pickFiles(
                                          allowMultiple: false,
                                          allowedExtensions:
                                              _allowedImageExtensions,
                                          type: FileType.custom,
                                        );

                                        if (result != null &&
                                            result.files.isNotEmpty) {
                                          field.didChange(result.files);
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    if (name.trim().isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          bottom: 8,
                                        ),
                                        child: Text(
                                          name,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                  ],
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
                            ),
                            const SizedBox(height: 8),

                            FormInputField(
                              icon: Icons.note_outlined,
                              nameForm: 'note_return_or_delivery_$i',
                              nameTextField:
                                  'note_return_or_delivery_text_$i',
                              label: 'Ghi chú (nếu có)',
                              maxLines: 3,
                              initialValue: '[Hàng đang chuẩn bị]',
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

