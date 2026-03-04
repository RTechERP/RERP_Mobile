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

class HrEditScreen extends StatefulWidget {
  final int dailyId;
  final DepartmentType? type;

  const HrEditScreen({super.key, required this.dailyId, this.type});

  @override
  State<HrEditScreen> createState() => _HrEditScreenState();
}

class _HrEditScreenState
    extends BaseState<HrEditScreen, HrEvent, HrState, HrBloc> {

  @override
  void initState() {
    super.initState();
    bloc.add(HrEvent.selectReport(dailyID: widget.dailyId));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<HrBloc, HrState>(
          listenWhen: (p, c) =>
              p.detailReport != c.detailReport ||
              p.saveSuccess != c.saveSuccess,
          listener: (context, state) {
            /// SAVE SUCCESS -> POP TRUE
            if (state.saveSuccess) {
              context.pop(true);
            }

            final detail = state.selectedReportDetail;
            if (detail == null) return;
          },
          child: BaseScaffold(
            appBar: const AppBarCommon(title: Text('Chỉnh sửa báo cáo')),
            body: _buildBody(),
          ),
        ),
        BlocBuilder<HrBloc, HrState>(
          buildWhen: (p, c) =>
          p.detailReport != c.detailReport || p.saveSuccess != c.saveSuccess,
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
    switch (widget.type) {
      case DepartmentType.hr_admin:
        return _HrEditAdminView(dailyId: widget.dailyId);
      case DepartmentType.hr_lxcp:
        return const Center(child: Text('Edit HR - LXCP'));
      default:
        return const Center(child: Text('Không xác định loại HR'));
    }
  }
}

class _HrEditAdminView extends StatefulWidget {
  final int dailyId;

  const _HrEditAdminView({required this.dailyId});

  @override
  State<_HrEditAdminView> createState() => _HrEditAdminViewState();
}

class _HrEditAdminViewState extends State<_HrEditAdminView> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _contentController = TextEditingController();
  final _resultController = TextEditingController();
  final _planController = TextEditingController();
  final _noteController = TextEditingController();
  final _backlogController = TextEditingController();
  bool _showExtraInfo = false;
  late HrBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = context.read<HrBloc>();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultController.dispose();
    _planController.dispose();
    _noteController.dispose();
    _backlogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        if (state.isLoadingDetail) {
          return const Center(child: CircularProgressIndicator());
        }

        final detail = state.selectedReportDetail;
        if (detail == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }


        return Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: _formKey,
                initialValue: {'date': DateTime.tryParse(detail.dateReport)},
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    FormCard(
                      child: FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: 'hr_edit_date',
                        nameTimePicker: 'date_time',
                        label: 'Ngày báo cáo',
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        initialValue: DateTime.tryParse(detail.dateReport),
                      ),
                    ),

                    const SizedBox(height: 12),

                    FormCard(
                      title: 'Nội dung công việc',
                      child: FormInputField(
                        icon: Icons.note_alt_outlined,
                        nameForm: 'hr_edit_content',
                        nameTextField: 'content',
                        label: 'Nội dung công việc',
                        maxLines: 4,
                        controller: _contentController,
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(content: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    FormCard(
                      title: 'Kết quả',
                      child: FormInputField(
                        icon: Icons.task_alt_outlined,
                        nameForm: 'hr_edit_result',
                        nameTextField: 'result',
                        label: 'Kết quả đạt được',
                        maxLines: 4,
                        controller: _resultController,
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(results: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    FormCard(
                      title: 'Kế hoạch ngày tiếp theo',
                      child: FormInputField(
                        icon: Icons.next_plan_outlined,
                        nameForm: 'hr_edit_next_plan',
                        nameTextField: 'next_plan',
                        label: 'Kế hoạch ngày tiếp theo',
                        maxLines: 4,
                        controller: _planController,
                        onChanged: (v) {
                          bloc.add(HrEvent.updateWork(planNextDay: v));
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    FormCard(
                      title: 'Thông tin bổ sung',
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _showExtraInfo = !_showExtraInfo;
                              });
                            },
                            child: const Text(
                              'Hiện / Ẩn thông tin bổ sung',
                              style: TextStyle(
                                color: AppColors.primaryERP,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          if (_showExtraInfo) ...[
                            const SizedBox(height: 12),

                            FormInputField(
                              icon: Icons.warning_amber_outlined,
                              nameForm: 'hr_edit_blocking',
                              nameTextField: 'blocking',
                              label: 'Tồn đọng',
                              maxLines: 2,
                              controller: _backlogController,
                              onChanged: (v) {
                                bloc.add(HrEvent.updateWork(backlog: v));
                              },
                            ),

                            const SizedBox(height: 8),

                            FormInputField(
                              icon: Icons.note_outlined,
                              nameForm: 'hr_edit_note',
                              nameTextField: 'blocking_reason',
                              label: 'Ghi chú',
                              maxLines: 2,
                              controller: _noteController,
                              onChanged: (v) {
                                bloc.add(HrEvent.updateWork(note: v));
                              },
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

                  bloc.add(
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
