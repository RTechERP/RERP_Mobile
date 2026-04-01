import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

class OvernightAddScreen extends StatefulWidget {
  const OvernightAddScreen({super.key});

  @override
  State<OvernightAddScreen> createState() =>
      _OvernightAddScreenState();
}

class _OvernightAddScreenState
    extends State<OvernightAddScreen> {

  bool _dateSelected = false;
  final _formKey = GlobalKey<FormBuilderState>();

  double _maxBreakHours = 0;
  void _recalculateTotalHours() {
    final form = _formKey.currentState;
    if (form == null) return;

    final start = form.fields['overnight_start']?.value as DateTime?;
    final end   = form.fields['overnight_end']?.value as DateTime?;
    final breakHours =
        (form.fields['break_hours']?.value as double?) ?? 0;

    if (start == null || end == null) return;

    final rawHours = end.difference(start).inMinutes / 60;

    setState(() {
      _maxBreakHours = rawHours.clamp(0, rawHours);
    });

    final total = (rawHours - breakHours).clamp(0, rawHours);

    form.fields['total_hours']?.didChange(total);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn qua đêm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== SCROLL =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// ===== THÔNG TIN QUA ĐÊM =====
                      FormCard(
                        title: 'Thông tin ca qua đêm',
                        child: Column(
                          children: [
                            /// CA HIỆN TẠI
                            FormReadonlyField(
                              name: 'current_date',
                              label: 'Ngày',
                              initialValue: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                              icon: Icons.access_time_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// NGÀY
                            /// ===== NGÀY QUA ĐÊM =====
                            FormBuilderDateTimePicker(
                              name: 'overnight_date',
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'), // ✅ FIX FORMAT
                              decoration: formInputDecoration(
                                context,
                                label: 'Ca hiện tại',
                                icon: Icons.date_range_outlined,
                              ),
                              onChanged: (date) {
                                if (date == null) return;

                                final start = DateTime(date.year, date.month, date.day, 20, 0);
                                final end   = DateTime(date.year, date.month, date.day, 23, 0);

                                setState(() => _dateSelected = true);

                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  _formKey.currentState?.fields['overnight_start']?.didChange(start);
                                  _formKey.currentState?.fields['overnight_end']?.didChange(end);
                                  _recalculateTotalHours();
                                });
                              },
                            ),

                            const SizedBox(height: 12),

                            /// BẮT ĐẦU - KẾT THÚC
                            if (_dateSelected) ...[
                              const SizedBox(height: 12),

                              Row(
                                children: [
                                  Expanded(
                                    child: FormBuilderDateTimePicker(
                                      name: 'overnight_start',
                                      inputType: InputType.time,
                                      format: DateFormat('HH:mm'),
                                      decoration: formInputDecoration(
                                        context,
                                        label: 'Thời gian bắt đầu',
                                        icon: Icons.schedule_outlined,
                                      ),
                                      onChanged: (_) => _recalculateTotalHours(),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: FormBuilderDateTimePicker(
                                      name: 'overnight_end',
                                      inputType: InputType.time,
                                      format: DateFormat('HH:mm'),
                                      decoration: formInputDecoration(
                                        context,
                                        label: 'Thời gian kết thúc',
                                        icon: Icons.schedule_outlined,
                                      ),
                                      onChanged: (_) => _recalculateTotalHours(),
                                    ),
                                  ),
                                ],
                              ),
                            ],

                            const SizedBox(height: 12),

                            /// GIỜ NGHỈ
                            FormBuilderSlider(
                              name: 'break_hours',
                              initialValue: 0,
                              min: 0,
                              max: _maxBreakHours, // = tổng giờ làm
                              divisions: _maxBreakHours > 0
                                  ? (_maxBreakHours * 2).round()
                                  : null,
                              decoration: const InputDecoration(
                                labelText: 'Giờ nghỉ giữa giờ',
                                border: InputBorder.none,
                              ),
                              displayValues: DisplayValues.current,
                              valueTransformer: (value) => value ?? 0,
                              onChanged: (value) {
                                _recalculateTotalHours();
                              },
                            ),

                            const SizedBox(height: 12),

                            /// TỔNG GIỜ
                            const FormReadonlyField(
                              name: 'total_hours',
                              label: 'Tổng số giờ',
                              icon: Icons
                                  .calculate_outlined,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== ĐỊA ĐIỂM =====
                      FormCard(
                        title: 'Địa điểm',
                        child: FormInputField(
                          nameForm: 'overnight',
                          nameTextField: 'location',
                          label: '',
                          icon: Icons.place_outlined,
                          maxLines: 2,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== GHI CHÚ =====
                      FormCard(
                        title: 'Ghi chú',
                        child: FormInputField(
                          nameForm: 'overnight',
                          nameTextField: 'note',
                          label: '',
                          icon: Icons.note_alt_outlined,
                          maxLines: 3,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'approver',
                          label: 'Người duyệt',
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
                    ],
                  ),
                ),
              ),

              /// ===== SUBMIT =====
              FormActions(
                mode: FormActionMode.add,
                onSubmit: () {
                  if (_formKey.currentState
                      ?.saveAndValidate() ??
                      false) {
                    debugPrint(
                        _formKey.currentState!.value
                            .toString());
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