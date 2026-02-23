import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_tab_work_item.dart';

class TechEditScreen extends StatefulWidget {
  const TechEditScreen({super.key});

  @override
  State<TechEditScreen> createState() => _TechEditScreenState();
}

class _TechEditScreenState
    extends BaseState<TechEditScreen, TechEvent, TechState, TechBloc> {
  final _screenFormKey = GlobalKey<FormBuilderState>();
  bool _showExtraInfo = false;

  DateTime? _initialReportDate() {
    final now = DateTime.now();

    // 09:00 hôm nay
    final todayAt9 = DateTime(now.year, now.month, now.day, 9);

    // Nếu trước 09:00 => null, sau 09:00 => now
    if (now.isBefore(todayAt9)) return null;
    return now;
  }
  @override
  void initState() {
    super.initState();
    bloc.add(const TechEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: AppBarCommon(title: const Text('Tạo báo cáo')),
          body: BlocBuilder<TechBloc, TechState>(
            builder: (context, state) {
              return Stack(
                children: [
                  FormBuilder(
                    key: _screenFormKey,
                    initialValue: {'location_type': state.locationType},
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        /// ===== NGÀY =====
                        FormCard(
                          child: FormDateTimePicker(
                            icon: Icons.calendar_today,
                            nameForm: 'tech_add_date',
                            nameTimePicker: 'date_time',
                            label: 'Ngày báo cáo',
                            inputType: InputType.date,
                            initialValue: _initialReportDate(),
                            format: DateFormat('dd/MM/yyyy'),
                            validator: (v) {
                              if (v == null) {
                                return 'Vui lòng chọn Ngày báo cáo';
                              }
                              return null;
                            },
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
                              if (state.projects.isEmpty) {
                                return CustomTextButton(
                                  width: double.infinity,
                                  bgColor: AppColors.grayColor[10],
                                  colorText: AppColors.primaryERPlight,
                                  buttonFn: () {
                                    bloc.add(
                                      const TechEvent.addEmptyProject(),
                                    ); // ✅ đổi event
                                  },
                                  child: const Text('Thêm dự án'),
                                );
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// ===== TAB PROJECT =====
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...state.projects.map((project) {
                                          final isActive =
                                              project.tempId ==
                                                  state.selectedProject?.tempId;

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
                                                  color: isActive
                                                      ? AppColors.primaryERP
                                                      .withOpacity(0.1)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: isActive
                                                        ? AppColors.primaryERP
                                                        : Colors.grey.shade300,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      project.projectCode ?? '',
                                                      style: TextStyle(
                                                        color: isActive
                                                            ? AppColors
                                                            .primaryERP
                                                            : Colors.black87,
                                                        fontWeight: isActive
                                                            ? FontWeight.w600
                                                            : FontWeight.normal,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    GestureDetector(
                                                      onTap: () {
                                                        bloc.add(
                                                          TechEvent.removeProject(
                                                            tempId:
                                                            project.tempId,
                                                          ),
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        size: 16,
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),

                                        /// ➕ ADD PROJECT
                                        IconButton(
                                          onPressed: () {
                                            bloc.add(
                                              const TechEvent.addEmptyProject(),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
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
                                          items:
                                          state.rtcProject, // List<Project>
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
                                          'tech_add_project_${state.selectedProject!.tempId}',
                                          nameTextField:
                                          'tech_project_${state.selectedProject!.tempId}',
                                          label:
                                          state.selectedProject?.name ?? '',
                                          readOnly: true,
                                          icon: Icons.work_outline,
                                          initialValue:
                                          state.selectedProject!.name,
                                          validator: (_) {
                                            if ((state
                                                .selectedProject
                                                ?.projectId ??
                                                0) ==
                                                0) {
                                              return 'Vui lòng chọn dự án';
                                            }
                                            return null;
                                          },
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
                                      final codeText = work.code.isNotEmpty
                                          ? work.code
                                          : 'Công việc ${wIndex + 1}';

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8.0,
                                        ),
                                        child: TechTabWorkItem(
                                          key: ValueKey(work.id),
                                          report: work,
                                          readonly: false,
                                          title: hasData
                                              ? codeText
                                              : 'Công việc ${wIndex + 1}',
                                          index: wIndex,
                                          isExpanded:
                                          state.expandedWorkIndex ==
                                              wIndex,
                                          onToggleExpand: () {
                                            bloc.add(
                                              TechEvent.expandWork(
                                                index: wIndex,
                                              ),
                                            );
                                          },
                                          onDelete: () {
                                            bloc.add(
                                              TechEvent.removeWork(
                                                index: wIndex,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),

                                  const SizedBox(height: 8),

                                  /// ===== ADD WORK =====
                                  Center(
                                    child: InkResponse(
                                      onTap: () {
                                        bloc.add(const TechEvent.addWork());
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
                                  name: 'tech_add_rtc_location',
                                  label: '',
                                  icon: Icons.location_on_outlined,
                                  initialValue: 'VP RTC',
                                )
                              else
                                FormInputField(
                                  icon: Icons.location_on_outlined,
                                  nameForm: 'tech_add_location',
                                  nameTextField: 'tech_add_other_location',
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
                                  validator: FormBuilderValidators.required(
                                    errorText: 'Vui lòng chọn nơi làm việc',
                                  ),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        FormCard(
                          title: 'Kế hoạch ngày tiếp theo',
                          child: FormInputField(
                            icon: Icons.next_plan_outlined,
                            nameForm: 'tech_add_next_plan',
                            nameTextField: 'next_plan',
                            label: 'Kế hoạch ngày tiếp theo',
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            textInputAction:
                            TextInputAction.newline, // ⬅ Enter xuống dòng
                            validator: FormBuilderValidators.required(
                              errorText:
                              'Vui lòng nhập kế hoạch ngày tiếp theo',
                            ),
                            onChanged: (v) {
                              if (v == null) return;

                              bloc.add(TechEvent.updatePlanNextDay(v));
                            },
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// ===== EXTRA INFO =====
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: FormCard(
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
                                    icon: Icons.report_problem_outlined,
                                    nameForm: 'tech_add_problem',
                                    nameTextField: 'problem',
                                    label: 'Vấn đề phát sinh',
                                    maxLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction
                                        .newline, // ⬅ Enter xuống dòng
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
                                    nameForm: 'tech_add_problem_solve',
                                    nameTextField: 'problem_solve',
                                    label: 'Hướng giải quyết',
                                    maxLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction
                                        .newline, // ⬅ Enter xuống dòng
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
                                    nameForm: 'tech_add_backlog',
                                    nameTextField: 'block',
                                    label: 'Tồn động',
                                    maxLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction
                                        .newline, // ⬅ Enter xuống dòng
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
                                    nameForm: 'tech_add_note',
                                    nameTextField: 'note',
                                    label: 'Ghi chú/Lý do tồn đọng',
                                    maxLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction
                                        .newline, // ⬅ Enter xuống dòng
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
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FormActions(
                          mode: FormActionMode.add,
                          onSubmit: () {
                            final formState = _screenFormKey.currentState;

                            FocusScope.of(context).unfocus();

                            final isValid =
                                formState?.saveAndValidate() ?? false;
                            if (!isValid) return;

                            final values = formState!.value;
                            final pickedDate =
                            values['tech_add_date'] as DateTime?;
                            if (pickedDate == null) return;

                            // bloc.add(TechEvent.submitReport(pickedDate));

                            DialogService.showMailReport(
                              context: context,
                              state: state,
                              dateReport: pickedDate,
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // ===== FULLSCREEN OVERLAY =====
                ],
              );
            },
          ),
        ),
        BlocBuilder<TechBloc, TechState>(
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
}
