import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/hr_bloc.dart';
import '../widgets/CpAddWorkItem.dart';

class HrAddScreen extends StatefulWidget {
  final DepartmentType? type;

  const HrAddScreen({super.key, this.type});

  @override
  State<HrAddScreen> createState() => _HrAddScreenState();
}

class _HrAddScreenState
    extends BaseState<HrAddScreen, HrEvent, HrState, HrBloc> {
  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case DepartmentType.hr_admin:
        bloc.add(const HrEvent.initAd());
        break;
      case DepartmentType.hr_lxcp:
        bloc.add(const HrEvent.initLxcp());
        break;
      default:
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<HrBloc, HrState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess,
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: Text('Tạo báo cáo')),
            body: _buildBody(),
          ),
        ),
        BlocBuilder<HrBloc, HrState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) {
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

  Widget _buildBody() {
    switch (widget.type) {
      case DepartmentType.hr_admin:
        return const _HrAddAdminView();
      case DepartmentType.hr_lxcp:
        return const _HrAddLxcpView();
      default:
        return const Center(child: Text('Chưa xác định loại HR'));
    }
  }
}

class _HrAddAdminView extends StatefulWidget {
  const _HrAddAdminView();

  @override
  State<_HrAddAdminView> createState() => _HrAddAdminViewState();
}

class _HrAddAdminViewState extends State<_HrAddAdminView> {
  final _formAdminKey = GlobalKey<FormBuilderState>();
  bool _showExtraInfo = false;

  DateTime? _initialReportDate() {
    final now = DateTime.now();

    // 09:00 hôm nay
    final todayAt9 = DateTime(now.year, now.month, now.day, 9);

    // Nếu trước 09:00 => null, sau 09:00 => now
    if (now.isBefore(todayAt9)) return null;
    return now;
  }

