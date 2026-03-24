import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../bloc/lunch_bloc.dart';

class LunchAddScreen extends StatefulWidget {
  const LunchAddScreen({super.key});

  @override
  State<LunchAddScreen> createState() => _LunchAddScreenState();
}

class _LunchAddScreenState
    extends BaseState<LunchAddScreen, LunchEvent, LunchState, LunchBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

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
                                  FormReadonlyField(
                                    initialValue: DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(DateTime.now()),
                                    label: '',
                                    name: 'lunch_add_date',
                                    icon: Icons.calendar_today_outlined,
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
                                  const FormRadioGroup(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormCard(
                              title: 'Ghi chú',
                              child: FormInputField(
                                nameForm: 'regwork_lunch_add_note',
                                nameTextField: 'regwork_lunch_add_note_field',
                                label: 'Ghi chú',
                                icon: Icons.note_alt_outlined,
                                maxLines: 3,
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
                        onSubmit: () {
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

                          final quantity = int.tryParse(
                            '${values['regwork_lunch_add_quantity'] ?? ''}'
                                .trim(),
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

                          final safeQuantity = quantity!;

                          bloc.add(
                            LunchEvent.submit(
                              quantity: safeQuantity,
                              location: _mapLocation(locationRaw),
                              note: '${values['regwork_lunch_add_note'] ?? ''}',
                              dateOrder: DateTime.now(),
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
