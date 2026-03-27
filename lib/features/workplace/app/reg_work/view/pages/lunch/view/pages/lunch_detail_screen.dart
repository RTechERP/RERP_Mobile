import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../bloc/lunch_bloc.dart';
import '../../data/datasource/models/lunch_model.dart';

class LunchDetailScreen extends StatefulWidget {
  const LunchDetailScreen({super.key});

  @override
  State<LunchDetailScreen> createState() => _LunchDetailScreenState();
}

class _LunchDetailScreenState extends BaseState<
    LunchDetailScreen,
    LunchEvent,
    LunchState,
    LunchBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  LunchItem? _item;
  late DateTime _todayStart;
  late DateTime _selectedDate;
  Timer? _saveStateTimer;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _selectedDate = _todayStart;

    // Lấy payload từ màn list truyền qua (extra).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      final extra = GoRouterState.of(context).extra;
      final item = extra is LunchItem ? extra : null;
      if (item == null) return;

      setState(() {
        _item = item;
        final baseDate = item.dateOrder ?? DateTime.now();
        _selectedDate = DateTime(baseDate.year, baseDate.month, baseDate.day);
      });

      // Set giá trị mặc định cho location radio group sau khi FormBuilder
      // được mount (để tránh `fields[...]` trả về null).
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        final locationRadio = _mapLocationRadio(item.location);
        _formKey.currentState?.fields['location']?.didChange(locationRadio);
      });
    });

    _saveStateTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _saveStateTimer?.cancel();
    super.dispose();
  }

  String _mapLocationRadio(int? location) {
    if (location == 2) return 'dp';
    return 'hn';
  }

  int _mapLocationInt(String? value) {
    switch (value) {
      case 'dp':
        return 2;
      case 'hn':
      default:
        return 1;
    }
  }

  bool get _canEdit => _item?.isApproved == false;

  bool get _isSaveDisabled {
    if (_item == null) return true;
    if (!_canEdit) return true;

    // Theo yêu cầu: employeeId = 4 vẫn được phép lưu (chỉ khi isApproved = false).
    if (_item!.employeeId == 4) return false;

    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final deadline = DateTime(
      todayStart.year,
      todayStart.month,
      todayStart.day,
      10,
      0,
    );

    // Khóa nút Lưu sau 10:00.
    return !now.isBefore(deadline);
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
            appBar: AppBarCommon(
              title: const Text('Chi tiết cơm ca'),
              onBackTap: () => context.pop(false),
            ),
            body: BlocBuilder<LunchBloc, LunchState>(
              builder: (context, state) {
                final item = _item;
                if (item == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
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
                                    enabled: _canEdit,
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
                                    enabled: _canEdit,
                                    nameForm:
                                        'regwork_lunch_add_quantity',
                                    nameTextField:
                                        'regwork_lunch_add_quantity_field',
                                    keyboardType: TextInputType.number,
                                    label: 'Số lượng',
                                    icon: Icons.confirmation_number_outlined,
                                    initialValue:
                                        item.quantity?.toString() ?? '0',
                                    validator:
                                        ValidateHelper.validateLunchQuantityField,
                                  ),
                                  const SizedBox(height: 8),
                                  FormRadioGroup(
                                    name: 'location',
                                    label: 'Địa điểm',
                                    enabled: _canEdit,
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
                                    enabled: _canEdit,
                                    nameForm: 'regwork_lunch_add_note',
                                    nameTextField: 'regwork_lunch_add_note_field',
                                    label: 'Ghi chú',
                                    icon: Icons.note_alt_outlined,
                                    maxLines: 3,
                                    initialValue: item.note ?? '',
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
                        mode: FormActionMode.edit,
                        onCancel: () => context.pop(false),
                        onSave:
                            (_isSaveDisabled || state.isSubmitting) ? null : () {
                          FocusScope.of(context).unfocus();

                          final formState = _formKey.currentState;
                          if (formState == null) return;
                          if (!formState.saveAndValidate()) return;

                          final values = formState.value;
                          final locationRaw = values['location'] as String?;
                          if (locationRaw == null || locationRaw.isEmpty) {
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
                            '${values['regwork_lunch_add_quantity'] ?? ''}'.trim(),
                          );

                          final validation = ValidateHelper.validateLunch(
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

                          final note = '${values['regwork_lunch_add_note'] ?? ''}';

                          bloc.add(
                            LunchEvent.onEditSubmit(
                              id: item.id,
                              quantity: quantity!,
                              location: _mapLocationInt(locationRaw),
                              note: note,
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
