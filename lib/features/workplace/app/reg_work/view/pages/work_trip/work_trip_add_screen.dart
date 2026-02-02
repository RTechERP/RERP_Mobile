import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';
import 'widgets/work_trip_fee_rule.dart';
import 'widgets/work_trip_type.dart';

class WorkTripAddScreen extends StatefulWidget {
  const WorkTripAddScreen({super.key});

  @override
  State<WorkTripAddScreen> createState() => _WorkTripAddScreenState();
}

class _WorkTripAddScreenState extends State<WorkTripAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// ===== helpers =====
  void _recalculateTotal() {
    final form = _formKey.currentState;
    if (form == null) return;

    int getInt(String name) =>
        (form.fields[name]?.value as num?)?.toInt() ?? 0;

    final tripFee = getInt('trip_fee');
    final vehicleFee = getInt('vehicle_fee');
    final earlyFee = getInt('early_depart_fee');

    final dinnerRaw =
        form.fields['dinner_allowance']?.value as int? ?? 0;

    /// ✅ LOGIC MỚI:
    /// - 0  → 0
    /// - còn lại → 35.000
    final dinnerFee = dinnerRaw == 0 ? 0 : 35000;

    final total =
        tripFee + vehicleFee + earlyFee + dinnerFee;

    form.fields['total_fee']?.didChange(total);
  }
  void _onTripTypeChanged(String? value) {
    final form = _formKey.currentState;
    if (form == null) return;

    final fee = tripFeeByType(value);

    form.fields['trip_fee']?.didChange(fee);

    /// nếu phụ cấp ăn tối = "theo loại công tác"
    final dinnerType = form.fields['dinner_type']?.value;
    if (dinnerType == 'by_trip') {
      form.fields['dinner_allowance']?.didChange(fee);
    }

    _recalculateTotal();
  }

  void _onVehicleSelected(String vehicle) {
    final form = _formKey.currentState;
    if (form == null) return;

    final fee = switch (vehicle) {
      'car' => 300000,
      'motorbike' => 150000,
      'plane' => 1200000,
      _ => 0,
    };

    form.fields['vehicle']?.didChange(vehicle);
    form.fields['vehicle_fee']?.didChange(fee);
    _recalculateTotal();
  }

  Future<void> _showVehicleDialog() async {
    final vehicle = await showDialog<String>(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('Chọn phương tiện'),
        children: [
          SimpleDialogOption(
            child: const Text('Ô tô'),
            onPressed: () => Navigator.pop(context, 'car'),
          ),
          SimpleDialogOption(
            child: const Text('Xe máy'),
            onPressed: () => Navigator.pop(context, 'motorbike'),
          ),
          SimpleDialogOption(
            child: const Text('Máy bay'),
            onPressed: () => Navigator.pop(context, 'plane'),
          ),
        ],
      ),
    );

    if (vehicle != null) {
      _onVehicleSelected(vehicle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn công tác'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [



                      /// ===== THÔNG TIN CÔNG TÁC =====
                      FormCard(
                        title: 'Thông tin công tác',
                        child: Column(
                          children: [ FormDateTimePicker(
                            name: 'regwork_work_trip_add_date',
                            label: 'Ngày',
                            icon: Icons.date_range_outlined,
                            inputType: InputType.date,
                            format: DateFormat('dd/MM/yyyy'),
                          ),

                            const SizedBox(height: 12),
                            FormTypeDropDown<String>(
                              name: 'trip_type',
                              label: 'Loại công tác',
                              icon: Icons.category_outlined,
                              onChanged: _onTripTypeChanged,
                              items: const [
                                DropdownMenuItem(
                                  value: WorkTripType.day,
                                  child: Text('Công tác ngày (>30km/chiều)'),
                                ),
                                DropdownMenuItem(
                                  value: WorkTripType.night,
                                  child: Text('Công tác đêm (Ở lại qua đêm)'),
                                ),
                                DropdownMenuItem(
                                  value: WorkTripType.near,
                                  child: Text('Công tác gần (10–30km/chiều)'),
                                ),
                                DropdownMenuItem(
                                  value: WorkTripType.far,
                                  child: Text('Công tác xa (>200km/chiều)'),
                                ),
                                DropdownMenuItem(
                                  value: WorkTripType.abroad,
                                  child: Text('Công tác nước ngoài'),
                                ),
                                DropdownMenuItem(
                                  value: WorkTripType.under10km,
                                  child: Text('Công tác < 10km/chiều'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Phí công tác
                            const FormReadonlyField(
                              name: 'trip_fee',
                              label: 'Phí công tác',
                              icon: Icons.monetization_on_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// Phương tiện
                            GestureDetector(
                              onTap: _showVehicleDialog,
                              child: const FormReadonlyField(
                                name: 'vehicle',
                                label: 'Phương tiện',
                                icon: Icons.directions_car_outlined,
                                hintText: 'Chọn phương tiện',
                              ),
                            ),

                            const SizedBox(height: 12),

                            /// Phí phương tiện
                            const FormReadonlyField(
                              name: 'vehicle_fee',
                              label: 'Phí phương tiện',
                              icon: Icons.attach_money_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// Check-in
                            FormCheckbox(
                              name: 'checkin',
                              title: const Text('Chấm công tại công ty'),
                            ),

                            const SizedBox(height: 12),

                            /// Xuất phát trước 7h15
                            Row(
                              children: [
                                Expanded(
                                  child: FormCheckbox(
                                    name: 'early_depart',
                                    title:
                                    const Text('Xuất phát trước 7h15'),
                                    onChanged: (v) {
                                      final fee = v == true ? 50000 : 0;
                                      _formKey.currentState
                                          ?.fields['early_depart_fee']
                                          ?.didChange(fee);
                                      _recalculateTotal();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: FormReadonlyField(
                                    name: 'early_depart_fee',
                                    label: 'Phí',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Phụ cấp ăn tối
                            FormTypeDropDown<int>(
                              name: 'dinner_allowance',
                              label: 'Phụ cấp ăn tối',
                              icon: Icons.restaurant_outlined,
                              onChanged: (_) => _recalculateTotal(),
                              items: const [
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text('Không có'),
                                ),
                                DropdownMenuItem(
                                  value: 35000,
                                  child: Text('Về VP sau 20h'),
                                ),
                                DropdownMenuItem(
                                  value: -1,
                                  child: Text('Theo loại công tác'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Tổng chi phí
                            const FormReadonlyField(
                              name: 'total_fee',
                              label: 'Tổng chi phí',
                              icon: Icons.calculate_outlined,
                            ),
                            const SizedBox(height: 20),

                            /// File bổ sung
                            FormBuilderFilePicker(
                              name: 'regwork_overtime_add_attachment',
                              initialValue: const [],
                              decoration: formInputDecoration(
                                context,
                                label: 'File bổ sung',
                                icon: Icons.attach_file_outlined,
                              ),
                              maxFiles: 5,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI KIỂM DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'regwork_overtime_add_approver',
                          label: 'Người duyệt',
                          icon: Icons.supervisor_account_outlined,
                          items: const [
                            DropdownMenuItem(
                              value: 'manager',
                              child: Text('Quản lý trực tiếp'),
                            ),
                            DropdownMenuItem(
                              value: 'hr',
                              child: Text('Phòng nhân sự'),
                            ),
                            DropdownMenuItem(
                              value: 'director',
                              child: Text('Ban giám đốc'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),




                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: FormInputField(
                          nameForm: 'regwork',
                          nameTextField: 'reason',
                          label: '',
                          icon: Icons.note_alt_outlined,
                          maxLines: 4,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== GHI CHÚ =====
                      FormCard(
                        title: 'Ghi chú',
                        child: FormInputField(
                          nameForm: 'regwork',
                          nameTextField: 'note',
                          label: '',
                          icon: Icons.edit_note_outlined,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== SUBMIT =====
              FormActions(
                mode: FormActionMode.add,
                onSubmit: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_formKey.currentState!.value.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}