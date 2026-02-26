import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/tech_model.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_edit_work_item.dart';

class TechEditScreen extends StatefulWidget {
  final int dailyId;
  const TechEditScreen({super.key, required this.dailyId});

  @override
  State<TechEditScreen> createState() => _TechEditScreenState();
}

class _TechEditScreenState
    extends BaseState<TechEditScreen, TechEvent, TechState, TechBloc> {
  final _screenFormKey = GlobalKey<FormBuilderState>();
  bool _showExtraInfo = false;

  final TextEditingController _planNextDayController = TextEditingController();

  final TextEditingController _problemController = TextEditingController();

  final TextEditingController _problemSolveController = TextEditingController();

  final TextEditingController _backlogController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    bloc.add(TechEvent.loadDetailData(dailyID: widget.dailyId));
  }

  @override
  void dispose() {
    _planNextDayController.dispose();
    _problemController.dispose();
    _problemSolveController.dispose();
    _backlogController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TechBloc, TechState>(
          listenWhen: (p, c) => p.saveSuccess != c.saveSuccess,
          listener: (context, state) {
            if (state.saveSuccess == true) {
              context.pop(true);
            }
          },
        ),
        /// ===== FILL DATA CHỈ KHI LOAD XONG =====
        BlocListener<TechBloc, TechState>(
          listenWhen: (p, c) =>
          p.planNextDay != c.planNextDay ||
              p.problem != c.problem ||
              p.problemSolve != c.problemSolve ||
              p.backlog != c.backlog ||
              p.note != c.note,
          listener: (context, state) {
            _planNextDayController.text = state.planNextDay ?? '';
            _problemController.text = state.problem ?? '';
            _problemSolveController.text = state.problemSolve ?? '';
            _backlogController.text = state.backlog ?? '';
            _noteController.text = state.note ?? '';
          },
        ),
      ],
      child: Stack(
        children: [
          BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Chỉnh sửa báo cáo'),
              onBackTap: () => context.pop(),
            ),
            body: BlocBuilder<TechBloc, TechState>(
              builder: (context, state) {
                if (state.projects.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _screenFormKey,
                        initialValue: {'location_type': state.locationType},
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            /// ===== NGÀY =====
                            FormCard(
                              child: FormDateTimePicker(
                                icon: Icons.calendar_today,
                                nameForm: 'tech_edit_date',
                                nameTimePicker: 'date_time',
                                label: 'Ngày báo cáo',
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                initialValue: state.dateReport,
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== PROJECT + WORK =====
                            FormCard(
                              title: 'Dự án',
                              child: BlocBuilder<TechBloc, TechState>(
                                buildWhen: (prev, curr) =>
                                    prev.projects != curr.projects ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex ||
                                    prev.selectedProject != curr.selectedProject,
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// ===== TAB PROJECT =====
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...state.projects.map((project) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    bloc.add(
                                                      TechEvent.selectProject(
                                                        tempId: project.tempId,
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 8,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primaryERP
                                                          .withOpacity(0.1),

                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                      border: Border.all(
                                                        color:
                                                            AppColors.primaryERP,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          project.projectCode ??
                                                              '',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .primaryERP,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// ===== SELECT PROJECT NAME (bind API) =====
                                      if (state.selectedProject != null)
                                        GestureDetector(
                                          onTap: () {
                                            openSelectBottomSheet(
                                              context: context,
                                              title: 'Chọn dự án',
                                              items: state
                                                  .rtcProject, // List<Project>
                                              displayText: (v) =>
                                                  '${v.projectCode} - ${v.projectName}',
                                              onSelected: (v) {
                                                final tempId =
                                                    state.selectedProject!.tempId;

                                                bloc.add(
                                                  TechEvent.bindProjectFromApi(
                                                    tempId: tempId,
                                                    apiProject: v,
                                                  ),
                                                );
                                                bloc.add(
                                                  TechEvent.selectProject(
                                                    tempId: tempId,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: AbsorbPointer(
                                            child: FormInputField(
                                              nameForm:
                                                  'tech_edit_project_${state.selectedProject!.tempId}',
                                              nameTextField:
                                                  'tech_project_${state.selectedProject!.tempId}',
                                              label:
                                                  state.selectedProject?.name ??
                                                  '',
                                              readOnly: true,
                                              icon: Icons.work_outline,
                                              initialValue:
                                                  state.selectedProject!.name,
                                            ),
                                          ),
                                        ),

                                      const SizedBox(height: 8),

                                      /// ===== LIST WORK =====
                                      if (state.selectedProject != null)
                                        ...state.selectedProject!.works
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                              final wIndex = entry.key;
                                              final work = entry.value;

                                              final hasData =
                                                  work.mission.isNotEmpty;
                                              final codeText =
                                                  work.code.isNotEmpty
                                                  ? work.code
                                                  : 'Công việc ${wIndex + 1}';

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8.0,
                                                ),
                                                child: TechEditWorkItem(
                                                  key: ValueKey(work.id),
                                                  report: work,
                                                  readonly: false,
                                                  title: hasData
                                                      ? codeText
                                                      : 'Công việc ${wIndex + 1}',
                                                  index: wIndex,
                                                ),
                                              );
                                            }),
                                    ],
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== LOCATION =====
                            FormCard(
                              title: 'Nơi làm việc',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormBuilderRadioGroup<String>(
                                    name: 'location_type',
                                    initialValue: state.locationType,
                                    options: const [
                                      FormBuilderFieldOption(
                                        value: 'rtc',
                                        child: Text('VP RTC'),
                                      ),
                                      FormBuilderFieldOption(
                                        value: 'other',
                                        child: Text('Địa điểm khác'),
                                      ),
                                    ],
                                    onChanged: (v) {
                                      if (v == null) return;
                                      bloc.add(TechEvent.updateLocation(type: v));
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  if (state.locationType == 'rtc')
                                    const FormReadonlyField(
                                      name: 'tech_edit_rtc_location',
                                      label: '',
                                      icon: Icons.location_on_outlined,
                                      initialValue: 'VP RTC',
                                    )
                                  else
                                    FormInputField(
                                      icon: Icons.location_on_outlined,
                                      nameForm: 'tech_edit_location',
                                      nameTextField: 'tech_edit_other_location',
                                      label: 'Địa điểm làm việc',
                                      initialValue: state.location ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          TechEvent.updateLocation(
                                            type: 'other',
                                            value: v,
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),

                            FormCard(
                              title: 'Kế hoạch ngày tiếp theo',
                              child: FormInputField(
                                icon: Icons.next_plan_outlined,
                                nameForm: 'tech_edit_next_plan',
                                nameTextField: 'next_plan',
                                label: 'Kế hoạch ngày tiếp theo',
                                maxLines: 3,
                                keyboardType: TextInputType.multiline,
                                textInputAction:
                                    TextInputAction.newline, // ⬅ Enter xuống dòng
                                controller: _planNextDayController,
                                onChanged: (v) {
                                  if (v == null) return;

                                  bloc.add(TechEvent.updatePlanNextDay(v));
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== EXTRA INFO =====
                            FormCard(
                              title: 'Thông tin bổ sung',
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => setState(
                                      () => _showExtraInfo = !_showExtraInfo,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _showExtraInfo
                                              ? Icons.keyboard_arrow_up_rounded
                                              : Icons
                                                    .keyboard_arrow_down_rounded,
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
                                      icon: Icons.report_problem_outlined,
                                      nameForm: 'tech_edit_problem',
                                      nameTextField: 'problem',
                                      label: 'Vấn đề phát sinh',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction
                                          .newline, // ⬅ Enter xuống dòng
                                      controller: _problemController,
                                      onChanged: (v) {
                                        if (state.expandedWorkIndex == null) {
                                          return;
                                        }
                                        bloc.add(
                                          TechEvent.updateWork(
                                            index: state.expandedWorkIndex!,
                                            content: v,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),

                                    FormInputField(
                                      icon: Icons.report_problem_outlined,
                                      nameForm: 'tech_edit_problem_solve',
                                      nameTextField: 'problem_solve',
                                      label: 'Hướng giải quyết',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction
                                          .newline, // ⬅ Enter xuống dòng
                                      controller: _problemSolveController,
                                      onChanged: (v) {
                                        if (state.expandedWorkIndex == null) {
                                          return;
                                        }
                                        bloc.add(
                                          TechEvent.updateWork(
                                            index: state.expandedWorkIndex!,
                                            content: v,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),

                                    FormInputField(
                                      icon: Icons.report_problem_outlined,
                                      nameForm: 'tech_edit_backlog',
                                      nameTextField: 'block',
                                      label: 'Tồn động',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      controller: _backlogController,
                                      onChanged: (v) {
                                        if (state.expandedWorkIndex == null) {
                                          return;
                                        }
                                        bloc.add(
                                          TechEvent.updateWork(
                                            index: state.expandedWorkIndex!,
                                            content: v,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),

                                    FormInputField(
                                      icon: Icons.report_problem_outlined,
                                      nameForm: 'tech_edit_note',
                                      nameTextField: 'note',
                                      label: 'Ghi chú/Lý do tồn đọng',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction
                                          .newline, // ⬅ Enter xuống dòng
                                      controller: _noteController,
                                      onChanged: (v) {
                                        if (state.expandedWorkIndex == null) {
                                          return;
                                        }
                                        bloc.add(
                                          TechEvent.updateWork(
                                            index: state.expandedWorkIndex!,
                                            content: v,
                                          ),
                                        );
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: FormActions(
                        mode: FormActionMode.edit,

                        onCancel: () {
                          context.pop();
                        },
                        onSave: () async {
                          FocusScope.of(context).unfocus();

                          final formState = _screenFormKey.currentState;
                          if (formState == null) return;

                          final isValid = formState.saveAndValidate();
                          if (!isValid) return;

                          final values = formState.value;

                          final error = ValidateHelper.validateReport<TechWork>(
                            date: values['tech_edit_date'] as DateTime?,
                            projectId: state.selectedProject?.projectId ?? 0,
                            works: state.selectedProject?.works ?? [],
                            locationType: state.locationType,
                            location: state.location,
                            nextPlan: values['next_plan'] as String?,
                            getProjectItemId: (w) => w.projectItemId,
                            getTotalHours: (w) => w.totalHours,
                            getOtHours: (w) => w.totalHourOT,
                            getPercent: (w) => w.percentComplete,
                            getContent: (w) => w.content,
                            getResult: (w) => w.results,
                          );

                          if (error != null) {
                            showMessage(
                              context,
                              error,
                              type: SnackBarType.error,
                            );
                            return;
                          }

                          final pickedDate = values['tech_edit_date'] as DateTime;

                          await DialogService.showMailReport(
                            isEdit: true,
                            context: context,
                            state: state,
                            dateReport: pickedDate,
                            onSubmit: () async {
                              bloc.add(const TechEvent.resetSubmitFlags());
                              bloc.add(
                                TechEvent.submitEditReport(
                                  pickedDate,
                                  widget.dailyId,
                                ),
                              );
                            },
                            onSendMail: () async {
                              bloc.add(
                                TechEvent.sendMailReport(
                                  pickedDate: pickedDate,
                                  context: context,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                  ],
                );
              },
            ),
          ),
          BlocBuilder<TechBloc, TechState>(
            buildWhen: (p, c) => p.isSaving != c.isSaving,
            builder: (context, state) {
              if (!state.isSaving) {
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
      ),
    );
  }
}
