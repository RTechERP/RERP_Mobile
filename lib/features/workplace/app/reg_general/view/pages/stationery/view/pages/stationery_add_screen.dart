// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình thêm đăng ký văn phòng phẩm - chọn VPP, số lượng, ghi chú

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../bloc/stationery_bloc.dart';
import '../widgets/stationery_slip_row.dart';

class StationeryAddScreen extends StatefulWidget {
  const StationeryAddScreen({super.key});

  @override
  State<StationeryAddScreen> createState() => _StationeryAddScreenState();
}

class _StationeryAddScreenState
    extends BaseState<StationeryAddScreen, StationeryEvent, StationeryState,
        StationeryBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  DateTime? _dateRegister;

  @override
  void initState() {
    super.initState();
    _dateRegister = DateTime.now();
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
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }
    final dateValue =
        _formKey.currentState?.fields['date_register_picker']?.value;
    bloc.add(StationeryEvent.submitStationery(
      dateRegister: dateValue ?? DateTime.now(),
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<StationeryBloc, StationeryState>(
          listenWhen: (prev, curr) =>
              prev.status != curr.status ||
              prev.submitSuccess != curr.submitSuccess ||
              prev.isSubmitting != curr.isSubmitting ||
              prev.supplyRequiredValidated != curr.supplyRequiredValidated,
          listener: (context, state) {
            if (state.status == BaseStateStatus.failed &&
                state.message != null) {
              context.showMessage(state.message!, type: SnackBarType.error);
            }
            if (state.submitSuccess) {
              context.showMessage(
                state.message ?? 'Đăng ký thành công',
                type: SnackBarType.success,
              );
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Đăng ký VPP'),
              onBackTap: () => onBack(context),
            ),
            body: BlocBuilder<StationeryBloc, StationeryState>(
              buildWhen: (prev, curr) =>
                  prev.status != curr.status ||
                  prev.slips != curr.slips ||
                  prev.stationerySupply != curr.stationerySupply ||
                  prev.supplyRequiredValidated != curr.supplyRequiredValidated ||
                  prev.isAdmin != curr.isAdmin,
              builder: (context, state) {
                if (state.status == BaseStateStatus.loading &&
                    state.slips.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildForm(context, state);
              },
            ),
          ),
        ),

        /// Loading overlay with Lottie
        BlocBuilder<StationeryBloc, StationeryState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.45),
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
                  FormCard(
                    child: FormDateTimePicker(
                      icon: Icons.calendar_today,
                      nameForm: 'date_register',
                      nameTimePicker: 'date_register_picker',
                      label: 'Ngày đăng ký',
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      initialValue: _dateRegister,
                      isRequired: true,
                      selectableDayPredicate: state.isAdmin
                          ? null
                          : (day) => day.day >= 1 && day.day <= 5,
                      validator: (v) {
                        if (v == null) return 'Vui lòng chọn ngày đăng ký';
                        if (!state.isAdmin && v.day > 5) {
                          return 'Hiện tại đã quá thời hạn đăng ký!';
                        }
                        return null;
                      },
                      onChanged: (v) {
                        if (v != null) {
                          setState(() {
                            _dateRegister = v;
                          });
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  FormCard(
                    title: 'Danh sách phiếu',
                    child: Column(
                      children: [
                        ...state.slips.asMap().entries.map((entry) {
                          final index = entry.key;
                          final slip = entry.value;
                          return StationerySlipRow(
                            key: ValueKey('slip_$index'),
                            slipIndex: index,
                            slip: slip,
                            supplies: state.stationerySupply,
                            supplyRequiredValidated:
                                state.supplyRequiredValidated,
                            onSupplyTap: () => _openSupplySelector(
                                index, state.stationerySupply),
                            onQuantityChanged: (qty) => bloc.add(
                              StationeryEvent.updateQuantity(
                                slipIndex: index,
                                quantity: qty,
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
                                ? () => bloc.add(StationeryEvent.removeSlip(
                                    slipIndex: index))
                                : null,
                          );
                        }),

                        const SizedBox(height: 12),

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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: FormActions(
            mode: FormActionMode.add,
            submitText: 'Lưu',
            onSubmit: _onSubmit,
            onCancel: () => onBack(context),
          ),
        ),
      ],
    );
  }
}
