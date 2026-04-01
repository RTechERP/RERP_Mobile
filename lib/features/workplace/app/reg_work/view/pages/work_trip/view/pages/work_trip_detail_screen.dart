import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../data/datasource/models/work_trip_model.dart';

class WorkTripDetailScreen extends StatefulWidget {
  const WorkTripDetailScreen({super.key, this.item});

  final WorkTripItem? item;

  @override
  State<WorkTripDetailScreen> createState() =>
      _WorkTripDetailScreenState();
}

class _WorkTripDetailScreenState
    extends State<WorkTripDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  void _toggleEdit() => setState(() => _isEditing = true);

  void _cancelEdit() {
    _formKey.currentState?.reset();
    setState(() => _isEditing = false);
  }

  void _save() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(_formKey.currentState!.value.toString());
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn công tác'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.close : Icons.create_outlined,
            ),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== CONTENT =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// ===== THÔNG TIN CÔNG TÁC =====
                      FormCard(
                        title: 'Thông tin công tác',
                        child: Column(
                          children: [
                            /// NGÀY
                            _isEditing
                                ? FormBuilderDateTimePicker(
                              name: 'regwork_work_trip_edit_date',
                              inputType: InputType.date,
                              format:
                              DateFormat('dd/MM/yyyy'),
                              decoration:
                              formInputDecoration(
                                context,
                                label: 'Ngày',
                                icon: Icons
                                    .date_range_outlined,
                              ),
                            )
                                : const FormReadonlyField(
                              label: 'Ngày',
                              name: '27/01/2026',
                              icon: Icons
                                  .date_range_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// LOẠI CÔNG TÁC
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name: 'regwork_trip_work_edit_trip_type',
                              label: 'Loại công tác',
                              icon: Icons
                                  .category_outlined,
                              items: const [
                                // DropdownMenuItem(
                                //   value:
                                //   WorkTripType.day,
                                //   child: Text(
                                //       'Công tác ngày'),
                                // ),
                                // DropdownMenuItem(
                                //   value:
                                //   WorkTripType.night,
                                //   child: Text(
                                //       'Công tác đêm'),
                                // ),
                                // DropdownMenuItem(
                                //   value:
                                //   WorkTripType.near,
                                //   child: Text(
                                //       'Công tác gần'),
                                // ),
                                // DropdownMenuItem(
                                //   value:
                                //   WorkTripType.far,
                                //   child: Text(
                                //       'Công tác xa'),
                                // ),
                              ],
                            )
                                : const FormReadonlyField(
                              label: 'Loại công tác',
                              name:
                              'Công tác ngày (>30km)',
                              icon: Icons
                                  .category_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// PHÍ CÔNG TÁC
                            const FormReadonlyField(
                              label: 'Phí công tác',
                              name: '300.000',
                              icon: Icons
                                  .monetization_on_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// PHƯƠNG TIỆN
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name: 'vehicle',
                              label: 'Phương tiện',
                              icon: Icons
                                  .directions_car_outlined,
                              items: const [
                                DropdownMenuItem(
                                  value: 'car',
                                  child: Text('Ô tô'),
                                ),
                                DropdownMenuItem(
                                  value: 'motorbike',
                                  child:
                                  Text('Xe máy'),
                                ),
                                DropdownMenuItem(
                                  value: 'plane',
                                  child:
                                  Text('Máy bay'),
                                ),
                              ],
                            )
                                : const FormReadonlyField(
                              label: 'Phương tiện',
                              name: 'Ô tô',
                              icon: Icons
                                  .directions_car_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// PHÍ PHƯƠNG TIỆN
                            const FormReadonlyField(
                              label: 'Phí phương tiện',
                              name: '300.000',
                              icon: Icons
                                  .attach_money_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// XUẤT PHÁT SỚM
                            const FormReadonlyField(
                              label:
                              'Xuất phát trước 7h15',
                              name: 'Có',
                              icon: Icons.alarm,
                            ),

                            const SizedBox(height: 12),

                            /// PHÍ XUẤT PHÁT SỚM
                            const FormReadonlyField(
                              label: 'Phí',
                              name: '50.000',
                              icon:
                              Icons.payments_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// PHỤ CẤP ĂN TỐI
                            const FormReadonlyField(
                              label: 'Phụ cấp ăn tối',
                              name:
                              'Về VP sau 20h (35.000đ)',
                              icon:
                              Icons.restaurant_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// TỔNG
                            const FormReadonlyField(
                              label: 'Tổng chi phí',
                              name: '685.000',
                              icon: Icons
                                  .calculate_outlined,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== FILE =====
                      FormCard(
                        title: 'File bổ sung',
                        child: _isEditing
                            ? FormBuilderFilePicker(
                          name: 'attachment',
                          initialValue: const [],
                          maxFiles: 5,
                          decoration:
                          formInputDecoration(
                            context,
                            label: 'File',
                            icon: Icons
                                .attach_file_outlined,
                          ),
                        )
                            : const FormReadonlyField(
                          label: '',
                          name:
                          'cong_tac_ngoai_tinh.pdf',
                          icon: Icons
                              .attach_file_outlined,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'approver',
                          label: 'Người duyệt',
                          enabled: _isEditing,
                          icon: Icons
                              .supervisor_account_outlined,
                          items: const [
                            DropdownMenuItem(
                              value: 'manager',
                              child:
                              Text('Quản lý trực tiếp'),
                            ),
                            DropdownMenuItem(
                              value: 'hr',
                              child:
                              Text('Phòng nhân sự'),
                            ),
                            DropdownMenuItem(
                              value: 'director',
                              child:
                              Text('Ban giám đốc'),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: _isEditing
                            ? FormBuilderTextField(
                          name: 'reason',
                          maxLines: 4,
                          decoration:
                          formInputDecoration(
                            context,
                            label: 'Lý do',
                            icon: Icons
                                .note_alt_outlined,
                          ),
                        )
                            : const FormReadonlyField(
                          label: '',
                          name:
                          'Đi công tác hỗ trợ dự án',
                          icon: Icons
                              .note_alt_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== ACTION =====
              FormActions(
                mode: _isEditing
                    ? FormActionMode.edit
                    : FormActionMode.view,
                onCancel: _cancelEdit,
                onSave: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}