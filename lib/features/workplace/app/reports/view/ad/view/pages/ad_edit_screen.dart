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
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/ad_bloc.dart';

class AdEditScreen extends StatefulWidget {
  final int dailyId;

  const AdEditScreen({super.key, required this.dailyId});

  @override
  State<AdEditScreen> createState() => _AdEditScreenState();
}

class _AdEditScreenState
    extends BaseState<AdEditScreen, AdEvent, AdState, AdBloc> {
  final _contentController = TextEditingController();
  final _resultsController = TextEditingController();
  final _totalHoursController = TextEditingController();
  final _totalOTController = TextEditingController();
  final _backlogController = TextEditingController();
  final _noteController = TextEditingController();

  final _projectController = TextEditingController();
  final _planNextDayController = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  bool _showExtraInfo = false;
  bool _loaded = false;

  DateTime? _parseDate(String? date) {
    if (date == null) return DateTime.now();
    return DateTime.tryParse(date);
  }

  void _bindData(DetailReportNullResponse detail, ProjectResponse? apiProject) {
    if (_loaded) return;

    _contentController.text = detail.content;
    _resultsController.text = detail.results;
    _totalHoursController.text = detail.totalHours.toInt().toString();
    _totalOTController.text = detail.totalHourOT.toInt().toString();
    _backlogController.text = detail.backlog ?? '';
    _noteController.text = detail.note;
    // Dự án: ưu tiên "ProjectCode - ProjectName" (giống dropdown chọn dự án).
    _projectController.text = apiProject != null
        ? '${apiProject.projectCode} - ${apiProject.projectName}'
        : '';
    _planNextDayController.text = detail.planNextDay;

    bloc.add(
      AdEvent.updateWork(
        index: 0,
        projectId: detail.projectId,
        projectName: apiProject?.projectName,
        code: apiProject?.projectCode,
        totalHours: detail.totalHours.toInt(),
        totalHourOT: detail.totalHourOT.toInt(),
        content: detail.content,
        results: detail.results,
        backlog: detail.backlog,
        problem: detail.problem,
        problemSolve: detail.problemSolve,
        note: detail.note,
      ),
    );
    bloc.add(AdEvent.updatePlanNextDay(detail.planNextDay));
    final loc = detail.location;
    if (loc != null && loc.isNotEmpty) {
      if (loc == 'VP RTC') {
        bloc.add(const AdEvent.updateLocation(type: 'rtc', value: 'VP RTC'));
      } else {
        bloc.add(AdEvent.updateLocation(type: 'other', value: loc));
      }
    }

    _loaded = true;
  }

  @override
  void initState() {
    super.initState();

    bloc.add(AdEvent.selectReport(dailyID: widget.dailyId));
    bloc.add(const AdEvent.getProject());
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultsController.dispose();
    _totalHoursController.dispose();
    _totalOTController.dispose();
    _backlogController.dispose();
    _noteController.dispose();
    _projectController.dispose();
    _planNextDayController.dispose();

    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<AdBloc, AdState>(
      listenWhen: (p, c) => p.saveSuccess != c.saveSuccess,
      listener: (context, state) {
        if (state.saveSuccess) {
          showMessage(
            context,
            'Chỉnh sửa báo cáo thành công',
            type: SnackBarType.success,
          );
          context.pop(true);
        }
      },

      child: Stack(
        children: [
          BaseScaffold(
            appBar: const AppBarCommon(title: Text('Chỉnh sửa báo cáo')),

            body: BlocBuilder<AdBloc, AdState>(
              buildWhen: (p, c) =>
              p.selectedReportDetail != c.selectedReportDetail ||
                  p.selectedProject != c.selectedProject ||
                  p.projects != c.projects,

              builder: (context, state) {
                final detail = state.selectedReportDetail;

                if (detail == null || state.projects.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Map ProjectID từ detail với danh sách project-modal đã load.
                ProjectResponse? apiProject;
                for (final p in state.projects) {
                  if (p.id == detail.projectId) {
                    apiProject = p;
                    break;
                  }
                }

                _bindData(detail, apiProject);

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
                                nameForm: 'Ad_edit_date',
                                nameTimePicker: 'date_picker',
                                label: 'Ngày báo cáo',
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                initialValue: _parseDate(detail.dateReport),
                                isRequired: true,
                                validator: (v) {
                                  if (v == null) {
                                    return 'Vui lòng chọn ngày báo cáo';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// PROJECT
                            FormCard(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (state.projects.isEmpty) return;

                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn dự án',
                                        items: state.projects,
                                        displayText: (v) =>
                                        '${v.projectCode} - ${v.projectName}',
                                        onSelected: (item) {
                                          _projectController.text =
                                              item.projectName;

                                          bloc.add(
                                            AdEvent.updateWork(
                                              index: 0,
                                              projectId: item.id,
                                              projectName: item.projectName,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        icon: Icons.category_outlined,
                                        nameForm: 'Ad_project',
                                        nameTextField: 'project',
                                        label: 'Chọn dự án',
                                        controller: _projectController,
                                        readOnly: true,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.trim().isEmpty) {
                                            return 'Vui lòng chọn dự án';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// HOURS
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FormInputField(
                                          icon: Icons.timer_outlined,
                                          nameForm: 'Ad_edit_total',
                                          nameTextField: 'total',
                                          label: 'Tổng giờ',
                                          keyboardType: TextInputType.number,
                                          controller: _totalHoursController,
                                          isRequired: true,
                                          validator: (v) {
                                            if (v == null ||
                                                v.trim().isEmpty) {
                                              return 'Vui lòng nhập tổng giờ';
                                            }
                                            final val = double.tryParse(
                                              v.trim().replaceAll(',', '.'),
                                            );
                                            if (val == null) {
                                              return 'Giá trị không hợp lệ';
                                            }
                                            if (val <= 0) {
                                              return 'Tổng giờ phải > 0';
                                            }
                                            if (val > 24) {
                                              return 'Tổng giờ không > 24';
                                            }
                                            return null;
                                          },
                                          onChanged: (v) {
                                            final value = int.tryParse(v ?? '');
                                            if (value == null)
                                              return; // không update nếu rỗng

                                            bloc.add(
                                              AdEvent.updateWork(
                                                index: 0,
                                                totalHours: value,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      Expanded(
                                        child: FormInputField(
                                          icon: Icons.timer_outlined,
                                          nameForm: 'Ad_edit_ot',
                                          nameTextField: 'ot',
                                          label: 'OT',
                                          keyboardType: TextInputType.number,
                                          controller: _totalOTController,
                                          validator: (v) {
                                            if (v == null || v.trim().isEmpty) {
                                              return null;
                                            }
                                            final val = double.tryParse(
                                              v.trim().replaceAll(',', '.'),
                                            );
                                            if (val == null) {
                                              return 'Giá trị không hợp lệ';
                                            }
                                            if (val < 0) return 'OT không < 0';
                                            if (val > 24) {
                                              return 'OT không > 24';
                                            }
                                            return null;
                                          },
                                          onChanged: (v) {
                                            final value = int.tryParse(v ?? '');
                                            if (value == null) return;

                                            bloc.add(
                                              AdEvent.updateWork(
                                                index: 0,
                                                totalHourOT: value,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  /// CONTENT
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm: 'Ad_edit_content',
                                    nameTextField: 'content',
                                    label: 'Nội dung công việc',
                                    autoExpand: true,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    controller: _contentController,
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) {
                                        return 'Vui lòng nhập nội dung công việc';
                                      }
                                      return null;
                                    },
                                    onChanged: (v) {
                                      if (v == null || v.trim().isEmpty) return;

                                      bloc.add(
                                        AdEvent.updateWork(
                                          index: 0,
                                          content: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 8),

                                  /// RESULT
                                  FormInputField(
                                    icon: Icons.note_outlined,
                                    nameForm: 'Ad_edit_result',
                                    nameTextField: 'result',
                                    label: 'Kết quả',
                                    autoExpand: true,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    controller: _resultsController,
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) {
                                        return 'Vui lòng nhập kết quả';
                                      }
                                      return null;
                                    },
                                    onChanged: (v) {
                                      if (v == null || v.trim().isEmpty) return;

                                      bloc.add(
                                        AdEvent.updateWork(
                                          index: 0,
                                          results: v,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 8),

                                  /// EXTRA
                                  InkWell(
                                    onTap: () => setState(
                                          () => _showExtraInfo = !_showExtraInfo,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _showExtraInfo
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
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
                                      icon: Icons.warning_amber_outlined,
                                      nameForm: 'Ad_edit_backlog',
                                      nameTextField: 'blocking',
                                      label: 'Tồn đọng',
                                      autoExpand: true,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      controller: _backlogController,
                                      onChanged: (v) {
                                        if (v == null || v.trim().isEmpty)
                                          return;

                                        bloc.add(
                                          AdEvent.updateWork(
                                            index: 0,
                                            backlog: v,
                                          ),
                                        );
                                      },
                                    ),

                                    const SizedBox(height: 8),

                                    FormInputField(
                                      icon: Icons.note_outlined,
                                      nameForm: 'Ad_edit_note',
                                      nameTextField: 'note',
                                      label: 'Ghi chú',
                                      autoExpand: true,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      controller: _noteController,
                                      onChanged: (v) {
                                        if (v == null || v.trim().isEmpty)
                                          return;

                                        bloc.add(
                                          AdEvent.updateWork(
                                            index: 0,
                                            note: v,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ],
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
                                      if (v == null || v.trim().isEmpty) return;

                                      bloc.add(
                                        AdEvent.updateLocation(
                                          type: 'other',
                                          value: v,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  if (state.locationType == 'rtc')
                                    const FormReadonlyField(
                                      name: 'Ad_edit_rtc_location',
                                      label: '',
                                      icon: Icons.location_on_outlined,
                                      initialValue: 'VP RTC',
                                    )
                                  else
                                    FormInputField(
                                      icon: Icons.location_on_outlined,
                                      nameForm: 'Ad_edit_location',
                                      nameTextField: 'Ad_edit_other_location',
                                      label: 'Địa điểm làm việc',
                                      initialValue: state.location ?? '',
                                      isRequired: state.locationType == 'other',
                                      validator: (v) {
                                        if (state.locationType != 'other') {
                                          return null;
                                        }
                                        if (v == null || v.trim().isEmpty) {
                                          return 'Vui lòng nhập địa điểm làm việc';
                                        }
                                        return null;
                                      },
                                      onChanged: (v) {
                                        bloc.add(
                                          AdEvent.updateLocation(
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
                                nameForm: 'Ad_add_next_plan',
                                nameTextField: 'next_plan',
                                label: 'Kế hoạch ngày tiếp theo',
                                autoExpand: true,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                controller: _planNextDayController,
                                isRequired: true,
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Vui lòng nhập kế hoạch ngày tiếp theo';
                                  }
                                  return null;
                                },
                                onChanged: (v) {
                                  if (v == null || v.trim().isEmpty) return;

                                  bloc.add(AdEvent.updatePlanNextDay(v));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ACTION
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FormActions(
                        mode: FormActionMode.edit,

                        onCancel: () {
                          context.pop();
                        },
                        onSave: () async {
                          FocusScope.of(context).unfocus();

                          final formState = _formKey.currentState;
                          if (formState == null) return;

                          final isValid = formState.saveAndValidate();
                          if (!isValid) return;

                          final values = formState.value;

                          final error = ValidateHelper.validateAgvAdReport(
                            date: values['Ad_edit_date'] as DateTime?,
                            works: state.works,
                            getProjectName: (w) => _projectController.text,
                            getTotalHours: (w) =>
                                double.tryParse(
                                  _totalHoursController.text
                                      .trim()
                                      .replaceAll(',', '.'),
                                ) ??
                                w.totalHours,
                            getOtHours: (w) =>
                                double.tryParse(
                                  _totalOTController.text
                                      .trim()
                                      .replaceAll(',', '.'),
                                ) ??
                                w.totalHourOT,
                            getContent: (w) => _contentController.text,
                            getResult: (w) => _resultsController.text,
                            locationType: state.locationType,
                            location: state.location,
                            nextPlan: _planNextDayController.text,
                          );

                          if (error != null) {
                            showMessage(
                              context,
                              error,
                              type: SnackBarType.error,
                            );
                            return;
                          }

                          final pickedDate =
                          values['Ad_edit_date'] as DateTime;

                          bloc.add(
                            AdEvent.submitEditReport(
                              pickedDate,
                              widget.dailyId,
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
          BlocBuilder<AdBloc, AdState>(
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