  late HrBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = context.read<HrBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: _formAdminKey,
                initialValue: {'date': DateTime.now()},
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    /// ===== NGÀY BÁO CÁO =====
                    FormCard(
                      child: FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: 'hr_add_date',
                        nameTimePicker: 'date_time',
                        label: 'Ngày báo cáo',
                        inputType: InputType.date,
                        initialValue: _initialReportDate(),
                        format: DateFormat('dd/MM/yyyy'),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ===== NỘI DUNG CÔNG VIỆC =====
                    FormCard(
                      title: 'Nội dung công việc',
                      child: FormInputField(
                        icon: Icons.note_alt_outlined,
                        nameForm: 'hr_admin_add_content',
                        nameTextField: 'content',
                        label: 'Nội dung công việc',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction:
                            TextInputAction.newline, // ⬅ Enter xuống dòng
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(content: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ===== KẾT QUẢ =====
                    FormCard(
                      title: 'Kết quả',
                      child: FormInputField(
                        icon: Icons.task_alt_outlined,
                        nameForm: 'hr_admin_add_result',
                        nameTextField: 'result',
                        label: 'Kết quả đạt được',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction:
                            TextInputAction.newline, // ⬅ Enter xuống dòng
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(results: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
                    FormCard(
                      title: 'Kế hoạch ngày tiếp theo',
                      child: FormInputField(
                        icon: Icons.next_plan_outlined,
                        nameForm: 'hr_admin_add_next_plan',
                        nameTextField: 'next_plan',
                        label: 'Kế hoạch ngày tiếp theo',
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction:
                            TextInputAction.newline, // ⬅ Enter xuống dòng
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(planNextDay: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ===== THÔNG TIN BỔ SUNG (ẨN / HIỆN) =====
                    FormCard(
                      title: 'Thông tin bổ sung',
                      child: Column(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _showExtraInfo = !_showExtraInfo;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _showExtraInfo
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.primaryERP,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _showExtraInfo
                                        ? 'Ẩn thông tin bổ sung'
                                        : 'Hiện thông tin bổ sung',
                                    style: const TextStyle(
                                      color: AppColors.primaryERP,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          if (_showExtraInfo) ...[
                            const SizedBox(height: 12),

                            FormInputField(
                              icon: Icons.warning_amber_outlined,
                              nameForm: 'hr_admin_add_blocking',
                              nameTextField: 'blocking',
                              label: 'Tồn đọng (nếu có)',
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              textInputAction:
                                  TextInputAction.newline, // ⬅ Enter xuống dòng
                              onChanged: (v) {
                                bloc.add(HrEvent.updateWork(backlog: v));
                              },
                            ),
                            const SizedBox(height: 8),

                            FormInputField(
                              icon: Icons.note_outlined,
                              nameForm: 'hr_admin__blocking_reason',
                              nameTextField: 'blocking_reason',
                              label: 'Ghi chú / Lý do tồn đọng',
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              textInputAction:
                                  TextInputAction.newline, // ⬅ Enter xuống dòng

                              onChanged: (v) {
                                bloc.add(HrEvent.updateWork(note: v));
                              },
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            /// ===== ACTIONS =====
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: FormActions(
                mode: FormActionMode.add,
                onSubmit: () async {
                  FocusScope.of(context).unfocus();

                  final formState = _formAdminKey.currentState;
                  if (formState == null) return;

                  final isValid = formState.saveAndValidate();
                  if (!isValid) return;

                  final values = formState.value;

                  final error = ValidateHelper.validateMarketingReport(
                    date: values['hr_add_date'] as DateTime?,
                    content: state.content ?? '',
                    result: state.results ?? '',
                    planNextDay: state.planNextDay ?? '',
                  );

                  if (error != null) {
                    context.showMessage(error, type: SnackBarType.error);
                    return;
                  }

                  final pickedDate = values['hr_add_date'] as DateTime?;

                  if (pickedDate == null) return;

                  bloc.add(HrEvent.submitReport(pickedDate));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HrAddLxcpView extends StatefulWidget {
  const _HrAddLxcpView();

  @override
  State<_HrAddLxcpView> createState() => _HrAddLxcpViewState();
}

class _HrAddLxcpViewState extends State<_HrAddLxcpView> {
  bool _showExtraInfo = false;

  final _formLxKey = GlobalKey<FormBuilderState>();
  final _formCpKey = GlobalKey<FormBuilderState>();

  DateTime? _initialReportDate() {
    final now = DateTime.now();

    // 09:00 hôm nay
    final todayAt9 = DateTime(now.year, now.month, now.day, 9);

    // Nếu trước 09:00 => null, sau 09:00 => now
    if (now.isBefore(todayAt9)) return null;
    return now;
  }

  late HrBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = context.read<HrBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        if (state.positionId == 6) {
          return _buildLxForm(state);
        }

        if (state.positionId == 72) {
          return _buildCpForm(state);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildLxForm(HrState state) {
    return Column(
      children: [
        Expanded(
          child: FormBuilder(
            key: _formLxKey,
            initialValue: {'date': DateTime.now()},
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                FormCard(
                  child: FormDateTimePicker(
                    icon: Icons.calendar_today,
                    nameForm: 'lx_add_date',
                    nameTimePicker: 'date_time',
                    label: 'Ngày báo cáo',
                    inputType: InputType.date,
                    initialValue: _initialReportDate(),
                    format: DateFormat('dd/MM/yyyy'),
                  ),
                ),

                const SizedBox(height: 8),

                FormCard(
                  title: 'Số Km',
                  child: FormInputField(
                    label: 'Số Km',
                    icon: Icons.add_road_outlined,
                    nameForm: 'lx_add_km',
                    nameTextField: 'km',
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    onChanged: (v) => bloc.add(
                      HrEvent.lxcpUpdateWork(
                        index: 0,
                        kmNumber: int.tryParse(v ?? '') ?? 0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                FormCard(
                  title: 'Số cuốc xe muộn',
                  child: FormInputField(
                    label: 'Số cuốc xe muộn',
                    icon: Icons.car_crash_outlined,
                    nameForm: 'lx_add_late_car',
                    nameTextField: 'late_car',
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    onChanged: (v) => bloc.add(
                      HrEvent.lxcpUpdateWork(
                        index: 0,
                        totalLate: int.tryParse(v ?? '') ?? 0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                FormCard(
                  title: 'Tổng số phút chậm',
                  child: FormInputField(
                    label: 'Tổng số phút chậm',
                    icon: Icons.access_time_outlined,
                    nameForm: 'lx_add_late_minute',
                    nameTextField: 'late_minute',
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    onChanged: (v) => bloc.add(
                      HrEvent.lxcpUpdateWork(
                        index: 0,
                        totalTimeLate: int.tryParse(v ?? '') ?? 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                FormCard(
                  title: 'Lý do muộn',
                  child: FormInputField(
                    label: 'Lý do muộn',
                    icon: Icons.question_mark_outlined,
                    nameForm: 'lx_add_late_reason',
                    nameTextField: 'late_reason',
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    textInputAction:
                        TextInputAction.newline, // ⬅ Enter xuống dòng
                    onChanged: (v) => bloc.add(
                      HrEvent.lxcpUpdateWork(index: 0, reasonLate: v),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                FormCard(
                  title: 'Thông tin bổ sung',
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            setState(() => _showExtraInfo = !_showExtraInfo),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _showExtraInfo
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: AppColors.primaryERP,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _showExtraInfo
                                  ? 'Ẩn thông tin bổ sung'
                                  : 'Hiện thông tin bổ sung',
                              style: const TextStyle(
                                color: AppColors.primaryERP,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (_showExtraInfo) ...[
                        const SizedBox(height: 8),
                        FormInputField(
                          label: 'Trạng thái xe',
                          icon: Icons.next_plan_outlined,
                          nameForm: 'lx_add_status',
                          nameTextField: 'status',
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          onChanged: (v) => bloc.add(
                            HrEvent.lxcpUpdateWork(index: 0, statusVehicle: v),
                          ),
                        ),
                        const SizedBox(height: 8),
                        FormInputField(
                          label: 'Kiến nghị / Yêu cầu',
                          icon: Icons.next_plan_outlined,
                          nameForm: 'lx_add_propose',
                          nameTextField: 'propose',
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          onChanged: (v) => bloc.add(
                            HrEvent.lxcpUpdateWork(index: 0, propose: v),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8),
          child: FormActions(
            mode: FormActionMode.add,
            onSubmit: () => _submitLx(state),
          ),
        ),
      ],
    );
  }

  Widget _buildCpForm(HrState state) {
    return Column(
      children: [
        Expanded(
          child: FormBuilder(
            key: _formCpKey,
            initialValue: {'date': DateTime.now()},
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                FormCard(
                  child: FormDateTimePicker(
                    icon: Icons.calendar_today,
                    nameForm: 'cp_add_date',
                    nameTimePicker: 'date_time',
                    label: 'Ngày báo cáo',
                    inputType: InputType.date,
                    initialValue: _initialReportDate(),
                    format: DateFormat('dd/MM/yyyy'),
                  ),
                ),

                const SizedBox(height: 8),

                FormCard(
                  child: BlocBuilder<HrBloc, HrState>(
                    buildWhen: (prev, curr) =>
                        prev.works != curr.works ||
                        prev.expandedWorkIndex != curr.expandedWorkIndex,
                    builder: (context, state) {
                      /// ===== KHÔNG CÓ WORK (user đã xoá) =====
                      if (state.works.isEmpty) {
                        return CustomTextButton(
                          width: double.infinity,
                          bgColor: AppColors.grayColor[10],
                          colorText: AppColors.primaryERPlight,
                          buttonFn: () {
                            bloc.add(const HrEvent.addWork());
                          },
                          child: const Text('Thêm công việc'),
                        );
                      }

                      /// ===== CÓ WORK =====
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...state.works.asMap().entries.map((entry) {
                            final wIndex = entry.key;
                            final work = entry.value;

                            final hasData = (work.workContent ?? '')
                                .trim()
                                .isNotEmpty;

                            final codeText = hasData
                                ? work.workContent!
                                : 'Công việc ${wIndex + 1}';

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: CpAddWorkItem(
                                key: ValueKey(work.id ?? wIndex),
                                report: work,
                                readonly: false,
                                title: codeText,
                                index: wIndex,
                                isExpanded: state.expandedWorkIndex == wIndex,
                                onToggleExpand: () {
                                  bloc.add(HrEvent.expandWork(index: wIndex));
                                },
                                onDelete: () {
                                  bloc.add(HrEvent.removeWork(index: wIndex));
                                },
                              ),
                            );
                          }),

                          const SizedBox(height: 8),

                          /// CHỈ HIỂN THỊ + KHI CÓ ÍT NHẤT 1 WORK
                          Center(
                            child: InkResponse(
                              onTap: () {
                                bloc.add(const HrEvent.addWork());
                              },
                              radius: 28,
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 32,
                                color: AppColors.primaryERP,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8),
          child: FormActions(
            mode: FormActionMode.add,
            onSubmit: () => _submitCp(state),
          ),
        ),
      ],
    );
  }

  void _submitLx(HrState state) {
    FocusScope.of(context).unfocus();

    final formState = _formLxKey.currentState;
    if (formState == null) return;

    final isValid = formState.saveAndValidate();
    if (!isValid) return;

    final values = formState.value;
    final work = state.works.isNotEmpty ? state.works.first : null;

    final error = ValidateHelper.validateLxReport(
      date: values['lx_add_date'] as DateTime?,
      kmNumber: work?.kmNumber,
      totalLate: work?.totalLate,
      totalTimeLate: work?.totalTimeLate,
    );

    if (error != null) {
      context.showMessage(error, type: SnackBarType.error);
      return;
    }

    final pickedDate = values['lx_add_date'] as DateTime?;
    if (pickedDate == null) return;

    bloc.add(HrEvent.submitReportLCXP(pickedDate));
  }

  void _submitCp(HrState state) {
    FocusScope.of(context).unfocus();

    final formState = _formCpKey.currentState;
    if (formState == null) return;

    final isValid = formState.saveAndValidate();
    if (!isValid) return;

    final values = formState.value;

    final error = ValidateHelper.validateCpReport(
      date: values['cp_add_date'] as DateTime?,
      works: state.works,

      getFilmId: (w) => w.filmManagementDetailId,
      getQuantity: (w) => w.quantity,
      getActualTime: (w) => w.timeActual,
      getPerformanceActual: (w) => w.performanceActual,
      getPercentage: (w) => w.percentage,
    );

    if (error != null) {
      context.showMessage(error, type: SnackBarType.error);
      return;
    }

    final pickedDate = values['cp_add_date'] as DateTime?;
    if (pickedDate == null) return;

    bloc.add(HrEvent.submitReportLCXP(pickedDate));

  }
}
