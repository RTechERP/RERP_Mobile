import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../../../../features/auth/data/repository/auth_repo.dart';
import '../bloc/lunch_bloc.dart';

class LunchAddScreen extends StatefulWidget {
  const LunchAddScreen({super.key});

  @override
  State<LunchAddScreen> createState() => _LunchAddScreenState();
}

class _LunchAddScreenState
    extends BaseState<LunchAddScreen, LunchEvent, LunchState, LunchBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  late DateTime _selectedDate;
  int? _currentEmployeeId;
  Timer? _saveStateTimer;

  bool get _isSaveDisabled {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final deadline = DateTime(
      todayStart.year,
      todayStart.month,
      todayStart.day,
      10,
      0,
    );

    // Nhân viên đặc biệt luôn được phép lưu.
    if (_currentEmployeeId == 4) return false;

    // Khoá nút Lưu sau 10:00 (theo yêu cầu nghiệp vụ).
    return !now.isBefore(deadline);
  }

  int _mapLocation(String? value) {
    switch (value) {
      case 'dp':
        return 2;
      case 'hn':
      default:
        return 1;
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _selectedDate = _todayStart;

    _loadCurrentEmployeeId();

    // Tick mỗi phút để nút Lưu đổi trạng thái đúng thời điểm.
    _saveStateTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> _loadCurrentEmployeeId() async {
    final userRes = await getIt.get<AuthRepo>().getCurrentUser();
    final user = userRes.getOrElse(() => null);
    if (!mounted) return;
    setState(() => _currentEmployeeId = user?.employeeId);
  }

  @override
  void dispose() {
    _saveStateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<LunchBloc, LunchState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess ||
              previous.message != current.message,
          listener: (context, state) {
            if ((state.message ?? '').isNotEmpty) {
              context.showMessage(
                state.message!,
                type: state.submitSuccess ? SnackBarType.success : SnackBarType.error,
              );
            }
            if (state.submitSuccess) {
              bloc.add(const LunchEvent.clearSubmitState());
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo cơm ca')),
            body: BlocBuilder<LunchBloc, LunchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            FormLeftBorderCard(
                              icon: Icons.warning_amber_rounded,
                              borderColor: Colors.orange,
                              backgroundColor: const Color(0xFFFFF8E1),
                              child: const Text(
                                'Vui lòng đặt cơm trước 10h hàng ngày',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormCard(
                              title: 'Thông tin cơm ca',
                              child: Column(
                                children: [
                                  FormDateTimePicker(
                                    nameForm: 'lunch_add_date',
                                    nameTimePicker: 'lunch_add_date_time',
                                    label: '',
                                    icon: Icons.calendar_today_outlined,
                                    inputType: InputType.date,
                                    format: DateFormat('dd/MM/yyyy'),
                                    initialValue: _selectedDate,
                                    firstDate: _todayStart,
                                    onChanged: (v) {
                                      if (v == null) return;
                                      final safe =
                                          DateTime(v.year, v.month, v.day);
                                      if (safe == _selectedDate) return;
                                      setState(() => _selectedDate = safe);
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  FormInputField(
                                    nameForm:
                                        'regwork_lunch_add_quantity',
                                    nameTextField:
                                        'regwork_lunch_add_quantity_field',
                                    keyboardType: TextInputType.number,
                                    label: 'Số lượng',
                                    icon: Icons
                                        .confirmation_number_outlined,
                                    validator:
                                        ValidateHelper.validateLunchQuantityField,
                                  ),
                                  const SizedBox(height: 8),
                                  FormRadioGroup(
                                    name: 'location',
                                    label: 'Địa điểm',
                                    options: const [
                                      FormRadioOption(
                                        value: 'hn',
                                        icon: Icons.location_city,
                                        label: 'VP Hà Nội',
                                      ),
                                      FormRadioOption(
                                        value: 'dp',
                                        icon: Icons.factory_outlined,
                                        label: 'Xưởng Đan Phượng',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  FormInputField(
                                    nameForm: 'regwork_lunch_add_note',
                                    nameTextField: 'regwork_lunch_add_note_field',
                                    label: 'Ghi chú',
                                    icon: Icons.note_alt_outlined,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: FormActions(
                        mode: FormActionMode.add,
                        onSubmit: _isSaveDisabled
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();

                                final formState = _formKey.currentState;
                                if (formState == null) return;
                                if (!formState.saveAndValidate()) return;

                                final values = formState.value;
                                final locationRaw =
                                    values['location'] as String?;
                                if (locationRaw == null ||
                                    locationRaw.isEmpty) {
                                  context.showMessage(
                                    'Vui lòng chọn địa điểm',
                                    type: SnackBarType.error,
                                  );
                                  return;
                                }

                                final dateOrder =
                                    values['lunch_add_date'] as DateTime?;
                                if (dateOrder == null) {
                                  context.showMessage(
                                    'Vui lòng chọn ngày',
                                    type: SnackBarType.error,
                                  );
                                  return;
                                }

                                final quantity = int.tryParse(
                                  '${values['regwork_lunch_add_quantity'] ?? ''}'
                                      .trim(),
                                );
                                final validation =
                                    ValidateHelper.validateLunch(
                                  quantity: quantity,
                                  location: locationRaw,
                                );
                                if (validation != null) {
                                  context.showMessage(
                                    validation,
                                    type: SnackBarType.error,
                                  );
                                  return;
                                }

                                final safeQuantity = quantity!;

                                bloc.add(
                                  LunchEvent.submit(
                                    quantity: safeQuantity,
                                    location: _mapLocation(locationRaw),
                                    note: '${values['regwork_lunch_add_note'] ?? ''}',
                                    dateOrder: dateOrder,
                                  ),
                                );
                              },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        BlocBuilder<LunchBloc, LunchState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
                    repeat: true,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
