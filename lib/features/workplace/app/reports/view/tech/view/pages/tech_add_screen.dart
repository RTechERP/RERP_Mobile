import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_add_work_item.dart';

class TechAddScreen extends StatefulWidget {
  final List<CopyNullResponse>? copyItems;
  final List<ProjectResponse>? rtcProject; // Thêm biến rtcProject

  const TechAddScreen({super.key, this.copyItems, this.rtcProject});

  @override
  State<TechAddScreen> createState() => _TechAddScreenState();
}

class _TechAddScreenState
    extends BaseState<TechAddScreen, TechEvent, TechState, TechBloc> {
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
    bloc.add(TechEvent.initAdd(
      copyItems: widget.copyItems ?? [],
      rtcProject: widget.rtcProject ?? [],
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo báo cáo'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_circle_outline, ),
                onPressed: () {
                  context.push(RouteNames.regworkOvertimeAdd);
                },
                color: AppColors.primaryERP,

              ),
            ],
          ),
          body: BlocBuilder<TechBloc, TechState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: FormBuilder(
                      key: _screenFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: {'location_type': state.locationType},
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                isRequired: true,
                                validator: (v) {
                                  if (v == null)
                                    return 'Vui lòng chọn ngày báo cáo';
                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== PROJECT + WORK =====
                            FormCard(
                              title: 'Nội dung báo cáo',
                              child: BlocBuilder<TechBloc, TechState>(
                                buildWhen: (prev, curr) =>
                                    prev.projects != curr.projects ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex ||
                                    prev.selectedProject !=
                                        curr.selectedProject,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                                .withValues(alpha:
                                                                  0.1,
                                                                )
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                      border: Border.all(
                                                        color: isActive
                                                            ? AppColors
                                                                  .primaryERP
                                                            : Colors
                                                                  .grey
                                                                  .shade300,
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
                                                            color: isActive
                                                                ? AppColors
                                                                      .primaryERP
                                                                : Colors
                                                                      .black87,
                                                            fontWeight: isActive
                                                                ? FontWeight
                                                                      .w600
                                                                : FontWeight
                                                                      .normal,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            bloc.add(
                                                              TechEvent.removeProject(
                                                                tempId: project
                                                                    .tempId,
                                                              ),
                                                            );
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 16,
                                                            color: Colors
                                                                .redAccent,
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
                                              color: AppColors.primaryERP,

                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// ===== SELECT PROJECT NAME (bind API) =====
                                      if (state.selectedProject != null)
                                        GestureDetector(
                                          key: ValueKey(
                                            'project_${state.selectedProject!.tempId}_${state.selectedProject?.projectId}',
                                          ),
                                          onTap: () {
                                            openSelectBottomSheet(
                                              context: context,
                                              title: 'Chọn dự án',
                                              items: state.rtcProject,
                                              displayText: (v) =>
                                                  '${v.projectCode} - ${v.projectName}',
                                              onSelected: (v) {
                                                final tempId = state
                                                    .selectedProject!
                                                    .tempId;

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
                                                  'tech_add_project_${state.selectedProject!.tempId}_${state.selectedProject?.projectId}',
                                              nameTextField:
                                                  'tech_project_${state.selectedProject!.tempId}_${state.selectedProject?.projectId}',
                                              label: 'Chọn dự án',
                                              readOnly: true,
                                              icon: Icons.work_outline,
                                              initialValue:
                                                  state
                                                          .selectedProject!
                                                          .projectId !=
                                                      null
                                                  ? '${state.selectedProject!.projectCode} - ${state.selectedProject!.name}'
                                                  : null,
                                              isRequired: true,
                                              validator: (v) {
                                                if (v == null ||
                                                    v.trim().isEmpty) {
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
                                              final codeText =
                                                  work.code.isNotEmpty
                                                  ? work.code
                                                  : 'Công việc ${wIndex + 1}';

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8.0,
                                                ),
                                                child: TechAddWorkItem(
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
                                      bloc.add(
                                        TechEvent.updateLocation(type: v),
                                      );
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
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                initialValue: state.planNextDay ?? '',
                                onChanged: (v) {
                                  if (v == null) return;

                                  bloc.add(TechEvent.updatePlanNextDay(v));
                                },
                                isRequired: true,
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng nhập kế hoạch ngày tiếp theo';
                                  }
                                  return null;
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
                                      nameForm: 'tech_add_problem',
                                      nameTextField: 'problem',
                                      label: 'Vấn đề phát sinh',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction
                                          .newline, // ⬅ Enter xuống dòng
                                      initialValue: state.problem ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          TechEvent.updateExtraInfo(problem: v),
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
                                      initialValue: state.problemSolve ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          TechEvent.updateExtraInfo(
                                            problemSolve: v,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 8),

                                    FormInputField(
                                      icon: Icons.report_problem_outlined,
                                      nameForm: 'tech_add_backlog',
                                      nameTextField: 'block',
                                      label: 'Tồn đọng',
                                      maxLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction
                                          .newline, // ⬅ Enter xuống dòng
                                      initialValue: state.backlog ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          TechEvent.updateExtraInfo(backlog: v),
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
                                      initialValue: state.note ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          TechEvent.updateExtraInfo(note: v),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: FormActions(
                      mode: FormActionMode.add,
                      onSubmit: () async {
                        FocusScope.of(context).unfocus();

                        final formState = _screenFormKey.currentState;
                        if (formState == null) return;

                        final isValid = formState.saveAndValidate();
                        if (!isValid) {
                          FormHelper.focusFirstError(
                            formState: formState,
                            priorityFields: [
                              'tech_add_date', // Ngày báo cáo
                              'tech_add_project', // Dự án
                              'tech_add_category', // Hạng mục
                              'tech_add_total', // Tổng giờ
                              'tech_add_percent', // Tiến độ
                              'tech_add_content', // Nội dung
                              'tech_add_result', // Kết quả
                            ],
                          );
                          return;
                        }

                        final values = formState.value;

                        final error = ValidateHelper.validateReport<TechWork>(
                          date: values['tech_add_date'] as DateTime?,
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
                          showMessage(context, error, type: SnackBarType.error);
                          return;
                        }

                        final pickedDate = values['tech_add_date'] as DateTime;
                        bloc.add(const TechEvent.resetSubmitFlags());
                        bloc.add(TechEvent.submitReport(pickedDate));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        BlocListener<TechBloc, TechState>(
          listenWhen: (p, c) =>
              p.submitSuccess != c.submitSuccess ||
              p.sendMailSuccess != c.sendMailSuccess ||
              p.status != c.status ||
              p.message != c.message,
          listener: (context, state) async {
            // Hiển thị lỗi nếu có
            if (state.status == BaseStateStatus.failed &&
                state.message != null &&
                state.message!.isNotEmpty) {
              showMessage(context, state.message!, type: SnackBarType.error);
              return;
            }

            // Sau khi Submit thành công, tự động gọi hàm Send Mail
            if (state.submitSuccess == true && state.sendMailSuccess == false) {
              final formState = _screenFormKey.currentState;
              final pickedDate = formState?.value['tech_add_date'] as DateTime?;
              if (pickedDate != null) {
                bloc.add(
                  TechEvent.sendMailReport(
                    pickedDate: pickedDate,
                    context: context,
                  ),
                );
              }
            }

            // Sau khi Send Mail thành công, copy text, chia sẻ và thoát màn hình
            if (state.sendMailSuccess == true) {
              final formState = _screenFormKey.currentState;
              final pickedDate = formState?.value['tech_add_date'] as DateTime?;
              
              if (pickedDate != null) {
                final text = DialogService.buildMailPreviewText(
                  state,
                  pickedDate,
                );

                await Clipboard.setData(ClipboardData(text: text));

                if (context.mounted) {
                  final box = context.findRenderObject() as RenderBox?;
                  if (box != null) {
                    try {
                      Share.share(
                        text,
                        subject: 'Báo cáo công việc',
                        sharePositionOrigin: box.localToGlobal(Offset.zero) &
                            box.size,
                      );
                    } catch (e) {
                      debugPrint('Lỗi share: $e');
                    }
                  }
                  
                  context.pop(true);
                }
              }
            }
          },
          child: const SizedBox.shrink(),
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
}
