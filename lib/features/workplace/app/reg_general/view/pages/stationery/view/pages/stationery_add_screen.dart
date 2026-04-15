// Date: 15/04/2026 - Dev: admin
// Nội dung/Chức năng: Màn hình thêm đăng ký văn phòng phẩm - chọn VPP, số lượng, ghi chú

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/form_card.dart';
import '../../../../../../../../../common/widgets/form/form_actions.dart';
import '../../../../../../../../../common/widgets/form/form_input_decoration.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../bloc/stationery_bloc.dart';
import '../widgets/stationery_slip_row.dart';

class StationeryAddScreen extends StatefulWidget {
  const StationeryAddScreen({super.key});

  @override
  State<StationeryAddScreen> createState() => _StationeryAddScreenState();
}

class _StationeryAddScreenState
    extends BaseState<
        StationeryAddScreen,
        StationeryEvent,
        StationeryState,
        StationeryBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    bloc.add(const StationeryEvent.initAdd());
  }

  void _openSupplySelector(int slipIndex, List<StationerySupplyItem> supplies) {
    openSelectBottomSheet<StationerySupplyItem>(
      context: context,
      title: 'Chọn văn phòng phẩm',
      items: supplies,
      displayText: (item) => '${item.codeRTC ?? ''} - ${item.nameNCC ?? ''}',
      hintText: 'Tìm kiếm VPP...',
      onSelected: (item) {
        bloc.add(StationeryEvent.selectSupply(
          slipIndex: slipIndex,
          supply: item,
        ));
      },
    );
  }

  void _onSubmit() {
    // Validate supply & quantity per slip
    final slips = bloc.state.slips;
    bool hasError = false;

    if (!hasError && (_formKey.currentState?.saveAndValidate() ?? false)) {
      bloc.add(const StationeryEvent.submitStationery());
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocConsumer<StationeryBloc, StationeryState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.submitSuccess != curr.submitSuccess ||
          prev.isSubmitting != curr.isSubmitting,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
        if (state.submitSuccess) {
          context.showMessage(
            state.message ?? 'Đăng ký thành công',
            type: SnackBarType.success,
          );
          context.pushReplacement(RouteNames.stationery);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Đăng ký VPP'),
            onBackTap: () => onBack(context),
          ),
          body: state.status == BaseStateStatus.loading && state.slips.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : _buildForm(context, state),
        );
      },
    );
  }

  /// Predicate: chỉ cho phép chọn ngày 1–5 của mỗi tháng.
  bool _selectableDayPredicate(DateTime day) {
    return day.day >= 1 && day.day <= 5;
  }

  Widget _buildForm(BuildContext context, StationeryState state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ngày đăng ký (chỉ chọn ngày 1-5, isRequired)
                  FormCard(
                    title: 'Thông tin đăng ký',
                    child: FormBuilderField<DateTime?>(
                      name: 'date_register',
                      validator: FormBuilderValidators.required(
                        errorText: 'Vui lòng chọn ngày đăng ký',
                      ),
                      builder: (field) {
                        return InkWell(
                          onTap: () => _showDatePicker(
                            context,
                            state.dateRegister ?? DateTime.now(),
                          ),
                          child: InputDecorator(
                            decoration: formInputDecoration(
                              context,
                              label: 'Ngày đăng ký',
                              icon: Icons.calendar_today,
                              hasError: field.hasError,
                              errorText: field.errorText,
                              isRequired: true,
                            ),
                            child: Text(
                              state.dateRegister != null
                                  ? _dateFormat.format(state.dateRegister!)
                                  : 'Chọn ngày (1-5)',
                              style: TextStyle(
                                fontSize: 14,
                                color: state.dateRegister != null
                                    ? Colors.black87
                                    : AppColors.hintText,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Danh sách VPP
                  FormCard(
                    title: 'Danh sách văn phòng phẩm',
                    child: Column(
                      children: [
                        // Slip list
                        ...state.slips.asMap().entries.map((entry) {
                          final index = entry.key;
                          final slip = entry.value;
                          return StationerySlipRow(
                            key: ValueKey('slip_$index'),
                            slipIndex: index,
                            slip: slip,
                            supplies: state.stationerySupply,
                            onSupplyTap: () =>
                                _openSupplySelector(index, state.stationerySupply),
                            onQuantityChanged: (qty) => bloc.add(
                              StationeryEvent.updateQuantity(
                                slipIndex: index,
                                quantity: qty,
                              ),
                            ),
                            onExceedsChanged: (exceeds) => bloc.add(
                              StationeryEvent.toggleExceedsLimit(
                                slipIndex: index,
                                exceeds: exceeds,
                              ),
                            ),
                            onReasonChanged: (reason) => bloc.add(
                              StationeryEvent.updateReason(
                                slipIndex: index,
                                reason: reason,
                              ),
                            ),
                            onNoteChanged: (note) => bloc.add(
                              StationeryEvent.updateNote(
                                slipIndex: index,
                                note: note,
                              ),
                            ),
                            onRemove: state.slips.length > 1
                                ? () => bloc.add(
                                    StationeryEvent.removeSlip(slipIndex: index))
                                : null,
                          );
                        }),

                        const SizedBox(height: 12),

                        // Nút thêm dòng
                        Center(
                          child: TextButton.icon(
                            onPressed: () =>
                                bloc.add(const StationeryEvent.addSlip()),
                            icon: const Icon(Icons.add_circle_outline,
                                color: AppColors.primaryERP),
                            label: const Text(
                              'Thêm dòng VPP',
                              style: TextStyle(color: AppColors.primaryERP),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Actions
        state.isSubmitting
            ? const LinearProgressIndicator()
            : FormActions(
                mode: FormActionMode.add,
                submitText: 'Gửi đơn',
                onSubmit: _onSubmit,
                onCancel: () => onBack(context),
              ),
      ],
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    DateTime initial,
  ) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year, now.month, 1),
      lastDate: DateTime(now.year, now.month + 2, 0),
      selectableDayPredicate: _selectableDayPredicate,
    );
    if (picked != null) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      bloc.updateDateRegister(picked);
    }
  }
}
