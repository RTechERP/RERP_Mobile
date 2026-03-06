import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/app_bar_common.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/hr_bloc.dart';

class HrLxcpEditScreen extends StatefulWidget {
  final int dailyId;
  final int positionId;



  const HrLxcpEditScreen({
    super.key,
    required this.dailyId,
    required this.positionId,

  });
  @override
  State<HrLxcpEditScreen> createState() => _HrLxcpEditScreenState();
}

class _HrLxcpEditScreenState
    extends BaseState<HrLxcpEditScreen, HrEvent, HrState, HrBloc> {

  @override
  void initState() {
    super.initState();
    bloc.add(HrEvent.selectLXCPReport(dailyID: widget.dailyId));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<HrBloc, HrState>(
          listenWhen: (p, c) =>
          p.selectedLXCPReportDetail != c.selectedLXCPReportDetail ||
              p.saveSuccess != c.saveSuccess,
          listener: (context, state) {
            if (state.saveSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: const AppBarCommon(title: Text('Chỉnh sửa báo cáo')),
            body: _buildBody(),
          ),
        ),
        BlocBuilder<HrBloc, HrState>(
          buildWhen: (p, c) => p.saveSuccess != c.saveSuccess,
          builder: (context, state) {
            if (!state.saveSuccess) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (widget.positionId == 6) {
      return _HrEditLXView(dailyId: widget.dailyId);
    }

    if (widget.positionId == 72) {
      return _HrEditCPView(dailyId: widget.dailyId);
    }

    return const Center(child: Text('Không xác định loại LXCP'));
  }
}

class _HrEditLXView extends StatefulWidget {
  final int dailyId;

  const _HrEditLXView({required this.dailyId});

  @override
  State<_HrEditLXView> createState() => _HrEditLXViewState();
}

class _HrEditLXViewState extends State<_HrEditLXView> {
  final _formKey = GlobalKey<FormBuilderState>();

  final kmController = TextEditingController();
  final lateController = TextEditingController();
  final minuteController = TextEditingController();
  final reasonController = TextEditingController();
  final statusController = TextEditingController();
  final proposeController = TextEditingController();

  bool _loaded = false;

  DateTime? _parseDate(String? date) {
    if (date == null) return DateTime.now();
    return DateTime.tryParse(date);
  }

  void _bindData(detail) {
    if (_loaded) return;

    kmController.text = detail.kmNumber?.toInt().toString() ?? '';
    lateController.text = detail.totalLate?.toString() ?? '';
    minuteController.text = detail.totalTimeLate?.toInt().toString() ?? '';
    reasonController.text = detail.reasonLate ?? '';
    statusController.text = detail.statusVehicle ?? '';
    proposeController.text = detail.propose ?? '';

    _loaded = true;
  }

  @override
  void dispose() {
    kmController.dispose();
    lateController.dispose();
    minuteController.dispose();
    reasonController.dispose();
    statusController.dispose();
    proposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        final detail = state.selectedLXCPReportDetail;

        if (detail == null) {
          return const Center(child: CircularProgressIndicator());
        }

        _bindData(detail);

        return Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [

                    FormCard(
                      child: FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: 'lx_edit_date',
                        nameTimePicker: 'date_picker',
                        label: 'Ngày báo cáo',
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        initialValue: _parseDate(detail.dateReport),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Số Km',
                      child: FormInputField(
                        label: 'Số Km',
                        icon: Icons.add_road_outlined,
                        nameForm: 'lx_edit_km',
                        nameTextField: 'km_field',
                        controller: kmController,
                        keyboardType: TextInputType.number,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, kmNumber: int.tryParse(v ?? '') ?? 0,),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Số cuốc xe muộn',
                      child: FormInputField(
                        label: 'Số cuốc xe muộn',
                        icon: Icons.car_crash_outlined,
                        nameForm: 'lx_edit_late',
                        nameTextField: 'late_field',
                        controller: lateController,
                        keyboardType: TextInputType.number,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, totalLate: int.tryParse(v ?? '') ?? 0,),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Tổng phút chậm',
                      child: FormInputField(
                        label: 'Tổng phút chậm',
                        icon: Icons.access_time_outlined,
                        nameForm: 'lx_edit_minute',
                        nameTextField: 'minute_field',
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, totalTimeLate: int.tryParse(v ?? '') ?? 0,),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Lý do muộn',
                      child: FormInputField(
                        label: 'Lý do muộn',
                        icon: Icons.help_outline,
                        nameForm: 'lx_edit_reason',
                        nameTextField: 'reason_field',
                        controller: reasonController,
                        maxLines: 3,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, reasonLate: v),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Trạng thái xe',
                      child: FormInputField(
                        label: 'Trạng thái xe',
                        icon: Icons.local_taxi_outlined,
                        nameForm: 'lx_edit_status',
                        nameTextField: 'status_field',
                        controller: statusController,
                        maxLines: 3,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, statusVehicle: v),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FormCard(
                      title: 'Kiến nghị',
                      child: FormInputField(
                        label: 'Kiến nghị',
                        icon: Icons.lightbulb_outline,
                        nameForm: 'lx_edit_propose',
                        nameTextField: 'propose_field',
                        controller: proposeController,
                        maxLines: 3,
                        onChanged: (v) => context.read<HrBloc>().add(
                          HrEvent.lxcpUpdateWork(index: 0, propose: v),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: FormActions(
                mode: FormActionMode.edit,
                onCancel: () => context.pop(),
                onSave: () async {
                  FocusScope.of(context).unfocus();

                  final formState = _formKey.currentState;
                  if (formState == null) return;

                  final isValid = formState.saveAndValidate();
                  if (!isValid) return;

                  final values = formState.value;

                  final pickedDate = values['lx_edit_date'] as DateTime?;
                  final km = int.tryParse(kmController.text);
                  final late = int.tryParse(lateController.text);
                  final minute = int.tryParse(minuteController.text);

                  final error = ValidateHelper.validateLxReport(
                    date: pickedDate,
                    kmNumber: km,
                    totalLate: late,
                    totalTimeLate: minute,
                  );

                  if (error != null) {
                    context.showMessage(error, type: SnackBarType.error);
                    return;
                  }

                  context.read<HrBloc>().add(
                    HrEvent.submitLXCPEditReport(pickedDate!, widget.dailyId),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
class _HrEditCPView extends StatefulWidget {
  final int dailyId;

  const _HrEditCPView({required this.dailyId});

  @override
  State<_HrEditCPView> createState() => _HrEditCPViewState();
}

class _HrEditCPViewState extends State<_HrEditCPView> {
  final _formKey = GlobalKey<FormBuilderState>();

  final quantityController = TextEditingController();
  final timeController = TextEditingController();
  final performanceController = TextEditingController();
  final percentageController = TextEditingController();

  bool _loaded = false;

  DateTime? _parseDate(String? date) {
    if (date == null) return DateTime.now();
    return DateTime.tryParse(date);
  }

  void _bindData(detail) {
    if (_loaded) return;

    quantityController.text = detail.quantity?.toString() ?? '';
    timeController.text = detail.timeActual?.toInt().toString() ?? '';
    performanceController.text =
        detail.performanceActual?.toInt().toString() ?? '';
    percentageController.text = detail.percentage?.toInt().toString() ?? '';

    _loaded = true;
  }

  @override
  void dispose() {
    quantityController.dispose();
    timeController.dispose();
    performanceController.dispose();
    percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        final detail = state.selectedLXCPReportDetail;

        if (detail == null) {
          return const Center(child: CircularProgressIndicator());
        }

        _bindData(detail);

        return Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [

                    /// DATE
                    FormCard(
                      child: FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: 'date',
                        nameTimePicker: 'date_picker',
                        label: 'Ngày báo cáo',
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        initialValue: _parseDate(detail.dateReport),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// QUANTITY
                    FormCard(
                      title: 'Kết quả thực hiện',
                      child: FormInputField(
                        label: 'Số lượng',
                        icon: Icons.production_quantity_limits,
                        nameForm: 'quantity',
                        nameTextField: 'quantity_field',
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// TIME
                    FormCard(
                      title: 'Thời gian thực hiện',
                      child: FormInputField(
                        label: 'Thời gian',
                        icon: Icons.access_time,
                        nameForm: 'time',
                        nameTextField: 'time_field',
                        controller: timeController,
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// PERFORMANCE
                    FormCard(
                      title: 'Năng suất thực tế',
                      child: FormInputField(
                        label: 'Năng suất thực tế',
                        icon: Icons.speed,
                        nameForm: 'performance',
                        nameTextField: 'performance_field',
                        controller: performanceController,
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// PERCENTAGE
                    FormCard(
                      title: 'Tỷ lệ',
                      child: FormInputField(
                        label: 'Tỷ lệ',
                        icon: Icons.percent,
                        nameForm: 'percentage',
                        nameTextField: 'percentage_field',
                        controller: percentageController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: FormActions(
                mode: FormActionMode.edit,
                onCancel: () => context.pop(),
                onSave: () async {
                  FocusScope.of(context).unfocus();

                  final formState = _formKey.currentState;
                  if (formState == null) return;

                  final isValid = formState.saveAndValidate();
                  if (!isValid) return;

                  final values = formState.value;

                  final pickedDate = values['hr_edit_date'] as DateTime?;

                  if (pickedDate == null) return;

                  /// VALIDATE BUSINESS
                  final error = ValidateHelper.validateMarketingReport(
                    date: pickedDate,
                    content: state.content ?? '',
                    result: state.results ?? '',
                    planNextDay: state.planNextDay ?? '',
                  );

                  if (error != null) {
                    context.showMessage(error, type: SnackBarType.error);
                    return;
                  }

                  context.read<HrBloc>().add(
                    HrEvent.submitEditReport(pickedDate, widget.dailyId),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}